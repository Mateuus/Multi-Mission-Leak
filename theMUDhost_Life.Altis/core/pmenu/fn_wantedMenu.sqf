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

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
lbClear _list;
_units = [];

ctrlSetText[2404,"Establishing connection..."];

if(__GETC__(life_adminlevel == 0)) then
{
	if(__GETC__(life_coplevel < 4)) then
	{
		ctrlShow[9800,false];
	};
	
	if(__GETC__(life_coplevel < 5)) then
	{
		ctrlShow[2405,false];
	};
}
else
{
	ctrlShow[9800,true];
	ctrlShow[2405,true];
};

[[player],"life_fnc_wantedFetch",false,false] spawn life_fnc_MP;