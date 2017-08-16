/*
	File: fn_capNotice.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Toggles the display of capture point user interface.
*/
private ["_point","_row"];

_point = [_this,0,0,[0]] call BIS_fnc_param;
_row = life_capture_list select (_point - 1);
if ((_row select 1) == "0") exitWith {};
if ((_row select 1) != life_gang) exitWith {};

hint parseText format ["<t align='center'><t color='#FF0000'><t size='2'>Attention</t></t><br/><br/><t color='#ffffff'>Your territory zone, <t color='#00ff00'>%1</t>, is being captured by another gang!",(_row select 0)];