#include "..\..\script_macros.hpp"
/*
	File: fn_gangInvite.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player about an invite.
*/
private ["_action","_grpMembers"];
params [
	["_name","",[""]],
	["_group",grpNull,[grpNull]]
];

if(EQUAL(_name,"") OR isNull _group) exitWith {}; //Fail horn anyone?
if(!isNil {(group player) GVAR "gang_name"}) exitWith {hint  "Sie befinden sich bereits in einer Gang.";};

_gangName = _group GVAR "gang_name";
_action = [
	format[ "%1 hat dich zu einer Gang namens %2 eingeladen <br/> Wenn Du die Einladung annimmst, wirst du ein Teil der Gang und bekommst Zugang zu den Gang-Konten und kontrollierten Gang Verstecken.",_name,_gangName],
	 "Gang Einladung",
	 "Ja",
	 "Nein"
] call BIS_fnc_guiMessage;

if(_action) then {
	[player] join _group;
	
	if(life_HC_isActive) then {
		[4,_group] remoteExecCall ["HC_fnc_updateGang",HC_Life];
	} else {
		[4,_group] remoteExecCall ["TON_fnc_updateGang",RSERV];
	};
	
} else {
	_grpMembers = grpPlayer GVAR "gang_members";
	SUB(_grpMembers,[steamid]);
	grpPlayer SVAR ["gang_members",_grpMembers,true];
	
	if(life_HC_isActive) then {
		[4,_grpMembers] remoteExecCall ["HC_fnc_updateGang",HC_Life];
	} else {
		[4,_grpMembers] remoteExecCall ["TON_fnc_updateGang",RSERV];
	};
	
};