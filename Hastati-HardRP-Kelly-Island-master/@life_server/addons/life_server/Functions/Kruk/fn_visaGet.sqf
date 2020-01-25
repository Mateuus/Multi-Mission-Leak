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
_uid = getPlayerUID _player;

_query = format ["SELECT id, name, surname, gender, birthDate, fatherName, motherName, motherSurname, pesel, drivingPoints, idType FROM playerIDs WHERE uid ='%1'", _uid];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
diag_log "--------------- TON_fnc_visaGet";
diag_log str _queryResult;
[_queryResult] remoteExec ["hst_life_core_fnc_playerInit", _player];