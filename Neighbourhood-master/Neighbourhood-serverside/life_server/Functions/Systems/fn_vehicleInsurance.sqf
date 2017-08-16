 
 
 
 
 
 
 
 
private["_vehicle","_dbInfo"]; 
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
if(isNull _vehicle || isNil "_vehicle") exitWith {}; 
_dbInfo = _vehicle getVariable ["dbInfo",[]]; 
if(count _dbInfo == 0) exitWith {}; 
_uid = _dbInfo select 0; 
_plate = _dbInfo select 1; 
 
 
 
 
 
 
 
 
 
 
 
 
 
_query = format["UPDATE vehicles SET insurance='1' WHERE pid='%1' AND plate='%2'",_uid,_plate]; 
 
waitUntil {!DB_Async_Active}; 
_thread = [_query,1] call DB_fnc_asyncCall;