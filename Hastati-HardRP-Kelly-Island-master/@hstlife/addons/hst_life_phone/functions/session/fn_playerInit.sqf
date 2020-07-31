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

diag_log "-------------- Fetching phone information -----------";
_playerUID = getPlayerUID player;
_return = [_playerUID, player] remoteExec ["TON_fnc_phoneQuery", 2];

if(isNil "_return") then {diag_log "----------- Fetching phone information failed -----------";};

hst_life_phone_emergencyNumbers = [
	["911","POLICE"],
	["912", "EMS"],
	["666", "SWAT"]
];