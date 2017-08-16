 
 
 
 
 
 
 
private["_query","_result","_ret","_id"]; 
 
_id = [_this,0,"0",["0"]] call BIS_fnc_param; 
 
_query = format["SELECT `playerid`,`name`,`gangrank%2` FROM `%3` WHERE `gang%2`=""%1"" ORDER BY `gangrank%2`, `name` DESC", _id, life_server_instance, srv_table_players]; 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query]; 
_result = call compile format["%1", _result]; 
if(isNil {((_result select 0) select 0)}) then 
{ 
_ret = []; 
} 
else 
{ 
_ret = (_result select 0); 
}; 
 
_ret;