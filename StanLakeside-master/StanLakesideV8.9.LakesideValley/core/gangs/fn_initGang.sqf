/*
	
	
	Description:
	Main initialization for gangs?
*/
private["_exitLoop","_group"];
if(playerSide != civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if(count life_gangData isEqualTo 0) exitWith {}; //Dafuq?

//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
	_groupName = _x getVariable "gang_name";
	if(!isNil "_groupName") then {
		_groupOwner = _x getVariable["gang_owner",""];
		_groupID = _x getVariable "gang_id";
		if(_groupOwner isEqualTo "" OR isNil "_groupID") exitWith {}; //Seriously?
		if((life_gangData select 0) == _groupID && {(life_gangData select 1) isEqualTo _groupOwner}) exitWith {_group = _x; _exitLoop = true;};
	};
} foreach allGroups;

if(!isNil "_group") then {
	[player] join _group;
	if((life_gangData select 1) isEqualTo (getPlayerUID player)) then {
		_group selectLeader player;
		[player,_group] remoteExecCall ["clientGangLeader",(units _group)];
	};
} else {
	_group = group player;
	_group setVariable["gang_id",(life_gangData select 0),true];
	_group setVariable["gang_owner",(life_gangData select 1),true];
	_group setVariable["gang_name",(life_gangData select 2),true];
	_group setVariable["gang_maxMembers",(life_gangData select 3),true];
	_group setVariable["gang_bank",(life_gangData select 4),true];
	_group setVariable["gang_members",(life_gangData select 5),true];
};