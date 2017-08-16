/*
	File: fn_handleVehicleDamage.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Handles special damage events
*/
private["_unit","_damage","_source","_projectile","_hitBox","_curWep","_driver"];

_unit = _this select 0;
_hitBox = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

if (_projectile != "") then
{
	if(local _unit) then {[_source] call life_fnc_setAggressive} else {[[_source],"life_fnc_setAggressive",_unit,false] call life_fnc_MP};
};

if (_source isKindOf "Man") then {
	/*if (_hitBox in ["wheel_1_1_steering","wheel_1_2_steering","wheel_2_1_steering","wheel_2_2_steering"]) then {
		switch (typeof _unit) do {
			case "I_MRAP_03_F": {
				if(side _source != west) then {_damage = _damage / 2;} else {_damage = _damage * 2;};
			};
			case "B_MRAP_01_F": {
				if(side _source == west) then {_damage = _damage * 2;};
			};
			default
			{
				_damage = _damage * 2;
			};
		};
	};*/
	if (typeOf _unit == "O_Heli_Light_02_unarmed_F" && _hitBox == "transmission") then
	{
		_unit setHit ["main_rotor_hit", (_unit getHit "main_rotor_hit") + 0.15 ];
	};
	
	if (_projectile == "R_PG7_F") then
	{
		if (_hitBox in ["","palivo"]) then {
			if (_damage > 0.9) then { _damage = 0.9; };
		};
	};
};

if (_hitBox == "palivo") then { _damage = _damage / 3 };

_damage;