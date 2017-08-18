/*
	File: fn_wantedFetch.sqf
	Re-written by: ColinM
	Assistance by: Paronity

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

{
	if(_inStatement == "") then
	{
		_inStatement = _x;
	}
	else
	{
		_inStatement = _inStatement + "','" + _x;
	};
} forEach _units;

_result = format["SELECT wantedID, wantedName FROM wanted WHERE active='1' AND wantedID in ('%1')",_inStatement];
waitUntil{!DB_Async_Active};
_queryResult = [_result,2,true] call DB_fnc_asyncCall;

{
	_list pushBack (_x);
}
forEach _queryResult;

if(count _list == 0) exitWith {[[_list],"life_fnc_wantedList",_ret,false] spawn life_fnc_MP;};

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_result];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_list];
diag_log "------------------------------------------------";

[[_list],"life_fnc_wantedList",_ret,false] spawn life_fnc_MP;