 
 
 
 
 
 
 
if (life_server_training) exitWith {}; 
private["_id","_query","_sql"]; 
_id = [_this,0,"",[""]] call BIS_fnc_param; 
 
 
_query = format["DELETE FROM gangs WHERE `id`='%1' LIMIT 1",_id]; 
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; 
 
_query = format["UPDATE %3 SET gang%2='0', gangrank%2='3' WHERE `playerid`='%1'",_id, life_server_instance, srv_table_players]; 
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query, life_server_instance];