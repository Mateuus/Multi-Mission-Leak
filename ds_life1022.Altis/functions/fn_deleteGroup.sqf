/*
    Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Deletes a group
*/

params [["_group",grpNull,[grpNull]]];

if(isNull _group)exitWith{};

if(local _group)then {
    deleteGroup _group;
} else {
    [_group] remoteExecCall ["HUNT_fnc_deleteGroup",2];
};