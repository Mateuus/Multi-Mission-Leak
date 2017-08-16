params [
["_mode",-1,[0]],
["_unit",objNull,[objNull]],
["_newRank",-1,[0]],
["_rankName","",[""]]
];

try
{
if (isNull _unit) then 
{
throw "Gang Rank Request Error - Player is Null";
};

if (_newRank isEqualTo -1 OR {_mode isEqualTo -1}) then 
{
throw "Gang Rank Request Error - Rank/Mode is not given";
};

if (_rankName isEqualTo "") then 
{
throw "Gang Rank Request Error - Rank Name String Error";
};

private _playerID = getPlayerUID _unit;
private _ownerID = owner _unit;

[format ["UpdatePlayerGangRank:%1:%2", _newRank, _playerID], 1] call DB_fnc_asyncCall;

if (_mode isEqualTo 0) then 
{
[0,_rankName, _newRank] remoteExecCall ["life_fnc_gangRankChange",_ownerID];
}
else 
{
[1,_rankName, _newRank] remoteExecCall ["life_fnc_gangRankChange",_ownerID];
};
}
catch
{
_exception call AN_server_log;
};    