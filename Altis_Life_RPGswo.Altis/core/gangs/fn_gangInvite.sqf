#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player about an invite.
*/
private["_name","_group"];
_name = param [0,"",[""]];
_group = param [1,grpNull,[grpNull]];
if(_name == "" OR isNull _group) exitWith {}; //Fail horn anyone?
if(!isNil {(group player) getVariable "gang_name"}) exitWith {hint "Du bist schon in einer Gang!"};

_gangName = _group getVariable "gang_name";
_action = [
	format["%1 hat dich zur Gang %2 eingeladen.<br/>Wenn du die Einladung annimmst, bist du ein Teil der Gang und hast Zugang zu den Geldern und der Ganggebiete.",_name,_gangName],
	"Gang Einladung",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;

if(_action && !isNil {grpPlayer getVariable "gang_name"}) exitWith {hint "Du musst erst deine derzeitige Gang verlassen!"};
if(_action && !("ItemRadio" in assignedItems player)) exitWith {hint "Du hast kein Smartphone weshalb du keiner Gang beitreten kannst!"};
if(_action) then 
{
	[player] join _group;
	hint format ["Du bist der Gang %1 beigetreten", _gangName];
	_members = _group getVariable "gang_members";
	_members pushBack [getPlayerUID player, getMyDName, 0];
	_group setVariable["gang_members",_members,true];
	_gangID = (_group getVariable["gang_id",0]);
	[getPlayerUID player,_gangID] remoteExec ["DWF_fnc_addGangPlayer",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
} 
else 
{
	hint format ["Du hast die Einladung der Gang %1 abgelehnt.", _gangName];
};