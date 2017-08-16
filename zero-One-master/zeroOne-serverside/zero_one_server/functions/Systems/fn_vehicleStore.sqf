/* 
 File: fn_vehicleStore.sqf 
*/ 
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit","_cop"]; 
_vehicle = param[0,ObjNull,[ObjNull]]; 
_impound = param[1,false,[true]]; 
_unit = param[2,ObjNull,[ObjNull]]; 
_cop = param[3,false,[true]]; 
 
if(isNull _vehicle || isNull _unit) exitWith { 
 gQbjibQ = false; 
 (owner _unit) publicVariableClient "gQbjibQ"; 
 IkO = false; 
 (owner _unit) publicVariableClient "IkO"; 
 gQbjibQ = nil; 
 IkO = nil; 
}; 
 
_vInfo = _vehicle getVariable["dbInfo",[]]; 
if(count _vInfo > 0) then { 
 _plate = _vInfo select 1; 
 _uid = _vInfo select 0; 
}; 
 
if(_impound) then { 
 if(_vInfo isEqualTo [] || _cop) then { 
  gQbjibQ = false; 
  (owner _unit) publicVariableClient "gQbjibQ"; 
  gQbjibQ = nil; 
  if(!isNil "_vehicle" && {!isNull _vehicle}) then {deleteVehicle _vehicle;}; 
 }else{ 
  _query = format["updateVehicle1:%1:%2",_uid,_plate]; 
  [_query,1] call zero_fnc_asyncCall; 
  if(!isNil "_vehicle" && {!isNull _vehicle}) then {deleteVehicle _vehicle;}; 
  gQbjibQ = false; 
  (owner _unit) publicVariableClient "gQbjibQ"; 
  gQbjibQ = nil; 
 }; 
}else{ 
 if(_vInfo isEqualTo []) exitWith { 
  [typeOf _vehicle, _vehicle getVariable["veh_shop",""]] remoteExecCall ["zero_fnc_GjHbA",(owner _unit)]; 
  IkO = false; 
  (owner _unit) publicVariableClient "IkO"; 
  IkO = nil; 
  if(!isNil "_vehicle" && {!isNull _vehicle}) then {deleteVehicle _vehicle;}; 
 }; 
 if(_uid != getPlayerUID _unit) exitWith { 
  [1,(localize "STR_Garage_Store_NoOwnership")] remoteExecCall ["zero_fnc_cpbpJzzAd",(owner _unit)]; 
  IkO = false; 
  (owner _unit) publicVariableClient "IkO"; 
  IkO = nil; 
 }; 
 _query = format["updateVehicle1:%1:%2",_uid,_plate]; 
 [_query,1] call zero_fnc_asyncCall; 
 if(!isNil "_vehicle" && {!isNull _vehicle}) then {deleteVehicle _vehicle;}; 
 IkO = false; 
 (owner _unit) publicVariableClient "IkO"; 
 IkO = nil; 
 [1,(localize "STR_Garage_Store_Success")] remoteExecCall ["zero_fnc_cpbpJzzAd",(owner _unit)]; 
}; 
