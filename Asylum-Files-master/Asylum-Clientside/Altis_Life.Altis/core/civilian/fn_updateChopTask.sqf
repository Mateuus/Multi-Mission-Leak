/*
	File: fn_updateChopTask.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Update tasking based on chop shop status!
*/

private ["_msg","_showHint","_names"];

_showHint = [_this,0,true,[true]] call BIS_fnc_param;

if (playerSide != civilian) exitWith {};
if (!isNil "life_chop_task") then { player removeSimpleTask life_chop_task; };
_names = [];
{
	_vName = switch (_x) do
	{
		case "C_Offroad_01_F": { "Offroad (civilian/police)" };
		case "B_G_Offroad_01_F": { "Offroad (rebel)" };
		default { getText(configFile >> "CfgVehicles" >> _x >> "displayName") };
	};
	_names set[_forEachIndex, _vName];
} forEach life_chopVehicle;
_msg = format["Chop shop is seeking: %1, %2 and %3.", _names select 0, _names select 1, _names select 2];

life_chop_task = player createSimpleTask ["ChopShop"];
life_chop_task setSimpleTaskDescription [_msg,"Chop Shop Job",""];
life_chop_task setTaskState "Assigned";

if (_showHint) then { hint _msg; };