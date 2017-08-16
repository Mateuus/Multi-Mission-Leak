/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns if the player owns the nearest hideout
*/

private _return = false;
private _hideout = [] call DS_fnc_getNearestHideout;

if(!isNull _hideout)then {
	private _owners = _hideout getVariable ["gangOwner",objNull];
	if((!isNull _owners)&&(_owners isEqualTo (group player)))then {_return = true};
};

_return;