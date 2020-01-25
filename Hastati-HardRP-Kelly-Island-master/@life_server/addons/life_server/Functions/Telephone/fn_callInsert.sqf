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

_callerNumber = _this select 0;
_targetNumber = _this select 1;
//_caller = _this select 2;
_callerPos = _this select 2;
_target = _this select 3;
_status = _this select 4;
_freq = _this select 5;
if(_status == 1) then {
_callerMres = [_callerPos] call DB_fnc_mresArray;
if(isNil "_callerNumber" || isNil "_targetNumber") exitWith {};
_query = format["INSERT INTO TelCalls (senderNumber, recipientNumber, pos) VALUES ('%1', '%2', '%3')", _callerNumber, _targetNumber, _callerMres];
[_query, 1] call DB_fnc_asyncCall;
};

diag_log "----------------------- TON_fnc_callInsert";
diag_log format ["%1", _this];
[_status, _freq, _target] remoteExec ["life_fnc_phoneCallAnswered", -2];