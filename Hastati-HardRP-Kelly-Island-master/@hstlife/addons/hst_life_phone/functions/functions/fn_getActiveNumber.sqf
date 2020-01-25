#include "\hst_life_phone\script_macros.hpp"
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
{
	if(_x select 0 == hst_life_phone_activeCard) exitWith {hst_life_phone_active_number = _x select 1;};
} forEach hst_life_phone_cards;
hst_life_phone_active_number;