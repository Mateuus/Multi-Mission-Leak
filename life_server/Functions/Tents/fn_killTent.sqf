/*
	File: fn_killTent.sqf
	Author: Raku @ Veterans of Altis
	
	Kills the tent.
*/
private["_uid","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if(_uid == "") exitWith {};
 
_query = format["UPDATE tents SET alive='0' WHERE pid='%1'",_uid];
diag_log format["--- Kill Tent: %1",_query];
waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;