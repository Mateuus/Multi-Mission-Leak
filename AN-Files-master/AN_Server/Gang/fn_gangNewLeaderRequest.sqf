params [
["_unit",objNull,[objNull]],
["_group",grpNull,[grpNull]],
["_leader",objNull,[objNull]]
];

if (isNull _unit OR {isNull _group} OR {isNull _leader}) exitWith {};

private _leaderID = getPlayerUID _leader;
private _unitId = getPlayerUID _unit;
private _groupId = _group getVariable ["gangId", -1];

if (_groupId isEqualTo -1) exitWith {};

_leader setVariable ["gangRank",5,true];
_group setVariable ["gangLeader", _unitId, true];
_group setGroupOwner (owner _unit);

[format ["UpdateNewGangLeader:%1:%2", _unitId, _groupId], 1] call DB_fnc_asyncCall;
[format ["UpdatePlayerGangRank:5:%1",_leaderID], 1] call DB_fnc_asyncCall;