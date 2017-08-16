/*
	Author: Tobias 'Xetoxyc' Sittenauer

	File: fn_removeWeapons.sqf
*/

private["_cop"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(_cop == player) then {};

if(isNull _cop OR !(player getVariable["restrained",FALSE])) exitWith {}; //Error check?

removeAllWeapons player;

[0,format["%1's Waffen wurden von %2 beschlagnahmt", name player, name _cop]] remoteExec ["tanoarpg_fnc_broadcast", -2, false];