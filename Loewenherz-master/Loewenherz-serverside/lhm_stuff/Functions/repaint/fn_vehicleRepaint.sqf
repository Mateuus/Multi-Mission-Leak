/* 
Author: MooN-Gaming 
 
Thanks to Black lagoon Developing 
*/ 
private["_uid","_color","_plate","_vInfo","_vehicle"]; 
diag_log "******* REPAINTING ********"; 
_vehicle = param [0,ObjNull,[ObjNull]]; 
_color = param [1,-1,[0]]; 
 
//Error checks 
if(isNull _vehicle) exitWith {}; 
if(!alive _vehicle) exitWith {}; 
 
_vInfo = _vehicle getVariable["dbInfo",[]]; 
 
if(count _vInfo == 0) exitWith{}; 
 
_plate = _vInfo select 1; 
_uid = _vInfo select 0; 
diag_log format ["Vehicle %1 repainted to ColorType > %2",typeOf _vehicle,_color]; 
 
[_uid,_plate,_color] call lhm_fnc_saveVehColor;