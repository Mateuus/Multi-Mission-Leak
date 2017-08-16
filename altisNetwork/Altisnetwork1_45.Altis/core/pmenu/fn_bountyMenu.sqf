#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "life_wanted_menu";

_display = findDisplay 2700;
_list = _display displayCtrl 2701;
lbClear _list;
_units = [];

ctrlSetText[2404,"Establishing connection..."];

if (life_HC_isActive) then {
    [player] remoteExec ["HC_fnc_wantedFetch",HC_Life];
} else {
    [player] remoteExec ["life_fnc_wantedFetch",RSERV];
};

