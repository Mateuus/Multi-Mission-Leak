/*
	File: fn_searchClient.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the player and he returns information back to the player.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {};
if((player distance _unit > 3)) exitWith {};
hint "Waffe werden abgenommen...";

if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "Diese Person kann nicht durchsucht werden."};

[player] remoteExec ["DWEV_fnc_searchClientGun",_unit];


DWEV_action_inUse = true;
