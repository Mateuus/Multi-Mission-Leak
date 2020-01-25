/*
	Author: Kajetan "Kruk" Mruk
	

	Description:
	Execute received remote execution

	Parameter(s):
	_this select 0: STRING - Packet variable name (always "life_fnc_MP_packet")
	_this select 1: ARRAY - Packet value (sent by life_fnc_MP function; see it's description for more details)
	
	Returns:
	BOOL - true if function was executed successfully
*/

_uid = _this select 0;
_ret = [];
if(isNil "_uid") exitWith {_ret;};

_query = format ["SELECT uid FROM players WHERE playerid='%1'",_uid];
_queryResult = [_query,2,false] call DB_fnc_asyncCall;
if(count _queryResult == 0) exitWith {_ret;};
_ret pushBack (_queryResult select 0);
_query = format ["SELECT uid, defaultSimCard FROM playerSettings WHERE uid='%1'",_uid];
_queryResult = [_query,2,false] call DB_fnc_asyncCall;
if(count _queryResult == 0) exitWith {_ret;};

_ret set [1, _queryResult];
diag_log "----------------------------- settingsGet.sqf";
diag_log format ["%1", _ret];
_ret;