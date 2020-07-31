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

_mode = _this select 0;
_visaID = _this select 1;
_playerUID = _this select 2;
_drivingPoints = _this select 3;
if(isNil "_visaID") exitWith {};
if(isNil "_playerUID") exitWith {};
diag_log "------------- TON_fnc_visaUpdate";
diag_log format ["%1", _this];
_query = "";
switch(_mode) do {
	case 0: {
		_query = format ["UPDATE playerIDs SET uid='%1' WHERE id='%2'", _playerUID, _visaID];
	};
	case 1: {
		_query = format ["UPDATE playerIDs SET drivingPoints='%1' WHERE id='%2'", _drivingPoints, _visaID];
	};
};

if(_query != "") then {
	[_query, 1] call DB_fnc_asyncCall;
};