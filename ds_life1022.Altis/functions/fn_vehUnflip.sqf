/*
    Darkside Life

	Authors: Shawn "Huntah" Macgillivray, ShadowRanger (Luke)

	Description:
	Unflips the player's target vehicle
*/

private ["_action","_vehicle"];

_action = [
	"Unflipping a vehicle will place it on the ground below in an upright state, if the vehicle clips into an object it will explode. There is no comp for issues using this feature, if this is an issue contact a mechanic, otherwise... Learn to drive",
	"Warning",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

_vehicle = DS_cursorTarget;
_vehicle allowDamage false;

if(surfaceIsWater (getPos _vehicle))then {
	_vehicle setPosASL [(getPosASL _vehicle) select 0,(getPosASL _vehicle) select 1,((getPosASL _vehicle) select 2)+0.5];
} else {
	_vehicle setPosATL [(getPosATL _vehicle) select 0,(getPosATL _vehicle) select 1,((getPosATL _vehicle) select 2)+0.5];
};

_vehicle setVectorUp [0,0,1];
_vehicle allowDamage true;

closeDialog 0;