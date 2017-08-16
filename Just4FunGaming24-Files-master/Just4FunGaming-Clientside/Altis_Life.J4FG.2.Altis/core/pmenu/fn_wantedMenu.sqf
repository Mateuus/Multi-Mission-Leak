/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "XY_dialog_wantedList";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
lbClear _list;
_units = [];

ctrlSetText[2404,"Verbindungsaufbau..."];

if( XY_copLevel < 3 && XY_adminLevel == 0) then {
	ctrlShow[2405, false];
};

[player] remoteExec ["XY_fnc_wantedFetch", 2];