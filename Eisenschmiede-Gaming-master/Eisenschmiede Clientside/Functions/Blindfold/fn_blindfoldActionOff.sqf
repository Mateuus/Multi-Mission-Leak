#include "..\script_macros.hpp"
/*
	File: fn_blindfoldActionOff.sqf
	Author: Bryan "Tonic" Boardwine, edited by Jason_000
	
	Description:

*/
private["_target","_who","_obj"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(EQUAL(_who,"")) exitWith {};
if(!(_target getVariable "Restrained")) exitWith {};


cutText ["", "BLACK IN"];
hint "Dir wurde der Eimer vom Kopf entfernt";