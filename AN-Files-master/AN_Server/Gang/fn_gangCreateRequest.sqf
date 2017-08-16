
params [
["_unit",objNull,[objNull]],
["_name","",[""]]
];

if (isNull _unit) exitWith {};
if (_name isEqualTo "") exitWith {};

private _ownerID = owner _unit;

if !(isNil {group _unit getVariable "gangName"}) exitWith 
{
["You are already in a gang",true,[1,0,0,1]] remoteExecCall ["life_fnc_notificationHandler", _ownerID];
life_action_gangInUse = nil;
_ownerID publicVariableClient "life_action_gangInUse";
};

private _doesgangexist = ([format["DoesGangExist:%1", _name], 2] call DB_fnc_asyncCall) select 0;

if (_doesgangexist) exitWith 
{
["A gang with this name already exists",true,[1,0,0,1]] remoteExecCall ["life_fnc_notificationHandler", _ownerID];
life_action_gangInUse = nil;
_ownerID publicVariableClient "life_action_gangInUse";
};

private _playerID = getPlayerUID _unit;

private _queryResult = [format ["CreateGangInfo:%1:%2", _playerID, _name], 2] call DB_fnc_asyncCall;

waitUntil { !(isNil "_queryResult") };

private _gangID = (_queryResult select 0);

[format ["UpdatePlayersGang:%1:%2", _gangID, _playerID],1] call DB_fnc_asyncCall;

private _group = createGroup civilian;
_group setVariable ["gangId", _gangID, true];
_group setVariable ["gangName", _name, true];
_group setVariable ["gangLeader", _playerID, true];
_group setVariable ["gangLevel", 1, true];
_group setVariable ["gangBank", 0, true];
_group setGroupIdGlobal [_name];
_group setGroupOwner _ownerID;

_unit setVariable ["gangRank", 5, true];

life_action_gangInUse = nil;
_ownerID publicVariableClient "life_action_gangInUse";

[_group,_name,_gangID] remoteExecCall ["life_fnc_mapumufr", _ownerID];