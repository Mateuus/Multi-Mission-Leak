 
 
 
 
 
_query = format["SELECT mailbox FROM players_global WHERE playerid='%1'",getPlayerUID _this]; 
_box = ([_query,2] call DB_fnc_asyncQuery) select 0; 
["life_mailbox",_box] remoteExecCall ["life_fnc_netSetVar",_this];