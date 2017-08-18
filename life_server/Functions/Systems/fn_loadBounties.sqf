/*
    file: fn_loadBounties.sqf
	Author: Kevin Webb
	Description: Adds the player to the wanted list when they join the server if they were wanted.
*/
private["_uid"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;

_query = format["SELECT bounties FROM players WHERE playerid = '%1'",_uid];	
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;
_queryResult = _queryResult select 0;
_queryResult = [_queryResult] call DB_fnc_mresToArray;
if(typeName _queryResult == "STRING") then {_queryResult = call compile format["%1", _queryResult];};
if(count _queryResult == 0) exitWith {};
_queryResult set[0,_name];
life_wanted_list pushBack _queryResult; 