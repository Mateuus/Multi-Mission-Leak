/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Repairs nearby buildings
*/

_action = [
	"Repair Nearby Buildings?",
	"Important",
	"Continue",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

private ["_buildingarray"];

if((getPlayerUID player) in DS_adminlist1) then
	{
	systemchat "Repairing Buildings";

	_buildingarray = nearestObjects [player,["All"],100];
	{
		if((!(_x isKindOf "Man"))&&(!(_x isKindOf "Car"))&&(!(_x isKindOf "Air"))&&(!(_x isKindOf "Ship")))then
			{
			_x setDamage 0;
			};
	} forEach _buildingarray;

	player setVariable["restrained",FALSE,TRUE];
	player setVariable["escorted",FALSE,TRUE];
	detach player;
	};
