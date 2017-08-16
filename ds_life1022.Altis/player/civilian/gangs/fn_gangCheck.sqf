/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Checks if the player is no longer in a gang, and kicks them if not
*/

private _exit = false;

{
	_x params [
		["_gangName","",[""]],
		["_group",grpNull,[grpNull]]
	];

	if(!isNull _group)then {
		if(((group player) isEqualTo _group)||(isNull (group player)))then {
			private _groupMembers = (_group getVariable ["gangMembers",[""]]);

			if(!((getPlayerUID player) in _groupMembers))then {
				[player] joinSilent (createGroup civilian);
				(group player) setVariable ["gangName",nil,true];
			};

			_exit = true;
		};
	};

	if(_exit)exitWith{};
} forEach DS_gangList;