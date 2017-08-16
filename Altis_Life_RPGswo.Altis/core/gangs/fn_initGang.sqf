#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main initialization for gangs?
*/
private["_exitLoop","_group","_wait"];
if((side player) != civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if(count DWEV_gangData == 0) exitWith {}; //Dafuq?

_wait = round(random(8));
sleep _wait;

_exitLoop = false;
{
	_groupName = _x getVariable "gang_name";
	if(!isNil "_groupName") then 
	{
		_groupOwner = _x getVariable["gang_owner",""];
		_groupID = _x getVariable "gang_id";
		
		if(_groupOwner == "" OR isNil "_groupID") exitWith {};
		if((DWEV_gangData select 0) == _groupID && {(DWEV_gangData select 1) == _groupOwner}) exitWith {_group = _x; _exitLoop = true;};
	};
	false;
} count allGroups;

if(!isNil "_group") then 
{
	_groupMembers = _group getVariable ["gang_members",[]];
	[player] join _group;
	waitUntil {_group == grpPlayer};

	player setRank ([(DWEV_gangData select 6)] call DWEV_fnc_convertArmaRank);	
	// ToDO: Automatisch höchsten Rang zum Leder machen
	_members = grpPlayer getVariable "gang_members";
	_ownRank = 0;
	_highestOnlineRank = 0;
	
	{
		_currentMemberRank = (_x select 2);
		if ((getPlayerUID player) IN _x) then
		{
			_ownRank = _currentMemberRank;
		} 
		else
		{
			if (_currentMemberRank > _highestOnlineRank) then {_highestOnlineRank = _currentMemberRank};
		};
		false;
	} count _members;
	
	if (((DWEV_gangData select 1) == (getPlayerUID player)) || _ownRank > _highestOnlineRank) then 
	{
		_group selectLeader player;
		[player,_group] remoteExec ["DWF_fnc_clientGangLeader",_group];
	};
} 
else 
{
	_group = group player;
	_group setVariable["gang_id",(DWEV_gangData select 0),true];
	_group setVariable["gang_owner",(DWEV_gangData select 1),true];
	_group setVariable["gang_name",(DWEV_gangData select 2),true];
	_group setVariable["gang_maxMembers",(DWEV_gangData select 3),true];
	_group setVariable["gang_bank",(DWEV_gangData select 4),true];
	_group setVariable["gang_members",(DWEV_gangData select 5),true];
	_group setVariable["gang_tag",(DWEV_gangData select 7),true];
};

player setVariable ["displayname",format["[%2] %1",getMyName, getMyTag], true];