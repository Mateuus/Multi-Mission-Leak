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

_phoneNumber = _this select 0;
_ret = [];
if(isNil "_phoneNumber") exitWith {_ret;};

_query = format ["SELECT senderNumber, recipientNumber FROM TelCalls WHERE recipientNumber='%1' OR senderNumber='%1' ORDER BY id DESC LIMIT 30",_phoneNumber];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
diag_log "------------------------- fn_callGet.sqf -------------------------";
diag_log format["%1", _queryResult];
diag_log "------------------------------------------------------------------";
if(count _queryResult == 0) exitWith {_ret;};
_queryResult;