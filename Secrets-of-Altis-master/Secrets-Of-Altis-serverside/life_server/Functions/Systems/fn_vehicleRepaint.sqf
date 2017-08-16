 
 
 
 
 
private["_uid","_type","_classname","_color","_plate","_vInfo"]; 
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_color = [_this,1,-1,[0]] call BIS_fnc_param; 
 
if(isNull _vehicle) exitWith {diag_log "Versuche ein nicht vorhandenes Fahrzeug zu lackieren. Fehler.";}; 
if(!alive _vehicle) exitWith {diag_log "Versuche ein kaputtes Fahrzeug zu lackieren. Fehler.";}; 
_vInfo = _vehicle getVariable["dbInfo",[]]; 
if(count _vInfo == 0) exitWith {}; 
_plate = _vInfo select 1; 
_uid = _vInfo select 0; 
[_uid,_plate,_color] call DB_fnc_repaintVehicle;