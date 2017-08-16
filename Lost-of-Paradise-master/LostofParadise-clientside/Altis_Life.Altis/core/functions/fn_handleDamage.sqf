/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

//Internal Debugging.
if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile in ["B_45ACP_Ball","B_556x45_Ball_Tracer_Yellow"] && _curWep in ["hgun_Pistol_heavy_01_F","arifle_TRG20_F"]) then {
			if(side _source == west && playerSide != west) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = 200;
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				_damage = false;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["Re-strained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			};
			
			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = false;
			};
		};
	};
};

if (vehicle _unit == _unit) then
{
    if ( _source isKindOf "Car" OR _source isKindOf "Boat" ) then
    {
        _damage = false;
        [_unit,_source] spawn life_fnc_vdmed; //_Source is Vehicle, Not a player driving a vehicle
    }
    else
    {    
        _vehicle = vehicle _source;
        if (driver _vehicle == _source) then {
            if (_vehicle isKindOf "Car" OR _vehicle isKindOf "Boat") then
            {
                _damage = false;
                [_unit,_source] spawn life_fnc_vdmed;
            };
        };
    };
};

[] call life_fnc_hudUpdate;
_damage;