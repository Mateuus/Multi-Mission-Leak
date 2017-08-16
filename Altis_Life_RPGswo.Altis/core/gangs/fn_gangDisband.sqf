#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the user about disbanding the gang and if the user accepts the gang will be
	disbanded and removed from the database.
*/
private["_action"];
_isOwner = ((getPlayerUID player) == (grpPlayer getVariable "gang_owner"));
if (!_isOwner) exitWith {hint "Nur der Leader kann die Gang auflösen"};

_action = [
	"Du bist dabei die Gang aufzulösen, bei der auflösung wird die Gang aus der Datenbank entfernt und die Gang aufgelöst.<br/><br/>Bist du sicher, dass du die Gang auflösen möchtes? Du bekommst keine erstattung.",
	"Gang aufösen",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;




if(_action) then 
{
	hint "Gang wird aufgelöst....";
	[grpPlayer] remoteExec ["DWF_fnc_removeGang",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Keine remoteExec
} 
else 
{
	hint "Gangauflösung abgebrochen.";
};