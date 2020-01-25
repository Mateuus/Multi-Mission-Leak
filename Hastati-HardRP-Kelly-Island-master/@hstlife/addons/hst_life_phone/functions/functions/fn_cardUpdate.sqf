#include "..\..\script_macros.hpp"
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
_card = _this select 0;
_mode = _this select 1;
if(_card <= 0) exitWith {};
{
	if(_x select 0 == _card) exitWith {
		[_mode,_card, player, (_x select 3)] remoteExec ["TON_fnc_cardUpdate", 2];
	};
} forEach hst_life_phone_cards;