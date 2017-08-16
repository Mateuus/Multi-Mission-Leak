 
 
 
 
 
 
 
 
 
 
private["_uid","_name","_side","_money","_bank","_misc","_query","_result","_array"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_name = [_this,1,"",[""]] call BIS_fnc_param; 
_side = [_this,2,civilian,[sideUnknown]] call BIS_fnc_param; 
_money = [_this,3,"0",[""]] call BIS_fnc_param; 
_bank = [_this,4,"2500",[""]] call BIS_fnc_param; 
_misc = [_this,5,[],[[],false]] call BIS_fnc_param; 
 
 
if((_uid == "") OR (_name == "")) exitWith {}; 
_query = format["SELECT name, aliases FROM %2 WHERE playerid='%1'",_uid,srv_table_players]; 
 
 
 
 
 
 
 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query]; 
_result = call compile format["%1", _result]; 
if(!isNil {((_result select 0) select 0)}) exitWith 
{ 
_result = ((_result select 0) select 0); 
_array = (_result select 1); 
_array = [_array] call DB_fnc_mresToArray; 
_array = call compile format["%1", _array]; 
if(!(_name in _array)) then 
{ 
private["_aliases"]; 
_aliases = _array; 
_aliases set[count _aliases, _name]; 
_aliases = [_aliases] call DB_fnc_mresArray; 
_query = format["UPDATE %3 SET aliases='%1' WHERE playerid='%2'",_aliases,_uid,srv_table_players]; 
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query]; 
}; 
}; 
 
_alias = [[_name]] call DB_fnc_mresArray; 
 
 
_query = format["INSERT IGNORE INTO players_global (playerid) VALUES('%1')", _uid]; 
[_query] call DB_fnc_asyncQuery; 
 
switch (_side) do 
{ 
case west: 
{ 
_misc = [_misc] call DB_fnc_mresArray; 
_query = format["INSERT INTO %8 (playerid, name, cash, bankacc, cop_gear, aliases, instance) VALUES('%1', '%2', '%3', '%4', '%5', '%6','%7')",_uid,_name,_money,_bank,_misc,_alias,life_server_instance,srv_table_players]; 
}; 
 
case independent: 
{ 
_misc = [_misc] call DB_fnc_mresArray; 
_query = format["INSERT INTO %7 (playerid, name, cash, bankacc, aliases, instance) VALUES('%1', '%2', '%3', '%4', '%5','%6')",_uid,_name,_money,_bank,_alias,life_server_instance,srv_table_players]; 
}; 
 
case civilian: 
{ 
if(typeName _misc == "BOOL") then {_misc = [_misc] call DB_fnc_bool;}; 
_query = format["INSERT INTO %8 (playerid, name, cash, bankacc, arrested, aliases, civ_gear, instance) VALUES('%1', '%2', '%3', '%4', '%5', '%6','""[]""','%7')", 
_uid,  
_name,  
_money, 
_bank,  
_misc,   
_alias,  
life_server_instance,  
srv_table_players  
]; 
}; 
}; 
 
 
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query]; 
waitUntil {typeName _sql == "STRING"};