/* 
 File: fn_vehicleRepaint.sqf 
 Author: Play-Germany 
 
 Description: 
 Changes the vehicle color in the DB 
*/ 
 
private["_uid","_vehicle","_color","_plate","_vInfo"]; 
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_color = [_this,1,-1,[0]] call BIS_fnc_param; 
//Error checks 
if(isNull _vehicle) exitWith {}; 
if(!alive _vehicle) exitWith {}; 
_vInfo = _vehicle getVariable["dbInfo",[]]; 
if(count _vInfo == 0) exitWith {}; 
_plate = _vInfo select 1; 
_uid = _vInfo select 0; 
diag_log "Vehicle repainted."; 
if(_uid == "" OR _color == -1 OR _plate == -1) exitWith {diag_log "repaintVehicle canceled!";}; 
 
//Insert valid DB stuff here 
_query = format["vehicleUpdateColor:%1:%2:%3",_color,_plate,_uid]; 
 
waitUntil {sleep (random 0.3); !DB_Async_Active}; 
_queryResult = [_query,1] call DB_fnc_asyncCall;