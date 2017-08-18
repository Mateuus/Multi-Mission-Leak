private["_player", "_playeruid", "_query", "_injail", "_queryResult"];

_player = _this select 0;
_playeruid = _this select 1;

_player = owner _player;

_query = format["UPDATE players SET jail_time=(jail_time - 1) WHERE playerid='%1'", _playeruid];
waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;

_query = format["SELECT IF( remainingtime <= '0', TRUE, FALSE ) FROM players WHERE playerid='%1'", _playeruid];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;