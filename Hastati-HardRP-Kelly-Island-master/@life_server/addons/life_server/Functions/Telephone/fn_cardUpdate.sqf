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
_cardID = _this select 1;
_player = _this select 2;
_saldo = _this select 3;
_playerUID = getPlayerUID _player;
diag_log "------------- TON_fnc_cardUpdate";
diag_log format ["%1", _this];
if(isNil "_cardID") exitWith {};
if(isNil "_player") exitWith {};
_query = "";
switch(_mode) do {
	case 0: {
		_query = format ["UPDATE TelSimCards SET saldo='%1' WHERE id='%2'", _saldo, _cardID];
	};
	case 1: {
		_query = format ["UPDATE playerSettings SET defaultSimCard='%1' WHERE uid='%2'", _cardID, _playerUID];
	};
	case 2: {
		_query = format ["UPDATE TelSimCards SET alive='0' WHERE id='%1'", _cardID];
	};
	case 3: {
		_query = format ["UPDATE TelSimCards SET ownerUID='%1' WHERE id='%2'", _playerUID, _cardID];
	};
};

if(_query != "") then {
	[_query, 1] call DB_fnc_asyncCall;
};