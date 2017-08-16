 
 
 
 
 
 
 
private["_pid","_side","_type","_query","_result","_ret"]; 
_pid = [_this,0,"",[""]] call BIS_fnc_param; 
_side = [_this,1,sideUnknown,[west]] call BIS_fnc_param; 
_type = [_this,2,"",[""]] call BIS_fnc_param; 
 
if(_pid == "" OR _side == sideUnknown OR _type == "") exitWith {[]}; 
 
_side = switch(_side) do 
{ 
case west:{"cop"}; 
case civilian: {"civ"}; 
case independent: {"med"}; 
default {"Error"}; 
}; 
 
_query = format["SELECT * FROM %4 WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND type='%3' AND listed='0' ORDER BY classname, color",_pid,_side,_type,srv_table_vehicles]; 
_ret = [_query,2,true] call DB_fnc_asyncQuery; 
 
_ret;