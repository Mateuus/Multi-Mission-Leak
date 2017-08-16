/* 
 File: fn_spawnVehicle.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Sends the query request to the database, if an array is returned then it creates 
 the vehicle if it's not in use or dead. 
*/ 
 
if(!isNull life_hc_inUse) exitWith { 
 [serv_sv_use, {serv_sv_use = _this}] remoteExec ["BIS_FNC_CALL", life_hc_inUse]; 
 _this remoteExec ["TEX_fnc_spawnVehicle", life_hc_inUse]; 
}; 
 
private["_vid","_sp","_pid","_query","_sql","_vehicle","_nearVehicles","_name","_side","_tickTime","_dir","_parts"]; 
_vid = [_this,0,-1,[0]] call BIS_fnc_param; 
_pid = [_this,1,"",[""]] call BIS_fnc_param; 
_sp = [_this,2,[],[[],""]] call BIS_fnc_param; 
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param; 
_price = [_this,4,0,[0]] call BIS_fnc_param; 
_dir = [_this,5,0,[0]] call BIS_fnc_param; 
_unit_return = _unit; 
_name = name _unit; 
_side = side _unit; 
_unit = owner _unit; 
 
if(_vid == -1 OR _pid == "") exitWith {}; 
if(_vid in serv_sv_use) exitWith {}; 
serv_sv_use pushBack _vid; 
 
_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_pid]; 
 
//waitUntil{sleep (random 0.3); !DB_Async_Active}; 
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
 [1,format[(localize "STR_Garage_SQLError_Destroyed"),_vInfo select 2]] remoteExec ["tanoarpg_fnc_broadcast",_unit,false]; 
}; 
 
if((_vInfo select 6) == 1) exitWith 
{ 
 serv_sv_use = serv_sv_use - [_vid]; 
 [1,format[(localize "STR_Garage_SQLError_Active"),_vInfo select 2]] remoteExec ["tanoarpg_fnc_broadcast",_unit,false]; 
}; 
if(typeName _sp != "STRING") then { 
 _nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10]; 
} else { 
 _nearVehicles = []; 
}; 
if(count _nearVehicles > 0) exitWith 
{ 
 serv_sv_use = serv_sv_use - [_vid]; 
 [_price,_unit_return] remoteExec ["tanoarpg_fnc_garageRefund",_unit,false]; 
 [1,(localize "STR_Garage_SpawnPointError")] remoteExec ["tanoarpg_fnc_broadcast",_unit,false]; 
}; 
 
_query = format["UPDATE vehicles SET active='1' WHERE pid='%1' AND id='%2'",_pid,_vid]; 
 
//waitUntil {!DB_Async_Active}; 
[_query,false] spawn DB_fnc_asyncCall; 
if(typeName _sp == "STRING") then { 
 _vehicle = createVehicle[(_vInfo select 2),[0,0,999],[],0,"NONE"]; 
 waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; 
 _vehicle allowDamage false; 
 _hs = nearestObjects[getMarkerPos _sp,["Land_Hospital_side2_F"],50] select 0; 
 _vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]); 
 sleep 0.6; 
} else { 
 _vehicle = createVehicle [(_vInfo select 2),_sp,[],0,"NONE"]; 
 waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; 
 _vehicle allowDamage false; 
 _vehicle setPos _sp; 
 _vehicle setVectorUp (surfaceNormal _sp); 
 _vehicle setDir _dir; 
}; 
_vehicle spawn {sleep 4;_this allowDamage true;}; 
//Send keys over the network. 
[_vehicle] remoteExec ["tanoarpg_fnc_addVehicle2Chain",_unit,false]; 
[_pid,_side,_vehicle,1] call TEX_fnc_keyManagement; 
_vehicle lock 2; 
//Reskin the vehicle  
[_vehicle,_vInfo select 8] remoteExecCall ["tanoarpg_fnc_colorVehicle",-2,true]; 
_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true]; 
_vehicle setVariable["dbInfo",[(_vInfo select 4),_vInfo select 7], true]; 
//_vehicle addEventHandler["Killed","_this spawn TEX_fnc_vehicleDead"]; //Obsolete function? 
[_vehicle] call tanoarpg_fnc_clearVehicleAmmo; 
 
//Sets of animations 
if((_vInfo select 1) == "civ" && (_vInfo select 2) == "B_Heli_Light_01_F" && _vInfo select 8 != 13) then 
{ 
 [_vehicle,"civ_littlebird",true] remoteExec ["tanoarpg_fnc_vehicleAnimate",_unit,false]; 
}; 
 
if((_vInfo select 1) == "civ" && (_vInfo select 2) in ["C_Kart_01_F","C_Kart_01_Fuel_F","C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","C_Kart_01_green_F","C_Kart_01_orange_F","C_Kart_01_white_F","C_Kart_01_yellow_F","C_Kart_01_black_F"]) then 
{ 
 _vehicle setDir 0; 
    [_vehicle,"civ_cart",true] remoteExec ["tanoarpg_fnc_vehicleAnimate",_unit,false]; 
}; 
 
if((((_vInfo select 1) == "civ") || ((_vInfo select 1) == "cop")) && ((_vInfo select 2) == "C_Boat_Civil_04_F")) then 
{ 
 [_vehicle] spawn "TEX_FNC_AnimateTrawler"; 
}; 
 
if((_vInfo select 1) == "cop" && (_vInfo select 2) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","I_MRAP_03_F","C_Hatchback_01_F","B_Quadbike_01_F"]) then 
{ 
 [_vehicle,"cop_offroad",true] remoteExec ["tanoarpg_fnc_vehicleAnimate",_unit,false]; 
}; 
 
if((_vInfo select 1) == "cop" && (_vInfo select 2) in ["B_Truck_01_mover_F"]) then 
{ 
 _parts = "Land_City_Pillar_F" createVehicle [0,0,0]; 
 _vehicle setVariable ["a2", _parts, TRUE]; 
  
 _parts = "Land_City_Pillar_F" createVehicle [0,0,0]; 
 _vehicle setVariable ["a3", _parts, TRUE]; 
  
 _parts = "Land_City_Pillar_F" createVehicle [0,0,0]; 
 _vehicle setVariable ["a4", _parts, TRUE]; 
  
 _parts = "Land_MobileLandingPlatform_01_F" createVehicle [0,0,0]; 
 _vehicle setVariable ["a1", _parts, TRUE]; 
  
 _parts = "Land_Crash_barrier_F" createVehicle [0,0,0]; 
 _vehicle setVariable ["a7", _parts, TRUE]; 
  
 _parts = "Land_PierLadder_F" createVehicle [0,0,0]; 
 _vehicle setVariable ["a5", _parts, TRUE]; 
  
 _parts = "Land_PortableLight_double_F" createVehicle [0,0,0]; 
 _vehicle setVariable ["a6", _parts, TRUE]; 
  
 [_vehicle,"cop_hemmit",true] remoteExec ["tanoarpg_fnc_vehicleAnimate",-2,true]; 
}; 
 
if((_vInfo select 1) == "med" && (_vInfo select 2) in ["C_Offroad_01_F","C_SUV_01_F","C_Offroad_01_repair_F","C_Van_01_box_F","C_Hatchback_01_sport_F","B_MRAP_01_F"]) then 
{ 
 [_vehicle,"med_offroad",true] remoteExec ["tanoarpg_fnc_vehicleAnimate",_unit,false]; 
}; 
[1,"Dein Fahrzeug steht bereit!"] remoteExec ["tanoarpg_fnc_broadcast",_unit,false]; 
serv_sv_use = serv_sv_use - [_vid];