#include "..\..\script_macros.hpp"
/*
	File : removeContainer.sqf
	Author: NiiRoZz

	Description:
	Delete Container from house storage
*/
private["_house","_action","_container","_containerType","_containers"];
_container = param [0,ObjNull,[ObjNull]];
_containerType = typeOf _container;
_house = nearestObject [player, "House"];
if(!(_house in life_vehicles)) exitWith {hint  "Du musst in deinem Haus sein, um dies platzieren zu können."};
if(isNull _container) exitWith {};
_containers = _house GVAR ["containers",[]];
closeDialog 0;

_action = [
	format[ "Are you sure you want to remove it?"], "Remove Container", "Entfernen", "Abbrechen"
] call BIS_fnc_guiMessage;

if(_action) then {
	private ["_box","_diff"];
	_box = switch (_containerType) do {
		case ("B_supplyCrate_F"): {"storagebig"};
		case ("Box_IND_Grenades_F"): {"storagesmall"};
		default {"None"};
	};
	if(_box == "None") exitWith {};

	_diff = [_box,1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	if(EQUAL(_diff,0)) exitWith {hint  "Dein Inventar ist voll."};

	if(life_HC_isActive) then {
		[_container] remoteExecCall ["HC_fnc_deleteDBContainer",HC_Life];
	} else {
		[_container] remoteExecCall ["TON_fnc_deleteDBContainer",RSERV];
	};

	{
		if (_x == _container) then {
			_containers set [_forEachIndex,666];
		};
	} forEach _containers;
	_containers = _containers - [666];
	_house SVAR ["containers",_containers,true];

	[true,_box,1] call life_fnc_handleInv;
};
