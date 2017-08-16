/*
	ArmA.Network
	Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private["_gangInfo","_group","_groupName"];
_gangInfo = _this select 0;
uisleep 4;
if(side player != civilian) exitWith {["Player Error: Try Rejoining Server..."] call life_fnc_wraruswuth;};
if(isNil "_gangInfo") exitWith {["Error: No Gang Info found..."] call life_fnc_wraruswuth; diag_log "GangInfo isNil";};
if(count _gangInfo isEqualTo 0) exitWith {["Error: No Gang Info found..."] call life_fnc_wraruswuth; diag_log "GangInfo is Zero";};
[player] join (createGroup civilian);
_wait = round(random(8));
sleep _wait;
_exitLoop = false;
{
	_groupName = _x getVariable ["gangName",""];
	if!(_groupName isEqualTo "") then {
		_groupOwner = _x getVariable["gangLeader",""];
		_groupID = _x getVariable ["gangId",-1];
		if(_groupOwner isEqualTo "" OR {_groupID isEqualTo -1}) exitWith {};
		if((life_gangData select 0) isEqualTo _groupID && {_gangInfo select 0 isEqualTo _groupID}) exitWith {_group = _x; diag_log _x; _exitLoop = true;};
	};
} forEach allGroups;

if(!isNil "_group") then {
	[player] join _group;
	if((_gangInfo select 1) isEqualTo (getPlayerUID player)) then {
		_group selectLeader player;
		[player,_group] remoteExecCall ["life_fnc_vexadune",(units _group)];
	};
} else {
	_group = group player;
	if((_gangInfo select 1) isEqualTo (getPlayerUID player)) then {

	};
	_group setVariable["gangId", _gangInfo select 0, true];
	_group setVariable["gangName", _gangInfo select 2, true];
	_group setVariable["gangLeader", _gangInfo select 1, true];
	_group setVariable["gangLevel", _gangInfo select 4, true];
	_group setVariable["gangBank", _gangInfo select 3, true];
};

SideInfo = true;
//[_group, player] remoteExecCall ["life_fnc_buildGetActionObjects",2];
