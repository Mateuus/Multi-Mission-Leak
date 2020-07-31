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
_cards = _this select 0;
if(isNil "_cards") exitWith {diag_log "Nie wczytano kart"};
diag_log "Wczytywanie kart";
hst_life_phone_cardsToSell = _cards;
publicVariable "hst_life_phone_cardsToSell";
diag_log "Wczytano karty:";
diag_log format ["%1", hst_life_phone_cardsToSell];