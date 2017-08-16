#include "..\..\script_macros.hpp"
/*
	File: fn_gangDisband.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the user about disbanding the gang and if the user accepts the gang will be
	disbanded and removed from the database.
*/
private "_action";
_action = [
	 "Du bist dabei, die Gang aufzulösen. Durch Auflösung der Gang wird sie aus der Datenbank entfernt. <br/><br/>Bist du sicher, dass du die Gang auflösen willst? Du erhältst den Preis für die Erstellung nicht zurück.",
	 "Gang auflösen",
	 "Ja",
	 "Nein"
] call BIS_fnc_guiMessage;

if(_action) then {
	hint  "Gang wird aufgelöst...";
	
	if(life_HC_isActive) then {
		[grpPlayer] remoteExec ["HC_fnc_removeGang",HC_Life];
	} else {
		[grpPlayer] remoteExec ["TON_fnc_removeGang",RSERV];
	};
	
} else {
	hint  "Auflösung abgebrochen";
};