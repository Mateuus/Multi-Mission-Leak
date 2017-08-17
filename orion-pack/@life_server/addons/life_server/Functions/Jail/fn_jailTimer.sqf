#include "\life_server\script_macros.hpp"
private["_player", "_playeruid", "_query", "_injail", "_queryResult"];
_player = _this select 0;
_playeruid = _this select 1;
_player = owner _player;
_query = format["UPDATE players SET jail_time=(jail_time - 1) WHERE pid='%1'", _playeruid];
[_query,1] call DB_fnc_asyncCall;
_query = format["SELECT IF( remainingtime <= '0', TRUE, FALSE ) FROM players WHERE pid='%1'", _playeruid];
_queryResult = [_query,2] call DB_fnc_asyncCall;