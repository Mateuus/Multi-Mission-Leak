/*
	File: fn_calVehWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Base configuration for vehicle weight
*/
private["_vehicle","_weight","_used"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_weight = -1;
_used = (_vehicle getVariable "Trunk") select 1;

switch ((typeOf _vehicle)) do
{
	case "Land_WaterBarrel_F": {_weight = 201;};
	case "Box_East_Support_F": {_weight = 700;};
	case "Box_East_WpsSpecial_F": {_weight = 1000;};
	case "Land_TentA_F": {_weight = 400;};
	case "Land_TentDome_F": {_weight = 600;};
};
{
	if (typeOf _vehicle == _x select 1 || configName (inheritsFrom (configFile >> "CfgVehicles" >> typeOf _vehicle)) == _x select 1) then
	{
		_weight = _x select 3;
	};
} foreach life_vehicleInfo;

if(isNil "_used") then {_used = 0};
[_weight,_used];