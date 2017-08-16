/*
ArmA.Network
Rathbone
handles Damage for Takistan
life_rambofactor = 1;
*/
_unit = _this select 0;
_hitPoint = _this select 1;
_amountOfDamage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
_hitPartIndex = _this select 5;
_damagep = getDammage player;
_epHalf = _damagep / 2;
_isVehicleSource = ((_this select 3) != vehicle (_this select 3));
_bleedingRate = player getVariable "BleedRate";
_newRate = _bleedingRate + 5;
_dog = round(random(10));
if (life_god) exitwith {hint "You took damage but you're in god mode"};
if (_isVehicleSource && _source isKindOf "Land") exitwith {if(_dog < 2) then {player setVariable ["BleedRate", _newRate, true];_amountOfDamage = 0;player setdamage _epHalf;} else {player setVariable ["BleedRate", _bleedingRate, true]};_amountOfDamage = 0;player setdamage _epHalf;};
life_combat_lastTick = diag_tickTime;



if(!isNull _source) then {
	if(_source != _unit) then {
		//If Deadbody -> Exit
		//if(!(_unit getVariable["Revive",false])) exitWith {};
		// if there is a projectile, its not roadkill.
		if!(isNil "_projectile")then{
			// Taser checks.
			_curWep = currentWeapon _source;
			if(_projectile in ["DDOPP_B_Taser","B_9x21_Ball"] && _curWep in ["DDOPP_X26","hgun_P07_snds_F"]) exitwith {
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "DDOPP_B_Taser") then {25} else {10};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};

				_amountOfDamage = 0; // set the damage to his old damage.
				if(_unit distance _source < _distance) then {
					  if(!life_istazed && {alive _unit} && {!(_unit getVariable ["restrained",false])}) then {
						if(_isVehicle && _isQuad) exitwith {
							player action ["GetOut",vehicle player];
							player setVariable ["BleedRate", _bleedingRate,true];
							[_unit,_source] spawn life_fnc_chejacayuc;
						};
						if(!_isVehicle) exitwith {
							[_unit,_source] spawn life_fnc_chejacayuc;
							player setVariable ["BleedRate", _bleedingRate,true];
						};
					};
				};
			};
		};
	};
};

diag_log format["Shot by %1 with UID %2",name (_unit getvariable "lastHit"),uidshooter];

if(((velocity _unit) select 2 < -5) and (vehicle _unit isEqualTo _unit)) then {
  _unit setVariable ["isFalling",true];
};
if(_unit getVariable "isFalling") then {
  _amountOfDamage = _amountOfDamage * 2;
};
_unit setVariable ["isFalling",false];

if (_hitPoint isEqualTo "") then {
	_amountOfDamage = _amountOfDamage - (damage _unit);
} else {
	_dmg = _unit getHit _hitPoint;
	_amountOfDamage = _amountOfDamage - _dmg;
};
if(vest player != "") then {_amountOfDamage = _amountOfDamage / 2};

_return = _amountOfDamage / life_rambofactor;
_agony = false;
_dead = false;
switch (toLower _hitPoint) do {
  case "": {
    _newDamage = (damage vehicle _unit) + _return;
    if(_newDamage > 0.94) then {
      _agony = true;
      _newDamage = 0.98;
    };
    _unit setHit ["body",_newDamage];
  };

  case "body": {	// die till 1.0, no overall damage
    _newDamage = (_unit getHit "body") + _return;
    if(_newDamage > 0.99) then {
      _agony = true;
      _dead = true;
      _newDamage = 0.99;
    };
    _unit setHit ["body",_newDamage];
  };

  case "head": {	// die till 1.0, no overall damage
    if (_amountOfDamage > 20) exitWith {};	// ghost-dead-bug
    _newDamage = (_unit getHit "head") + _return;
    if(_newDamage > 0.75) then {
      _agony = true;
      _dead = true;
      _newDamage = 1;
    };
    _unit setHit ["head",_newDamage];
  };

  case "legs": {	// cant die, no overall damage
    _newDamage = (_unit getHit "legs") + _return;
    if(_newDamage > 1.8) then {
      _agony = true;
    };
    _unit setHit ["legs",_newDamage];
  };

  case "hands": {	// cant die, no overall damage
    _newDamage = (_unit getHit "hands") + _return;
    _involFireRoll = random 1;
    if (_involFireRoll < InvoluntaryFireChance) then
    {
      player forceWeaponFire [currentWeapon player, currentWeaponMode player];
    };
    if(_newDamage > 3) then {
      _agony = true;
    };
    _unit setHit ["hands",_newDamage];
  };
  default {};
};
_overall_damage = ((_unit getHit "head") * 0.7) + ((_unit getHit "body") * 0.5) + ((_unit getHit "legs") * 0.3) + ((_unit getHit "hands") * 0.15);
if (_overall_damage > 0.99) then {
  _overall_damage = _overall_damage;
};
("PainFlashLayer" call BIS_fnc_rscLayer) cutRsc ["PainFlash","PLAIN",_overall_damage*PainFlashCoeff,true];
//if(_dead) then {_overall_damage = 1;}; If this is not on will it not say the killed themselves?
_addBleed = _overall_damage*BleedCoeff;
_bleedRate = player getVariable "BleedRate";
_newBleedRate = _bleedRate + _addBleed;
if(_newBleedRate < 1) then {_newBleedRate = 0;};
player setVariable ["BleedRate", _newBleedRate, true];
_instantBleed = _overall_damage*InstantBleedCoeff;
_bloodLevel = player getVariable "BloodLevel";
_newBloodLevel = _bloodLevel - _instantBleed;
//if (_newBloodLevel <= 0) then {_overall_damage = 1;};
player setVariable ["BloodLevel", _newBloodLevel, true];
_lifeState = player getVariable "LifeState";
_unconcsChance = ((1 - _newBloodLevel/5500)*((_amountOfDamage + _newBleedRate)/100))*InstantUnconcsCoeff;
_unconcsRoll = random 1;
if ((_unconcsRoll > (1 - _unconcsChance)) && (_lifeState isEqualTo 0)) then
{
  "instant" spawn life_fnc_koeflapienlabr;
};
_overall_damage
