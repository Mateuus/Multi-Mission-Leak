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

_player = _this select 0;
_ret = [];
if(isNil "_player") exitWith {_ret;};
//if(isNull _player) exitWith {_ret;};
//_playerUID = getPlayerUID _player;
_query = format ["SELECT number, name FROM TelContact WHERE playerUID='%1' ORDER BY name", _player];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
diag_log "------------------------- fn_contactGet.sqf -------------------------";
diag_log format["%1", _queryResult];
diag_log "------------------------------------------------------------------";
if(count _queryResult == 0) exitWith {_ret;};
_queryResult;