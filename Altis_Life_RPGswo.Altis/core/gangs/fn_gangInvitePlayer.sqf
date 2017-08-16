#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the invite process?
*/
private["_unit"];
disableSerialization;

if((lbCurSel 2632) == -1) exitWith {hint "Du musst jemand zum Einladen auswählen."};
_unit = call compile format["%1",getSelData(2632)];
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint "Du kannst dich nicht selbst einladen!"};
if(!isNil {(group _unit) getVariable "gang_name"}) exitWith {hint "Der Spieler ist schon in einer Gang!"};

_members = grpPlayer getVariable "gang_members";
_ownRank = 0;

{
	if ((getPlayerUID player) IN _x) exitWith
	{
		_ownRank = (_x select 2);
	};
	false;
} count _members;

if (_ownRank < 2) exitWith {hint "Das einladen neuer Gangmitglieder ist erst ab SERGEANT möglich"};

if(count(grpPlayer getVariable ["gang_members",8]) >= (grpPlayer getVariable ["gang_maxMembers",8])) exitWith {hint "Deine Gang hat die maximale Slot anzahl erreicht, upgrade deine Slots."};


_action = [
	format["Du bist dabei bei %1 in deine Gang einzuladen, wenn er akzeptiert hat er Zugang zu den Mitteln der Gang.",getPlayerDName(_unit)],
	"Spieler in Gang einladen.",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;

if(_action) then 
{
	[getMyDName,grpPlayer] remoteExec ["DWEV_fnc_gangInvite",_unit];
	hint format["Du hast %1 eine einladung zu deiner Gang geschickt.",getPlayerDName(_unit)];
}
else 
{
	hint "Einladung abgebrochen.";
};