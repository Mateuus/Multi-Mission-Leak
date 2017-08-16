/* 
 File: fn_vehicleStore.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Stores the vehicle in the 'Garage' 
*/ 
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit"]; 
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_impound = [_this,1,false,[true]] call BIS_fnc_param; 
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param; 
_perm = [_this,3,false,[true]] call BIS_fnc_param; 
 
if(isNull _vehicle OR isNull _unit) exitWith { 
 { 
  life_impound_inuse = false; 
  life_garage_store = false; 
 } remoteExec ["BIS_FNC_CALL", _unit];  //NEU DA HC OHNE OWNER 
}; //Bad data passed. 
 
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
  { life_impound_inuse = false; } remoteExec ["BIS_FNC_CALL", _unit];  //NEU DA HC OHNE OWNER 
  if(!isNil "_vehicle" && {!isNull _vehicle}) then { 
   deleteVehicle _vehicle; 
  }; 
 }  
  else 
 { 
  //BIS ZUM RESTART EINBEHALTEN TRUE = PERM FALSE = NORMAL 
  if(_perm) then 
  { 
   _query = format["UPDATE vehicles SET active='2' WHERE pid='%1' AND plate='%2'",_uid,_plate]; 
  } else { 
   _query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate]; 
  }; 
  //BIS ZUM RESTART EINBEHALTEN ENDE !!! 
  //waitUntil {!DB_Async_Active}; 
  _thread = [_query,1] call DB_fnc_asyncCall; 
  //waitUntil {scriptDone _thread}; 
  if(!isNil "_vehicle" && {!isNull _vehicle}) then { 
   deleteVehicle _vehicle; 
  }; 
  { life_impound_inuse = false; } remoteExec ["BIS_FNC_CALL", _unit];  //NEU DA HC OHNE OWNER 
 }; 
} 
 else 
{ 
 if(count _vInfo == 0) exitWith 
 { 
  [1,(localize "STR_Garage_Store_NotPersistent")] remoteExec ["tanoarpg_fnc_broadcast",_unit,false]; //NEU DA HC OHNE OWNER 
  { life_garage_store = false; } remoteExec ["BIS_FNC_CALL", _unit];  //NEU DA HC OHNE OWNER 
 }; 
  
 if(_uid != getPlayerUID _unit) exitWith 
 { 
  [1,(localize "STR_Garage_Store_NoOwnership")] remoteExec ["tanoarpg_fnc_broadcast",_unit,false]; //NEU DA HC OHNE OWNER 
  { life_garage_store = false; } remoteExec ["BIS_FNC_CALL", _unit];  //NEU DA HC OHNE OWNER 
 }; 
  
 _query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate]; 
 //waitUntil {!DB_Async_Active}; 
 _thread = [_query,1] call DB_fnc_asyncCall; 
 //waitUntil {scriptDone _thread}; 
 if(!isNil "_vehicle" && {!isNull _vehicle}) then { 
  deleteVehicle _vehicle; 
 }; 
 { life_garage_store = false; } remoteExec ["BIS_FNC_CALL", _unit];  //NEU DA HC OHNE OWNER 
 [1,(localize "STR_Garage_Store_Success")] remoteExec ["tanoarpg_fnc_broadcast",(/*owner*/ _unit),false]; //NEU 
};