#include "..\..\script_macros.hpp"
/*
	File: sitdown.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Sit in a chair!
*/

private ["_chair","_unit","_dir","_z"];

_chair = _this select 0; 
_unit = _this select 1;
ESG_sitzen = true;

if (vehicle _unit != _unit) exitWith {};
if (_unit distance _chair > 4) exitWith {};
if (_unit getVariable ["restrained",false]) exitWith {};
if (_unit getVariable ["istazed",false]) exitWith {};

_dir = switch (typeOf _chair) do
{
	case "Land_ChairPlastic_F": { 270 };
	case "Land_CampingChair_V1_F": { 180 };
	case "Land_CampingChair_V2_F": { 180 };
	case "Land_ChairWood_F": { 180 };
	case "Land_OfficeChair_01_F": { 180 };
	case "Land_Bench_F": { 90 };
	
	default { 180 };
};

_z = switch (typeOf _chair) do
{
	default { 0 };
};

_posATL = getPosATL _chair;
_obj = "Land_ClutterCutter_small_F" createVehicle (_posATL);
_obj setPosATL (_posATL);
_obj setDir ((direction _chair) - _dir);
_unit attachTo [_obj,[0,0,_z]];

[_unit,"Crew","switch",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
hint "Drücke Leertaste, um aufzustehen!";
//_action = _unit addAction ["<t color='#B45F04'>Aufstehen</t>",{[]spawn ESG_fnc_aufstehen;}];

//waitUntil { !ESG_sitzen || !(alive _unit) || player distance (getPos _chair) > 2 };
/*
//_unit removeAction _action;
ESG_sitzen = false;
if (isNull attachedTo _unit) then
{
	if (attachedTo _unit == _obj) then { detach _unit; deleteVehicle _obj; };
};
*/