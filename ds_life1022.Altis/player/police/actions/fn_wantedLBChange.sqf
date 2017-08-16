/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Checks what shop the player is trying to access and displays the data needed
*/

private ["_unit"];

params ["_display","_index"];

disableSerialization;

_unit = lbData [2666,lbCurSel 2666];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitwith{};

[player] remoteExecCall ["DS_fnc_returnPlayerCharges",_unit];