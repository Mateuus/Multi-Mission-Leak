 
 
 
 
 
 
 
private["_query","_result","_ret","_id"]; 
 
_id = [_this,0,"0",["0"]] call BIS_fnc_param; 
_unit = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
 
if(!([_id] call life_fnc_isnumber)) exitWith {}; 
 
_query = format["SELECT `%3`.`name`,`candidates`.`playerid`,`candidates`.`policy` FROM `asylumlife%2`.`candidates`, `arma3life`.`%3` WHERE `candidates`.`playerid`='%1' AND `candidates`.`playerid` = `%3`.`playerid`", _id, life_server_instance, srv_table_players]; 
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
 
[[_ret], "life_fnc_candidate", _unit, false] spawn life_fnc_MP;