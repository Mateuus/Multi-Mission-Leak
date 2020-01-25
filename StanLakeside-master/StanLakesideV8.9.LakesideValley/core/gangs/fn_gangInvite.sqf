#include <macro.h>
/*
	
	
	Description:
	Prompts the player about an invite.
*/

params [["_name", "", [""]], ["_group", grpNull, [grpNull]]];

if(_name isEqualTo "" OR isNull _group) exitWith {}; //Fail horn anyone?
if(!isNil {(group player) getVariable "gang_name"}) exitWith {hint "You are already in a gang"};

_gangName = _group getVariable "gang_name";
_action = [
	format[localize "STR_GNOTF_InviteMSG",_name,_gangName],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[player] join _group;
	[4,_group] remoteExecCall ["TON_fnc_updateGang",(call life_fnc_HCC)];
} else {
	_grpMembers = grpPlayer getVariable "gang_members";
	_grpMembers = _grpMembers - [steamid];
	grpPlayer setVariable["gang_members",_grpMembers,true];
	[4,_grpMembers] remoteExecCall ["TON_fnc_updateGang",(call life_fnc_HCC)];
};