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
_playerObj = _this select 1;
_ret = [];
diag_log "---------------- fn_phoneQuery ----------------";
if(isNil "_player") exitWith {};
//if(isNull _player) exitWith {};

_contacts = [_player] call TON_fnc_contactGet;
_cards = [_player] call TON_fnc_cardGet;
if((count _cards) != 0) then {
	_sms = [];
	_calls = [];
	{
		_tmp = [];
		_phoneNumber = _x select 1;
		_query = [_phoneNumber] call TON_fnc_smsGet;
		_tmp pushBack (_x select 0);
		_tmp pushBack _query;
		_sms pushBack _tmp;
		_tmp2 = [];
		_query = [_phoneNumber] call TON_fnc_callGet;
		_tmp2 pushBack (_x select 0);
		_tmp2 pushBack _query;
		_calls pushBack _tmp;
	} forEach _cards;
	_ret pushBack _contacts;
	_ret pushBack _cards;
	_ret pushBack _sms;
	_ret pushBack _calls;
} else {
	_ret pushBack _contacts;
	_ret pushBack [];
	_ret pushBack [];
	_ret pushBack [];
};
diag_log "-----------------------------------------------------------";
diag_log format ["%1", _ret];
diag_log "-----------------------------------------------------------";


_ret remoteExec ["hst_life_phone_session_fnc_playerGetData", _playerObj];