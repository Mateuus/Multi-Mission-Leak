 
 
 
 
 
 
private["_vehicle","_plate","_uid","_query","_sql","_dbInfo"]; 
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
if(isNull _vehicle) exitWith {};  
 
_dbInfo = _vehicle getVariable["dbInfo",[]]; 
if(count _dbInfo == 0) exitWith {}; 
_uid = _dbInfo select 0; 
_plate = _dbInfo select 1; 
 
if (!(_vehicle getVariable ["insured", false])) then 
{ 
[_plate,_uid] call DB_fnc_deleteVehicle; 
}; 
 
deleteVehicle _vehicle;