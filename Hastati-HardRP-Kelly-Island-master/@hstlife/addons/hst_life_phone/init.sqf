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
if(isServer or isDedicated) then {
	[] spawn hst_life_phone_session_fnc_serverInit;
};
if(hasInterface) then {
	[] spawn hst_life_phone_session_fnc_playerInit;
};