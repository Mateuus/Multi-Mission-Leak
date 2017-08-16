/* 
 File: fn_getVehicles.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Sends a request to query the database information and returns vehicles. 
*/ 
private["_pid","_side","_type","_query","_unit","_ret","_tickTime","_queryResult"]; 
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_pid = [_this,1,"",[""]] call BIS_fnc_param; 
_side = [_this,2,sideUnknown,[west]] call BIS_fnc_param; 
_type = [_this,3,"",[""]] call BIS_fnc_param; 
 
//Error checks 
if(_pid == "" OR _side == sideUnknown OR _type == "" OR isNull _unit) exitWith 
{ 
 if(!isNull _unit) then 
 { 
  [[[]],"EMonkeys_fnc_setupVehicleGarage",_unit,false] call EMonkeys_fnc_mp; 
 }; 
}; 
 
_side = switch(_side) do 
{ 
 case west:{"cop"}; 
 case civilian: {"civ"}; 
 case east: {"civ"}; 
 case independent: {"med"}; 
 default {"Error"}; 
}; 
 
if(_side == "Error") exitWith { 
 [[[]],"EMonkeys_fnc_setupVehicleGarage",_unit,false] call EMonkeys_fnc_MP; 
}; 
 
if(_type == "impound") then 
{ 
 _query = format["SELECT id, classname, pid, plate, color, fuel FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND impound='1'",_pid,_side]; 
} else { 
 _query = format["SELECT id, classname, pid, plate, color, fuel FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND type='%3' AND impound='0'",_pid,_side,_type]; 
}; 
_queryResult = [_query,2,true] call DB_fnc_asyncCall; 
 
if(typeName _queryResult == "STRING") exitWith { 
 [[[]],"EMonkeys_fnc_setupVehicleGarage",_unit,false] call EMonkeys_fnc_mp; 
}; 
 
[[_queryResult],"EMonkeys_fnc_setupVehicleGarage",_unit,false] call EMonkeys_fnc_mp;