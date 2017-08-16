 
 
 
 
 
 
 
 
if (life_server_training) exitWith {}; 
private["_vid","_pid","_query","_sql"]; 
_vid = [_this,0,-1,[0]] call BIS_fnc_param; 
_pid = [_this,1,"",[""]] call BIS_fnc_param; 
_HC = false; 
 
if(!isNil "hc_1" && life_HC) then { 
if(!isNull hc_1 && ([HC_UID] call ASY_fnc_isUIDActive)) then { 
_HC = true; 
}; 
}; 
 
if(_vid == -1 OR _pid == "") exitWith {[]}; 
 
_query = format["DELETE FROM %3 WHERE plate='%1' AND pid='%2'",_vid,_pid,srv_table_vehicles]; 
[_query] call DB_fnc_asyncQuery;