/*
	File: fn_medicRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies the medics that someone has requested emergency and prompts them
	if they want to take the request or not.
*/
private["_caller"];
_caller = param [0,ObjNull,[ObjNull]];
if(isNull _caller) exitWith {}; //Bad data
if(life_killed) exitWith {};
["MedicalRequestEmerg",["Someone has requested EMS"]] call BIS_fnc_showNotification;