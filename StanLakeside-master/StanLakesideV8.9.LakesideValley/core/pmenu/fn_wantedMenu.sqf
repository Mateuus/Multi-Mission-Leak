#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	
	
	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
lbClear _list;
_units = [];

ctrlSetText[2404,"Establishing connection..."];

if(__GETC__(life_coplevel) < 3 && __GETC__(life_adminlevel) == 0) then
{
	ctrlShow[2405,false];
};

[player] remoteExec ["life_fnc_wantedFetch",2];