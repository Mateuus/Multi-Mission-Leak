/*
	File: fn_leaveGang.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Leave gang
*/
_handle = [format["Are you sure you want to leave your gang, %1?",life_gang_name]] spawn life_fnc_confirmMenu;
waitUntil {scriptDone _handle};
if(!life_confirm_response) exitWith {};
life_gangexp = 0;
life_gangtalents = [];
life_gang = "0";
life_gang_rank = 3;
life_gang_group = objNull;
player setVariable ["gang", nil, true];
player setVariable ["gangName", nil, true];
player setVariable ["gangGroup", nil, true];

[] spawn life_fnc_sessionUpdate;

[player] joinSilent (createGroup civilian);

closeDialog 0;
hint "You are no longer a member of your former gang!";