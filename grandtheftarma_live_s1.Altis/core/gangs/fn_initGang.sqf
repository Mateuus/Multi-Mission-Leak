private ["_waitTime", "_groupName", "_groupOwner", "_groupID", "_group"];
if (playerSide != civilian) exitWith {};
if (count life_gangData == 0) exitWith {
	group player setGroupIdGlobal [""];
};

//--- Parse gang data into private variables
life_gangData params ["_gangID", "_gangOwner", "_gangName", "_gangMaxMembers", "_gangBank", "_gangMembers"];

_waitTime = diag_tickTime + (round random 5);
waitUntil {
	//--- Loop through to make sure there is not a group already created with the gang.
	{
		_groupName = _x getVariable "gang_name";
		if (!isNil "_groupName") then {
			_groupOwner = _x getVariable "gang_owner";
			_groupID = _x getVariable "gang_id";

			if (isNil "_groupOwner" || {isNil "_groupID"}) exitWith {};
			if (_gangID == _groupID && {_gangOwner == _groupOwner}) exitWith {_group = _x};
		};
	} foreach allGroups;

	//--- Timeout of group has been found
	diag_tickTime > _waitTime || {!isNil "_group"}
};

if (!isNil "_group") then {
	[player] joinSilent _group;
	if (_gangOwner == getPlayerUID player) then {
		_group selectLeader player;
		[[player, _group], "clientGangLeader", _group] call GTA_fnc_remoteExec;
	};
} else {
	_group = group player;
	_group setVariable ["gang_id", _gangID, true];
	_group setVariable ["gang_owner", _gangOwner, true];
	_group setVariable ["gang_name", _gangName, true];
	_group setVariable ["gang_maxMembers", _gangMaxMembers, true];
	_group setVariable ["gang_bank", _gangBank, true];
	_group setVariable ["gang_members", _gangMembers, true];

	//--- Set group ID
	_group setGroupIdGlobal [_gangName];
};
