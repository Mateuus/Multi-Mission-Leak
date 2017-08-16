#include "\life_server\script_macros.hpp"
/*
	File: fn_wantedProfUpdate.sqf
	Author: [midgetgrimm]
	Persistence by: ColinM
	Description:
	Updates name of player if they change profiles
*/
private["_uid","_name","_query","_tickTime","_wantedCheck","_wantedQuery"];

_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
//Bad data check
if(_uid == "" OR  _name == "") exitWith {};
_tickTime = diag_tickTime;

_wantedCheck = format["wantedFetchName:%1",_uid];
waitUntil{!DB_Async_Active};
_wantedQuery = [_wantedCheck,2] call DB_fnc_asyncCall;
if(count _wantedQuery == 0) exitWith {diag_log "Person not wanted, no update";};
_wantedQuery = call compile format["%1",_wantedQuery];

if(_name != (_wantedQuery select 0)) then
{
	_query = format["wantedUpdateName:%2:%1",_uid,_name];
	waitUntil {!DB_Async_Active};
	[_query,2] call DB_fnc_asyncCall;

	if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
		["diag_log",[
			"-------------- Update Player Name --------------",
			format["QUERY 1: %1",_wantedCheck],
			format["QUERY 2: %1",_query],
			format["Last Name: %1",_wantedQuery],
			format["Req By: %1",_name],
			format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)],
			"----------------Person Is Wanted----------------"
		]] call TON_fnc_logIt;
	};
} else {diag_log "Name Matches, no change needed";};