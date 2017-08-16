 
 
 
 
 
 
 
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit"]; 
_vehicle = _this select 0; 
_impound = _this select 1; 
_unit = _this select 2; 
_damage = _this select 3; 
_fuel = _this select 4; 
 
if(isNull _vehicle OR isNull _unit) exitWith {life_impound_inuse = false; (owner _unit) publicVariableClient "life_impound_inuse";life_garage_store = false;(owner _unit) publicVariableClient "life_garage_store";}; 
 
_vInfo = _vehicle getVariable["dbInfo",[]]; 
if(count _vInfo > 0) then 
{ 
_plate = _vInfo select 1; 
_uid = _vInfo select 0; 
}; 
 
if(_impound) then 
{ 
if(count _vInfo == 0) then  
{ 
life_impound_inuse = false; 
(owner _unit) publicVariableClient "life_impound_inuse"; 
if(!isNil "_vehicle" && {!isNull _vehicle}) then { 
deleteVehicle _vehicle; 
}; 
}  
else 
{ 
_query = format["UPDATE vehicles SET active='0', damage='%3', fuel='%4' WHERE pid='%1' AND plate='%2'",_uid,_plate,_damage,_fuel]; 
 
_thread = [_query,1] call DB_fnc_asyncCall; 
if(!isNil "_vehicle" && {!isNull _vehicle}) then { 
deleteVehicle _vehicle; 
}; 
life_impound_inuse = false; 
(owner _unit) publicVariableClient "life_impound_inuse"; 
}; 
} 
else 
{ 
if(count _vInfo == 0) exitWith 
{ 
[1,(localize "STR_Garage_Store_NotPersistent")] remoteExecCall ["life_fnc_broadcast",(owner _unit)]; 
life_garage_store = false; 
(owner _unit) publicVariableClient "life_garage_store"; 
}; 
 
if(_uid != getPlayerUID _unit) exitWith 
{ 
[1,(localize "STR_Garage_Store_NoOwnership")] remoteExecCall ["life_fnc_broadcast",(owner _unit)]; 
life_garage_store = false; 
(owner _unit) publicVariableClient "life_garage_store"; 
}; 
 
_query = format["UPDATE vehicles SET active='0', damage='%3', fuel='%4' WHERE pid='%1' AND plate='%2'",_uid,_plate,_damage,_fuel]; 
 
_thread = [_query,1] call DB_fnc_asyncCall; 
if(!isNil "_vehicle" && {!isNull _vehicle}) then { 
deleteVehicle _vehicle; 
}; 
life_garage_store = false; 
(owner _unit) publicVariableClient "life_garage_store"; 
[1,(localize "STR_Garage_Store_Success")] remoteExecCall ["life_fnc_broadcast",(owner _unit)]; 
};