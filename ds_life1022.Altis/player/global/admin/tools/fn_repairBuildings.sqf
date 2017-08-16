/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Repairs nearby buildings
*/

private ["_action","_buildings"];

if(!((getPlayerUID player) in DS_adminList1))exitWith{};

_action = [
	"Repair Nearby Buildings?",
	"Important",
	"Continue",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

if(isNull DS_amUnit)then{DS_amUnit = player;};

if(DS_amUnit isEqualTo player)then {
	systemChat "Repairing nearby buildings...";
} else {
	systemChat "Repairing nearby buildings of the player you are spectating...";
};

_buildings = nearestObjects [DS_amUnit,["All"],100];

{
	if((!(_x isKindOf "Man"))&&(!(_x isKindOf "Car"))&&(!(_x isKindOf "Air"))&&(!(_x isKindOf "Ship")))then	{
		_x setDamage 0;
	};
} forEach _buildings;

player setVariable ["restrained",false,true];
player setVariable ["escorted",false,true];
detach player;