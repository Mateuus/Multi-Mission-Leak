/*
	Author: CooliMC
	File: fn_addHouseID.sqf
	
	Description:
	Adds the Datebase ID to the House
*/
private["_house","_pos","_id"];

_id = [_this,0,-1] call BIS_fnc_param;
_pos = [_this,1,[]] call BIS_fnc_param;
if((_id == (-1)) || ((count _pos) == 0)) exitWith {};

_house = (nearestObject [_pos, "Building"]);
if((_house distance _pos) <= 2) then
{
	_house setVariable ["house_id",_id,true];
} else {
	[player, objNull, 1, "[HOUSING-SYSTEM]", format["Fehler Position Haus/Datenbank mehr als 2 Meter auseinander bei Position: %1", _pos], "[HOUSING-ERROR]"] remoteExec ["TEX_FNC_LOGIT", 2];
};