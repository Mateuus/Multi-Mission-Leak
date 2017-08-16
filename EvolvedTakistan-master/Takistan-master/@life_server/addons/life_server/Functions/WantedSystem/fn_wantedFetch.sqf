#include "\life_server\script_macros.hpp"
/*
	File: fn_wantedFetch.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm

	Description:
	Displays wanted list information sent from the server.
*/
private["_ret","_list","_result","_queryResult","_units","_inStatement"];
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _ret) exitWith {};
_ret = owner _ret;
_inStatement = "";
_list = [];
_units = [];
_tickTime = diag_tickTime;
{if((side _x) == civilian) then {_units pushBack (getPlayerUID _x)};} foreach playableUnits;

_result = "wantedFetchIDAll";
waitUntil{!DB_Async_Active};
_queryResult = [_result,2,true] call DB_fnc_asyncCall;

{
	if (SEL(_x, 0) in _units) then
	{
		_list pushBack (_x);
	};
}
forEach _queryResult;

if(count _list == 0) exitWith {[[_list],"life_fnc_wantedList",_ret,false] spawn life_fnc_MP;};

if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
	["diag_log",[
		"------------- Wanted Query Request -------------",
		format["QUERY: %1",_result],
		format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)],
		format["Result: %1",_queryResult],
		"------------------------------------------------"
	]] call TON_fnc_logIt;
};

[[_list],"life_fnc_wantedList",_ret,false] spawn life_fnc_MP;