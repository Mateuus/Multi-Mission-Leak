/*
    Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Adds the player to a group, deleting their old one if it's empty
*/

private ["_oldGroup"];

params [["_group",grpNull,[grpNull]]];

if(isNull _group)exitWith{};

//Store the old group before putting them in a new one
_oldGroup = (group player);

//Add the player to the new group
[player] joinSilent _group;

//Delete the player's old group
if(isNull _oldGroup)exitWith{};

if(local _oldGroup)then {
    deleteGroup _oldGroup;
} else {
    [_oldGroup] remoteExecCall ["HUNT_fnc_deleteGroup",2];
};