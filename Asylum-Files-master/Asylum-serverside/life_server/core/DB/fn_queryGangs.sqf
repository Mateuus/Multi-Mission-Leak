 
 
 
 
 
 
 
private["_query","_result","_ret","_pageNo"]; 
 
_pageNo = [_this,0,0,[0]] call BIS_fnc_param; 
 
_query = format["SELECT DISTINCT `id`,`name`,`wars`,`inviterank`,`kickrank`,`bank`, (SELECT COUNT(*) FROM `arma3life`.`%3` WHERE `gang%2`=`asylumlife%2`.`gangs`.`id`) as `members`,`experience`,`talents` FROM `asylumlife%2`.`gangs` ORDER BY `id` LIMIT %1,50", (_pageNo * 50), life_server_instance, srv_table_players]; 
diag_log format["SQL Query: %1", _query]; 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; 
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