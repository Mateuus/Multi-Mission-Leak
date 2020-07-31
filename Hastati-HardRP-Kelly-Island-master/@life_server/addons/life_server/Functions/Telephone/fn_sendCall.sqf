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

_number = _this select 0;
_freq = _this select 1;
_player = _this select 2;
_obj = _this select 3;


diag_log "----------------------- TON_fnc_sendCall";
[_number, _freq, _player, _obj] remoteExec ["life_fnc_phoneGetCall", -2];