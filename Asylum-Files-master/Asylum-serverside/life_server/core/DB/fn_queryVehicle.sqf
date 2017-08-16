 
 
 
 
 
 
 
private["_vid","_pid","_query","_result","_ret"]; 
_vid = [_this,0,-1,[0]] call BIS_fnc_param; 
_pid = [_this,1,"",[""]] call BIS_fnc_param; 
 
if(_vid == -1 OR _pid == "") exitWith {[]}; 
_ret = []; 
 
_query = format["SELECT * FROM %3 WHERE id='%1' AND pid='%2'",_vid,_pid,srv_table_vehicles]; 
_ret = [_query,2,false] call DB_fnc_asyncQuery; 
 
_ret;