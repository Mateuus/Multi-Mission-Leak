#include "..\..\script_macros.hpp"
/*
	File: fn_gangInvitePlayer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the invite process?
*/
private "_unit";
disableSerialization;

if(EQUAL((lbCurSel 2632),-1)) exitWith {hint  "Du musst einen Spieler zum Einladen auswählen!"};
_unit = call compile format["%1",CONTROL_DATA(2632)];

if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {};
if(!isNil {(group _unit) GVAR "gang_name"}) exitWith {hint "This player is already in a gang"}; //Added

if(count(grpPlayer GVAR ["gang_members",8]) == (grpPlayer GVAR ["gang_maxMembers",8])) exitWith {hint  "Deine Gang hat die maximale Anzahl an Plätzen erreicht, bitte erhöhe das Limit deiner Gang."};

_action = [
	format[ "Du bist dabei, %1 in deine Gang einzuladen. Wenn die Einladung angenommen wird, hat der Spieler Zugang zu den Mitteln der Gang.",_unit GVAR ["realname",name _unit]],
	 "Gang Einladung",
	 "Ja",
	 "Nein"
] call BIS_fnc_guiMessage;

if(_action) then {
	[profileName,grpPlayer] remoteExec ["life_fnc_gangInvite",_unit];
	_members = grpPlayer GVAR "gang_members";
	_members pushBack getPlayerUID _unit;
	grpPlayer SVAR ["gang_members",_members,true];
	hint format[ "Du hast eine Einladung in deine Gang an %1 gesendet",_unit GVAR ["realname",name _unit]];
} else {
	hint  "Einladung abgebrochen";
};