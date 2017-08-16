#include <macro.h>
/*
	File: fn_medicRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies the medics that someone has requested emergency and prompts them
	if they want to take the request or not.
*/

private["_caller","_callerName","_callback"];
_caller = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_callerName = [_this,1,"Unbekannte Person",[""]] call BIS_fnc_param;
_callback = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _caller) exitWith {}; //Bad data

_vehicleGridPos = mapGridPosition _caller;
_Village = (text (nearestLocations [(getpos _caller),["NameVillage","NameCity","NameCityCapital"],5000]select 0));
_time = [1] call life_fnc_gettime;

_msg = format["[%4] Notruf von: %1 | Koordinaten: %2 bei %3",_callername,_vehicleGridPos,_Village,_time];
[player,_msg,_callback,0] remoteExecCall ["SOA_fnc_handleMessages",2];