/*
	File: fn_medicRequest.sqf
	
	
	Description:
	Notifies the medics that someone has requested emergency and prompts them
	if they want to take the request or not.
*/

params [["_caller", objNull, [objNull]], ["_callerName", "Unknown Player", [""]]];

if(isNull _caller) exitWith {}; //Bad data

if(side _caller isEqualTo civilian || side _caller isEqualTo east) then {
	["mdciv", false] remoteExec ["fnc_dispatch",independent];
} else {
	["mdofficer", false] remoteExec ["fnc_dispatch",independent];	
};
_caller setVariable["mapVisible",true,true];
["MedicalRequestEmerg",[format[localize "STR_Medic_Request",_callerName]]] call BIS_fnc_showNotification;