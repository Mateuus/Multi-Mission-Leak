/*
	File: fn_handleDamage.sqf
	Author: John "Paratus" VanderZwet & Skalicon
	
	Description:
	Handles special damage events
*/
private["_unit","_damage","_source","_projectile","_hitBox","_curWep","_driver","_luck","_doBreak"];
_unit = _this select 0;
_hitBox = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
_curWep = "";
_curMag = "";

if (!alive _unit) exitWith {};

if (_projectile != "") then { [_source] call life_fnc_setAggressive; };

if(isPlayer _source && _source isKindOf "Man") then {
	_curWep = currentWeapon _source;
	_curMag = currentMagazine _source;
};

// Prison and court!
if ((life_is_arrested && !life_laser_inprogress) || !isNil "life_jury_active") then
{
	_damage = 0;
};

if ((vehicle _unit) isKindOf "Car" && (isNull _source || _source == _unit)) then
{
	if (life_seatbelt) then { _damage = _damage / 2 };
};

// Stun grenades
if (_projectile in ["mini_Grenade"]) then{
	_damage = 0;
	[] spawn life_fnc_handleFlashbang;
};
//systemChat format["_source = %1, _projectile = %2, _curMag = %3, _curWep = %4", _source, _projectile, _curMag, _curWep];
//rubber bullets or vehicle death
if (_source != _unit && !(playerSide == west && _projectile == "") && !(_projectile in ["GrenadeHand","mini_Grenade",""]) && ((_curMag in ["30Rnd_65x39_caseless_mag_Tracer","30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Green","hlc_30rnd_556x45_SPR","29rnd_300BLK_STANAG_S","hlc_30Rnd_9x19_SD_MP5","CUP_8Rnd_B_Beneli_74Slug"]) || (_curWep in ["RH_m9","SMG_02_F","hgun_P07_F","hgun_P07_snds_F"])) OR (side _source == west && "acc_pointer_IR" in (primaryWeaponItems _source) && (currentWeapon _source) == "srifle_DMR_03_F") OR (side _source == west && "acc_pointer_IR" in (primaryWeaponItems _source) && (currentWeapon _source) == "hlc_rifle_bcmjack")) then {
	//if (!(_hitBox in ["","head","body"])) exitWith {_damage = 0;0};
	//systemChat format["getDammage _unit = %1, _hitBox = '%2', getHit _hitBox = %3, _damage = %4", getDammage _unit, _hitBox, _unit getHit _hitBox, _damage];
	//diag_log format["_source = %1, _projectile = %2, _curMag = %3, _curWep = %4", _source, _projectile, _curMag, _curWep];
	//diag_log format["getDammage _unit = %1, _hitBox = %2, getHit _hitBox = %3, _damage = %4", getDammage _unit, _hitBox, _unit getHit _hitBox, _damage];
	_hitDam = if (_hitBox == "") then { damage _unit } else { (_unit getHit _hitBox) };
	if (getDammage _unit >= 0.95 || (_hitDam + _damage >= 0.95)) then {
		_damage = 0;
		[_source] spawn life_fnc_handleDowned;
	};
};

//systemChat format["[AFTER] _damage = %1", _damage];

/* //IR Laser non-lethal
if(side _source == west && "acc_pointer_IR" in (primaryWeaponItems _source)) then
{
	if ((((getDammage _unit) + _damage) >= 0.90) || (_damage >= 0.95)) then {
		_damage = 0;
		[_source] spawn life_fnc_handleDowned;
	};
}; */

//laser tag'd!
if (life_laser_inprogress) then
{
	if (((((getDammage _unit) + _damage) >= 0.95) || (_damage >= 0.95)) && ((player getVariable ["laserTeam",0]) != (_source getVariable ["laserTeam",0]))) then
	{
		[_source] spawn life_fnc_handleTagged;
	};
	_damage = 0;
};

if ((vehicle _source isKindOf "LandVehicle") && _source != _unit && driver (vehicle _source) == _source && vehicle _unit == _unit) then
{
	if ((((getDammage _unit) + _damage) >= 0.95) || (_damage >= 0.95)) then {
		_damage = 0;
		if(alive (driver _source) && side (driver _source) != west && (time - life_last_vdm) > 5) then
		{
			life_last_vdm = time;
			serv_killed = [(driver _source),"187V"];
			publicVariableServer "serv_killed";
		};
	};
};

if ((((getDammage _unit) + _damage) >= 0.95) || (_damage >= 0.95)) then
{
	life_dead_gear = [player] call life_fnc_fetchDeadGear;
};

if (_damage > 0.4 && (!isPlayer _source || (vehicle _source isKindOf "LandVehicle"))) then
{
	if (_hitBox == "legs") then {
		_doBreak = true;
		if (47 in life_talents) then
		{
			_luck = floor (random 2);
			if (_luck == 0) exitWith {systemChat "Someone less hardy could have been seriously injured.";_doBreak = false;};
		};
		if (_doBreak) then { [true] spawn life_fnc_brokenLeg; };
	};
};

if ((_unit getVariable ["restrained",false]) && !(_unit getVariable ["isCivRestrained",false]) && (isPlayer _source) && (vehicle _unit != vehicle _source) && !(_projectile in ["HandGrenade"])) then
{
	_damage = 0;
};

[] call life_fnc_hudUpdate;
_damage;