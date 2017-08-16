#include "..\..\macros.hpp"
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "DWEV_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
lbClear _list;
_units = [];

ctrlSetText[2404,"Stelle eine Verbindung her..."];

if(__GETC__(DWEV_coplevel) < 3 && __GETC__(DWEV_adminlevel) < 1) then //Ab S
{
	ctrlShow[507027,false]; // Begrandigen Grafik
	ctrlShow[507028,false]; // Begrandigen Button
};

[player] remoteExec ["DWEV_fnc_wantedFetch",2];