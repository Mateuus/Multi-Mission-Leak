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
if(!isDedicated) exitWith {}; //Let only server send data

if(!life_marketSync) then {
	diag_log "--------------------------------- Synchronizacja marketu ----------------------------------";
	life_marketSync = true;
	uiSleep 300;
	{
		_x set [5, (_x select 5) - (_x select 6)];
	} forEach life_marketItems;
	publicVariable "life_marketItems";
	life_marketSync = false;
	diag_log "--------------------------------- Zsynchronizowano market ----------------------------------";
};