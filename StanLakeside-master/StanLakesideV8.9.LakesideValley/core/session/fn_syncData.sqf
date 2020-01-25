/*
	File: fn_syncData.sqf
	"
	
	Description:
	Used for player manual sync to the server.
*/

if( player distance (getMarkerPos "respawn_civilian") < 33 || player distance (getMarkerPos "respawn_west") < 33 || player distance (getMarkerPos "respawn_west_1") < 33 || player distance [0,0,0] < 33) exitwith {};

closedialog 0;
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith {
	["Nie dawno synchronizowales sie z serwerem!", false] spawn domsg;
};

[7] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
[6] call SOCK_fnc_updatePartial;

[] spawn
{
	life_session_time = true;
	uiSleep (5 * 60);
	life_session_time = false;
};
["Zsynchronizowano!", false] spawn domsg;