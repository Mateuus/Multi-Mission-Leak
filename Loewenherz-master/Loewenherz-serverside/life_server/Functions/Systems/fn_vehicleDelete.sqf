/* 
 File: fn_vehicleDelete.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Doesn't actually delete since we don't give our DB user that type of 
 access so instead we set it to alive=0 so it never shows again. 
*/ 
private["_vid","_sp","_pid","_query","_sql","_type","_thread"]; 
_vid = param [0,-1,[0]]; 
_pid = param [1,"",[""]]; 
_sp = param [2,2500,[0]]; 
_unit = param [3,ObjNull,[ObjNull]]; 
_type = param [4,"",[""]]; 
 
if(_vid == -1 OR _pid == "" OR _sp == 0 OR isNull _unit OR _type == "") exitWith {}; 
_unit = owner _unit; 
 
_query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND id='%2'",_pid,_vid]; 
 
 
_thread = [_query,1] call DB_fnc_asyncCall; 
