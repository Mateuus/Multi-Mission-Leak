/* 
 File: fn_spawnVehicle.sqf 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Sends the query request to the database, if an array is returned then it creates 
 the vehicle if it's not in use or dead. 
*/ 
private["_vid","_sp","_pid","_query","_sql","_vehicle","_nearVehicles","_name","_side","_tickTime","_dir"]; 
_vid = param [0,-1,[0]]; 
_pid = param [1,"",[""]]; 
_sp = param [2,[],[[],""]]; 
_unit = param [3,ObjNull,[ObjNull]]; 
_price = param [4,0,[0]]; 
_dir = param [5,0,[0]]; 
_unit_return = _unit; 
_name = name _unit; 
_side = side _unit; 
_unit = owner _unit; 
 
if(_vid == -1 OR _pid == "") exitWith {}; 
if(_vid in serv_sv_use) exitWith {}; 
serv_sv_use pushBack _vid; 
 
_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_pid]; 
 
 
_tickTime = diag_tickTime; 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
diag_log "------------- Client Query Request -------------"; 
diag_log format["QUERY: %1",_query]; 
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)]; 
diag_log format["Result: %1",_queryResult]; 
diag_log "------------------------------------------------"; 
 
if(typeName _queryResult == "STRING") exitWith {}; 
 
_vInfo = _queryResult; 
if(isNil "_vInfo") exitWith {serv_sv_use = serv_sv_use - [_vid];}; 
if(count _vInfo == 0) exitWith {serv_sv_use = serv_sv_use - [_vid];}; 
 
if((_vInfo select 5) == 0) exitWith 
{ 
 serv_sv_use = serv_sv_use - [_vid]; 
 [[1,format[(localize "STR_Garage_SQLError_Destroyed"),_vInfo select 2]],"lhm_fnc_broadcast",_unit,false] call lhm_fnc_mp; 
}; 
 
if((_vInfo select 6) == 1) exitWith 
{ 
 serv_sv_use = serv_sv_use - [_vid]; 
 [[1,format[(localize "STR_Garage_SQLError_Active"),_vInfo select 2]],"lhm_fnc_broadcast",_unit,false] call lhm_fnc_mp; 
}; 
if(typeName _sp != "STRING") then { 
 _nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10]; 
} else { 
 _nearVehicles = []; 
}; 
if(count _nearVehicles > 0) exitWith 
{ 
 serv_sv_use = serv_sv_use - [_vid]; 
 [[_price,_unit_return],"lhm_fnc_garageRefund",_unit,false] call lhm_fnc_mp; 
 [[1,(localize "STR_Garage_SpawnPointError")],"lhm_fnc_broadcast",_unit,false] call lhm_fnc_mp; 
}; 
 
_query = format["UPDATE vehicles SET active='1' WHERE pid='%1' AND id='%2'",_pid,_vid]; 
 
 
[_query,false] spawn DB_fnc_asyncCall; 
if(typeName _sp == "STRING") then { 
 if(_sp == "sec_heli_dach") then { 
  _vehicle = createVehicle[(_vInfo select 2),[0,0,999],[],0,"NONE"]; 
  waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; 
  _vehicle allowDamage false; 
  _vehicle setdir 126.459; 
  _vehicle setposATL [3727.29,13391.6,18.9706]; 
  sleep 0.6; 
 } else { 
  _vehicle = createVehicle[(_vInfo select 2),[0,0,999],[],0,"NONE"]; 
  waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; 
  _vehicle allowDamage false; 
  _hs = nearestObjects[getMarkerPos _sp,["Land_Hospital_side2_F"],50] select 0; 
  _vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]); 
  sleep 0.6; 
 }; 
} else { 
 _vehicle = createVehicle [(_vInfo select 2),_sp,[],0,"NONE"]; 
 waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; 
 _vehicle allowDamage false; 
 _vehicle setPos _sp; 
 _vehicle setVectorUp (surfaceNormal _sp); 
 _vehicle setDir _dir; 
}; 
_vehicle allowDamage true; 
//Send keys over the network. 
[[_vehicle],"lhm_fnc_addVehicle2Chain",_unit,false] call lhm_fnc_mp; 
[_pid,_side,_vehicle,1] call TON_fnc_keyManagement; 
_vehicle lock 2; 
//Reskin the vehicle 
[[_vehicle,_vInfo select 8],"lhm_fnc_colorVehicle",nil,false] call lhm_fnc_mp; 
_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true]; 
_vehicle setVariable["dbInfo",[(_vInfo select 4),_vInfo select 7]]; 
//_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"]; //Obsolete function? 
[_vehicle] call lhm_fnc_clearVehicleAmmo; 
 
//Sets of animations 
if((_vInfo select 1) == "civ" && (_vInfo select 2) == "B_Heli_Light_01_F" && _vInfo select 8 != 13) then 
{ 
 [[_vehicle,"civ_littlebird",true],"lhm_fnc_vehicleAnimate",_unit,false] call lhm_fnc_mp; 
}; 
 
if((_vInfo select 1) == "cop" && (_vInfo select 2) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"]) then 
{ 
 [[_vehicle,"cop_offroad",true],"lhm_fnc_vehicleAnimate",_unit,false] call lhm_fnc_mp; 
}; 
 
if((_vInfo select 1) == "med" && (_vInfo select 2) == "C_Offroad_01_F") then 
{ 
 [[_vehicle,"med_offroad",true],"lhm_fnc_vehicleAnimate",_unit,false] call lhm_fnc_mp; 
}; 
// LHM START 
 
if((_vInfo select 1) == "med") then { 
 _vehicle setVariable["lights",false,true]; 
}; 
 
if((_vInfo select 1) == "med" && (_vInfo select 2) == "C_SUV_01_F") then 
{ 
 _vehicle setVariable["lights",false,true]; 
}; 
 
if((_vInfo select 1) == "med" && (_vInfo select 2) == "B_MRAP_01_F") then 
{ 
 _vehicle setVariable["lights",false,true]; 
}; 
 
if((_vInfo select 1) == "civ" && (_vInfo select 2) == "I_G_Offroad_01_F") then 
{ 
 [[_vehicle,"service_truck",true],"lhm_fnc_vehicleAnimate",_unit,false] call lhm_fnc_mp; // ADAC 
 _vehicle setVariable["lights",false,true]; 
}; 
 
if((_vInfo select 1) == "cop") then { 
 _vehicle setVariable["lights",false,true]; 
}; 
 
[[_this select 3,_vehicle],"lhm_fnc_setObjDir",_unit,false] call lhm_fnc_mp; 
serv_sv_use = serv_sv_use - [_vid];