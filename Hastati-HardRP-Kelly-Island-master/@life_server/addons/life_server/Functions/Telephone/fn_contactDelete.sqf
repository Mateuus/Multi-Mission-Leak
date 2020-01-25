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
_number = _this select 1;
_ret = false;
if(isNil "_player" || isNil "_number") exitWith {_ret;};
//if(isNull _player) exitWith {_ret;};
if(_number == "") exitWith {_ret;};

//_playerUID = getPlayerUID _player;
_query = format["DELETE FROM TelContact WHERE number='%1' AND playerUID='%2'", _number, _player];
[_query, 1] call DB_fnc_asyncCall;
_ret = true;
_ret;