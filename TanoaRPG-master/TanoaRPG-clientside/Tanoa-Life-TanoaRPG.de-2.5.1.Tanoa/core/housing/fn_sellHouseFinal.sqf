/*
	Author: CooliMC
	File: fn_sellHouseFinal.sqf
	
	Description:
	Sets the Variables Final for the House
*/
private["_house","_pos"];
_pos = [_this,0,[]] call BIS_fnc_param;
if((count _pos) == 0) exitWith {};

_house = (nearestObject [_pos, "Building"]);
if((_house distance _pos) <= 2) then
{
	_house setVariable["house_id",nil,true];
	_house setVariable["house_owner",nil,true];
	_house setVariable["house_sold",nil,true];
} else {
	[player, objNull, 1, "[HOUSING-SYSTEM]", format["Fehler Position Haus/Datenbank mehr als 2 Meter auseinander bei Position: %1", _pos], "[HOUSING-ERROR]"] remoteExec ["TEX_FNC_LOGIT", 2];
};