/*
	File: fn_searchAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the searching process.
*/
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {};
hint "Durchsuche Person...";
sleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "Diese Person konnte nicht durchsucht werden."};
[player] remoteExec ["DWEV_fnc_searchClient",_unit];
DWEV_action_inUse = true;