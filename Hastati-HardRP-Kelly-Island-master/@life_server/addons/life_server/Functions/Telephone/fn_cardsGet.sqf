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


_ret = [];
_query = format["SELECT id, number, idCompany, saldo, SMSPrice, minutePrice, permanent FROM TelSimCards WHERE alive='1' AND ownerUID='0' LIMIT 50"];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if(count _queryResult != 0) then {_ret = _queryResult;} else {_ret = [];};
diag_log "--------------------------- TON_fnc_cardsGet";
diag_log format ["%1",_ret];
[_ret] remoteExec ["hst_life_phone_session_fnc_serverGetData", 2];