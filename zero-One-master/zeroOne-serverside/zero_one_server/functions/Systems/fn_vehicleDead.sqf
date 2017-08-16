/* 
 File: fn_vehicleDead.sqf 
*/ 
private["_vehicle","_plate","_uid","_query","_sql","_dbInfo","_thread"]; 
_vehicle = param[0,ObjNull,[ObjNull]]; 
if(isNull _vehicle) exitWith {}; 
 
_dbInfo = _vehicle getVariable["dbInfo",[]]; 
if(_dbInfo isEqualTo []) exitWith {}; 
_uid = _dbInfo select 0; 
_plate = _dbInfo select 1; 
 
_query = format["updateVehicle3:%1:%2",_uid,_plate]; 
_thread = [_query,1] call zero_fnc_asyncCall; 
 
sleep (1.3 * 60); 
if(!isNil "_vehicle" && {!isNull _vehicle}) then { 
 deleteVehicle _vehicle; 
}; 
