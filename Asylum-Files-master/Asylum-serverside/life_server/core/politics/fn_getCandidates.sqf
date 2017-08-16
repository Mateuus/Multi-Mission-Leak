 
 
 
 
 
 
 
private["_query","_result","_ret","_id"]; 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
 
_query = format["SELECT `%2`.`name`,`candidates`.`playerid` FROM `asylumlife%1`.`candidates`, `arma3life`.`%2` WHERE `candidates`.`playerid` = `%2`.`playerid` ORDER BY `investment` DESC, `timestamp`", life_server_instance, srv_table_players]; 
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
 
[[_ret], "life_fnc_candidates", _unit, false] spawn life_fnc_MP;