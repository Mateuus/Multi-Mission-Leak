/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns the group associated with the given gang name
*/

params [["_gangName","",[""]]];

if(_gangName isEqualTo "")exitWith{grpNull};

private _groupObject = grpNull;
private _exit = false;

{
	private _group = _x select 1;

	if(!isNull _group)then {
		if((_group getVariable ["gangName",""]) isEqualTo _gangName)exitWith {
			_groupObject = _group;
			_exit = true;
		};
	};

	if(_exit)exitWith{};
} forEach DS_gangList;

_groupObject;