/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main initialization for gangs?
*/
private["_group","_wait"];
if(playerSide != civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if(count life_gangData == 0) exitWith {}; //Dafuq?

//Loop through to make sure there is not a group already created with the gang.
{
	_groupName = _x getVariable "gang_name";
	if(!isNil "_groupName") then {
		_groupOwner = _x getVariable["gang_owner",""];
		_groupID = _x getVariable "gang_id";
		if(_groupOwner == "" OR isNil "_groupID") exitWith {}; //Seriously?
		if((life_gangData select 0) == _groupID && (life_gangData select 1) == _groupOwner) exitWith {_group = _x};
	};
} foreach allGroups;

if(!isNil "_group") then {
	[player] join _group;
	if((life_gangData select 1) == (getPlayerUID player)) then {
		_group selectLeader player;
	[player,_group] remoteExecCall ["SOA_fnc_clientGangLeader",(units _group)];
	};
} else {
	_group = group player;
	_group setVariable["gang_id",(life_gangData select 0),true];
	_group setVariable["gang_owner",(life_gangData select 1),true];
	_group setVariable["gang_name",(life_gangData select 2),true];
	_group setVariable["gang_maxMembers",(life_gangData select 3),true];
	_group setVariable["gang_bank",(life_gangData select 4),true];
	_group setVariable["gang_members",(life_gangData select 5),true];
	_group setVariable["gang_tag",(life_gangData select 6),true];
};