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
hint "Nach Waffen suchen....";
if(!alive player || !alive _unit) exitWith {hint "Diese Person kann nicht durchsucht werden."};
DWEV_action_inUse = true;
[player] remoteExec ["DWEV_fnc_showClientGuns",_unit];
DWEV_action_inUse = false;