/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Packs a building box
*/

private ["_target","_box","_action","_objects"];

_target = cursorObject;
_box = true;

if(isNil "DS_copLevel")then{DS_copLevel = 0;};
if((playerSide isEqualTo west)&&(DS_copLevel == 0))exitWith{hint "Public cops can not do this"};
if((!(player getVariable ["medic",false]))&&(!(player getVariable ["mechanic",false]))&&(!(player getVariable ["security",false]))&&(!(playerSide isEqualTo west)))exitWith{hint "You do not have the key to pack this box"};
if(!(_target isKindOf "Land_WoodenBox_F"))then{_box = false;};

_action = [
	"Are you sure you want to pack these items? (Packing up somebody elses items to troll will get you blacklisted)",
	"Pack Items",
	"Pack",
	"Close"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

_objects = nearestobjects [player,["All"],150];

{
	if(_x getVariable ["buildItem",false])then {
		deleteVehicle _x;
	};
} forEach _objects;

if(_box)then {
	deleteVehicle _target;
	["buildingBox",true,1] call DS_fnc_handleInventory;
	DS_policeBank = DS_policeBank - 1;
};