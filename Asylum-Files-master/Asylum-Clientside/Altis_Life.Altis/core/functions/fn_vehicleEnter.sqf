/*
	File: fn_vehicleEnter.sqf
	Author: John "Paratus" VanderZwet

	Description: Got in a vehicle!
*/
private["_vehicle","_position","_unit","_isTrans"];
_vehicle = _this select 0;
_position = _this select 1;
_unit = _this select 2;

if (_unit getVariable ["restrained", false] && !(_unit getVariable ["transporting", false])) then
{
	_unit action ["GetOut", _vehicle];
};

if(_vehicle getVariable ["medicsOnly", false] && _position == "driver") then {
	if(side _unit != independent) then {
		_unit action ["GetOut", _vehicle];
		["Only medics are licensed to pilot medivac helicopters!", "hint", _unit] spawn life_fnc_MP;
	} else {
		_vehicle enableCopilot true; // let someone else take control if there's a medic in the helicopter
	};
};

if (typeOf _vehicle == "C_SUV_01_F") then
{
	[[_vehicle,[-0.010813,-0.506166,-0.7]],"life_fnc_centerMass",_unit,false] spawn life_fnc_MP;
};
//["in","life_fnc_fireMode",_unit, false] spawn life_fnc_MP;