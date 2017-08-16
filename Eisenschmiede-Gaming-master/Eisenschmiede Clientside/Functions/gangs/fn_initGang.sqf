#include "..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main initialization for gangs?
*/
private["_exitLoop","_group","_wait"];
if(playerSide != civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if(EQUAL(count ES_gangData,0)) exitWith {}; //Dafuq?

_wait = round(random(8));
sleep _wait;

//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
	_groupName = _x getVariable "gang_name";
	if(!isNil "_groupName") then {
		_groupOwner = _x getVariable ["gang_owner",""];
		_groupID = _x getVariable "gang_id";
		if(_groupOwner isEqualTo "" || isNil "_groupID") exitWith {}; //Seriously?
		if(EQUAL(SEL(ES_gangData,0),_groupID) && {EQUAL(SEL(ES_gangData,1),_groupOwner)}) exitWith {_group = _x; _exitLoop = true;};
	};
} foreach allGroups;

if(!isNil "_group") then {
	[player] join _group;
	if(EQUAL(SEL(ES_gangData,1),getPlayerUID player)) then {
		_group selectLeader player;
		[player,_group] remoteExec ["ES_fnc_clientGangLeader",(units _group)];
	};
} else {
	_group = group player;
	_group setVariable ["gang_id",SEL(ES_gangData,0),true];
	_group setVariable ["gang_owner",SEL(ES_gangData,1),true];
	_group setVariable ["gang_name",SEL(ES_gangData,2),true];
	_group setVariable ["gang_maxMembers",SEL(ES_gangData,3),true];
	_group setVariable ["gang_bank",SEL(ES_gangData,4),true];
	_group setVariable ["gang_members",SEL(ES_gangData,5),true];
};
