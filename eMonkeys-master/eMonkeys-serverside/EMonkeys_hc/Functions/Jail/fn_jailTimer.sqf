/* 
 
 I Update table of player 
 [II Check for remainingtime <= 0 
 III delete and return money value] 
 
*/ 
private["_player", "_playeruid", "_query", "_injail", "_queryResult"]; 
 
_player = _this select 0; 
_playeruid = _this select 1; 
 
 
 
_query = format["UPDATE players SET jail_time=(jail_time - 1) WHERE playerid='%1'", _playeruid]; 
 
[_query,1] call DB_fnc_asyncCall; 
 
_query = format["SELECT IF( remainingtime <= '0', TRUE, FALSE ) FROM players WHERE playerid='%1'", _playeruid]; 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
[ [_injail] ,"EMonkeys_fnc_execJailTimer",_player,false] call EMonkeys_fnc_mp;