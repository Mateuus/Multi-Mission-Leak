 
 
 
 
 
 
 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_query = format["SELECT adminlevel FROM %2 WHERE playerid='%1'",_uid,srv_table_players]; 
_ret = [_query,2,false] call DB_fnc_asyncQuery; 
_ret = parseNumber (_ret select 0); 
 
_ret;