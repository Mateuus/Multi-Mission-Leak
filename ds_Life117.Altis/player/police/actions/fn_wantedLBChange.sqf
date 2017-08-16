/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Checks what shop the player is trying to access and displays the data needed
*/
disableSerialization;
private["_index","_display","_list","_dialog","_unit"];

_display = _this select 0;
_index = _this select 1;

_unit = lbData [2666,lbCurSel 2666];
_unit = call compile format["%1",_unit];

[[player],"DS_fnc_returnPlayerCharges",_unit,false] spawn DS_fnc_MP;

