/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private[];

_gangInfo = _this select 0;

if (side player != civilian) exitWith {};
if (isNil "_gangInfo") exitWith { [player] joinSilent grpNull; life_session_completed = true; };
if (count _gangInfo == 0) exitWith { [player] joinSilent grpNull; life_session_completed = true; };

_group = ObjNull;
{
	_groupGangId = _x getVariable["gangId", -1];

	if (_groupGangId == _gangInfo select 0) exitWith { _group = _x; };
} forEach allGroups;


if (isNil "_group" || isNull _group) then {
_group = createGroup civilian;
_group setVariable["gangId", _gangInfo select 0, true];
_group setVariable["gangName", _gangInfo select 2, true];
_group setVariable["gangLeader", _gangInfo select 1, true];
_group setVariable["gangLevel", _gangInfo select 4, true];
_group setVariable["gangBank", _gangInfo select 3, true];
};


[player] join _group;


if (getPlayerUID player == _gangInfo select 1) then {
	_group selectLeader player;
	// TODO: Sync this across the network since by default group leaders are NOT sync'd.
	[player,_group] remoteExecCall ["life_fnc_gangLeader", units _group];
} else {
	life_session_completed = true;
};

//[_group, player] remoteExecCall ["life_fnc_buildGetActionObjects",2];
