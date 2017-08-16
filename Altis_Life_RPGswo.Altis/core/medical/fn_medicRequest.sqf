/*
	File: fn_medicRequest.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Notifies the medics that someone has requested emergency and prompts them
	if they want to take the request or not.
*/
private["_caller","_callerName"];
_caller = param [0,ObjNull,[ObjNull]];
_callerName = param [1,"Unknown Player",[""]];
if(isNull _caller) exitWith {}; //Bad data

["MedicalRequestEmerg",[format["%1 fordert eine Wiederbelebung.",_callerName]]] call BIS_fnc_showNotification;
