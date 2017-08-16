/* 
 File: fn_getVehicles.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Sends a request to query the database information and returns vehicles. 
*/ 
private["_pid","_side","_type","_unit","_ret","_tickTime","_queryResult"]; 
_pid = param [0,"",[""]]; 
_side = param [1,sideUnknown,[west]]; 
_type = param [2,"",[""]]; 
_unit = param [3,ObjNull,[ObjNull]]; 
 
//Error checks 
if (_pid isEqualTo "" || _side isEqualTo sideUnknown || _type isEqualTo "" || isNull _unit) exitWith 
{ 
 if(!isNull _unit) then 
 { 
  [[[]],"lhm_fnc_impoundMenu",(owner _unit),false] call lhm_fnc_mp; 
 }; 
}; 
 
_unit = owner _unit; 
_side = switch(_side) do 
{ 
 case west:{"cop"}; 
 case civilian: {"civ"}; 
 case independent: {"med"}; 
 case east: {"sec"}; 
 default {"Error"}; 
}; 
 
if(_side == "Error") exitWith { 
 [[[]],"lhm_fnc_impoundMenu",(owner _unit),false] call lhm_fnc_mp; 
}; 
 
_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND type='%3'",_pid,_side,_type]; 
 
 
_tickTime = diag_tickTime; 
_queryResult = [_query,2,true] call DB_fnc_asyncCall; 
 
diag_log "------------- Client Query Request -------------"; 
diag_log format["QUERY: %1",_query]; 
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)]; 
diag_log format["Result: %1",_queryResult]; 
diag_log "------------------------------------------------"; 
 
if (_queryResult isEqualType "") exitWith { 
 [[[]],"lhm_fnc_impoundMenu",(owner _unit),false] call lhm_fnc_mp; 
}; 
 
[[_queryResult],"lhm_fnc_impoundMenu",_unit,false] call lhm_fnc_mp;