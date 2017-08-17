#include "\life_server\script_macros.hpp"
/*
 File: fn_jailSys.sqf
 Author: Bryan "Tonic" Boardwine
 Description:
 I forget?
*/
private["_unit","_bad","_id","_ret","_time"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _unit) exitWith {};
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param;
if(_bad) then {//Load time from database
 _query = format["SELECT jail_time FROM players WHERE pid='%2'", _time, getPlayerUID _unit];
 _result = [_query,2] call DB_fnc_asyncCall;
 _result = (_result select 0);
 _time = _result;
} else {
 _query = format["UPDATE players SET jail_time='%1' WHERE pid='%2'", _time, getPlayerUID _unit];
 _result = [_query,1] call DB_fnc_asyncCall;
};
_id = owner _unit;
_ret = [_unit] call life_fnc_wantedPerson;
[_ret,_bad,_time] remoteExec ["life_fnc_jailMe",_id];