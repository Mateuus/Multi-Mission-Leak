/* 
 File: fn_vehicleStore.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Stores the vehicle in the 'Garage' 
*/ 
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit"]; 
_vehicle = param [0,ObjNull,[ObjNull]]; 
_impound = param [1,false,[true]]; 
_unit = param [2,ObjNull,[ObjNull]]; 
 
if(isNull _vehicle OR isNull _unit) exitWith {lhm_impound_inuse = false; (owner _unit) publicVariableClient "lhm_impound_inuse";lhm_garage_store = false;(owner _unit) publicVariableClient "lhm_garage_store";}; //Bad data passed. 
 
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
  lhm_impound_inuse = false; 
  (owner _unit) publicVariableClient "lhm_impound_inuse"; 
  if(!isNil "_vehicle" && {!isNull _vehicle}) then { 
   deleteVehicle _vehicle; 
  }; 
 }  
  else 
 { 
  _query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate]; 
   
  _thread = [_query,1] call DB_fnc_asyncCall; 
  //waitUntil {scriptDone _thread}; 
  if(!isNil "_vehicle" && {!isNull _vehicle}) then { 
   deleteVehicle _vehicle; 
  }; 
  lhm_impound_inuse = false; 
  (owner _unit) publicVariableClient "lhm_impound_inuse"; 
 }; 
} 
 else 
{ 
 if(count _vInfo == 0) exitWith 
 { 
  [[1,(localize "STR_Garage_Store_NotPersistent")],"lhm_fnc_broadcast",(owner _unit),false] call lhm_fnc_mp; 
  lhm_garage_store = false; 
  (owner _unit) publicVariableClient "lhm_garage_store"; 
 }; 
  
 if(_uid != getPlayerUID _unit) exitWith 
 { 
  [[1,(localize "STR_Garage_Store_NoOwnership")],"lhm_fnc_broadcast",(owner _unit),false] call lhm_fnc_mp; 
  lhm_garage_store = false; 
  (owner _unit) publicVariableClient "lhm_garage_store"; 
 }; 
  
 _query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate]; 
  
 _thread = [_query,1] call DB_fnc_asyncCall; 
 //waitUntil {scriptDone _thread}; 
 if(!isNil "_vehicle" && {!isNull _vehicle}) then { 
  deleteVehicle _vehicle; 
 }; 
 lhm_garage_store = false; 
 (owner _unit) publicVariableClient "lhm_garage_store"; 
 [[1,(localize "STR_Garage_Store_Success")],"lhm_fnc_broadcast",(owner _unit),false] call lhm_fnc_mp; 
};