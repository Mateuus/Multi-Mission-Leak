/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sends a request to a player to obtain their current charges
*/

private ["_unit"];

_unit = lbData [2666,lbCurSel 2666];
_unit = missionNamespace getVariable _unit;

DS_setCharge = _unit;

closeDialog 0;
createDialog "setWanted";