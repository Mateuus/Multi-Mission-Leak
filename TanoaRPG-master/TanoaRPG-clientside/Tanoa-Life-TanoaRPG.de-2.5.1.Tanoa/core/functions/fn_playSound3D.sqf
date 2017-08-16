/*
	File: fn_PlaySound3D.sqf
	Author: CooliMC
*/
private["_source","_soundname"];

_soundname = "";

_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_soundname = [_this,1,"",[""]] call bis_fnc_param;

if(isNull _source) exitWith {};
if(_soundname == "") exitWith {};

_source say3D _soundname;