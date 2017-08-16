/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Makes the player rejoin a gang if they are meant to be in it
*/

private _exit = false;

{
    _x params [
		["_gangName","",[""]],
		["_group",grpNull,[grpNull]]
	];

    if(!isNull _group)then {
        private _groupMembers = (_group getVariable ["gangMembers",[""]]);

        if((getPlayerUID player) in _groupMembers)then {
            [player] joinSilent _group;
            _exit = true;
        };
    };

    if(_exit)exitWith{};
} forEach DS_gangList;