#include "\hst_life_core\script_macros.hpp"
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
_array = _this select 1;
if(isNil "_player" || isNil "_array") exitWith {};
if(isNull _player || _player != player) exitWith {};
if(count _array == 0) exitWith {};

hst_life_core_idCards pushBack _array;