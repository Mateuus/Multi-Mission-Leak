 
 
 
 
 
 
 
 
private["_vid","_sp","_pid","_query","_sql","_vehicle","_nearVehicles","_name","_side","_tickTime","_dir"]; 
_vid = _this select 0; 
_pid = _this select 1; 
_sp = _this select 2; 
_unit = _this select 3; 
_price = _this select 4; 
_dir = _this select 5; 
_unit_return = _unit; 
_name = name _unit; 
_side = side _unit; 
_unit = owner _unit; 
 
if(_vid == -1 OR _pid == "") exitWith {}; 
if(_vid in serv_sv_use) exitWith {}; 
serv_sv_use pushBack _vid; 
 
_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color, damage, fuel FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_pid]; 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
if(typeName _queryResult == "STRING") exitWith {}; 
 
_vInfo = _queryResult; 
if(isNil "_vInfo") exitWith {serv_sv_use = serv_sv_use - [_vid];}; 
if(count _vInfo == 0) exitWith {serv_sv_use = serv_sv_use - [_vid];}; 
 
if((_vInfo select 5) == 0) exitWith 
{ 
serv_sv_use = serv_sv_use - [_vid]; 
[1,format[(localize "STR_Garage_SQLError_Destroyed"),_vInfo select 2]] remoteExecCall ["life_fnc_broadcast",_unit]; 
}; 
 
if((_vInfo select 6) == 1) exitWith 
{ 
serv_sv_use = serv_sv_use - [_vid]; 
[1,format[(localize "STR_Garage_SQLError_Active"),_vInfo select 2]] remoteExecCall ["life_fnc_broadcast",_unit]; 
}; 
if(typeName _sp != "STRING") then { 
_nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10]; 
} else { 
_nearVehicles = []; 
}; 
if(count _nearVehicles > 0) exitWith 
{ 
serv_sv_use = serv_sv_use - [_vid]; 
[_price,_unit_return] remoteExecCall ["life_fnc_garageRefund",_unit]; 
[1,(localize "STR_Garage_SpawnPointError")] remoteExecCall ["life_fnc_broadcast",_unit]; 
}; 
 
_query = format["UPDATE vehicles SET active='1' WHERE pid='%1' AND id='%2'",_pid,_vid]; 
 
 
[_query,false] call DB_fnc_asyncCall; 
if(typeName _sp == "STRING") then { 
 
_vehicle = createVehicle[(_vInfo select 2),[0,0,999],[],0,"NONE"]; 
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; 
_vehicle allowDamage false; 
_hs = nearestObjects[getMarkerPos _sp,["Land_Hospital_side2_F"],50] select 0; 
_vehicle setPosATL (_hs modelToWorld [-0.4,-4,11.5]); 
 
} else { 
 
_vehicle = createVehicle [(_vInfo select 2),_sp,[],0,"NONE"]; 
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; 
_vehicle allowDamage false; 
_vehicle setPos _sp; 
_vehicle setVectorUp (surfaceNormal _sp); 
_vehicle setDir _dir; 
}; 
_vehicle allowDamage true; 
[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain",_unit]; 
[_pid,_side,_vehicle,1] call SOA_fnc_keyManagement; 
_vehicle lock 2; 
[_vehicle,_vInfo select 8] remoteExec ["life_fnc_colorVehicle",0]; 
_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true]; 
_vehicle setVariable["dbInfo",[(_vInfo select 4),_vInfo select 7]]; 
[_vehicle] call life_fnc_clearVehicleAmmo; 
 
 
 
if((_vInfo select 2) in ["B_Heli_Transport_03_unarmed_F","B_Slingload_01_Cargo_F","B_Slingload_01_Fuel_F","B_Slingload_01_Ammo_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F"]) then { 
_vehicle enableRopeAttach true; 
} else { 
_vehicle enableRopeAttach false; 
}; 
 
_vehicle setdamage (_vInfo select 9); 
_vehicle setfuel (_VInfo select 10); 
_vehicle setVariable ["versichert",false,true]; 
 
 
 
switch(_vInfo select 1) do { 
 
case "civ":  
{ 
if((_vInfo select 2) == "B_Plane_CAS_01_F") then { 
[_vehicle,(_vInfo select 8)] remoteExecCall ["life_fnc_flugzeug",_unit]; 
 
_weapons = ["1000Rnd_Gatling_30mm_Plane_CAS_01_F","2Rnd_Missile_AA_04_F","6Rnd_Missile_AGM_02_F","4Rnd_Bomb_04_F","7Rnd_Rocket_04_HE_F","7Rnd_Rocket_04_AP_F","120Rnd_CMFlare_Chaff_Magazine"];  
{_vehicle removeMagazinesTurret [_x,[-1]]} foreach _weapons; 
{_vehicle removeWeapon _x} forEach (weapons _vehicle); 
}; 
 
if((_vInfo select 2) == "C_Quadbike_01_black_F") then { 
[_vehicle] remoteExecCall ["life_fnc_erollator",_unit]; 
}; 
 
if((_vInfo select 2) == "C_Offroad_01_F") then { 
[_vehicle,"civ_offroad",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
}; 
 
case "cop":  
{ 
if(_vInfo select 2 == "C_Offroad_01_F") then { 
[_vehicle,"cop_offroad",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if(_vInfo select 2 == "C_Offroad_02_unarmed_F") then { 
[_vehicle,"cop_jeep",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if(_vInfo select 2 == "C_SUV_01_F" && (_vInfo select 8) == 1) then { 
[_vehicle,"cop_suv",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if(_vInfo select 2 == "C_SUV_01_F" &&(_vInfo select 8) == 4) then { 
[_vehicle,"cop_suv_bund",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if(_vInfo select 2 in ["C_Hatchback_01_F","C_Hatchback_01_sport_F"]) then { 
[_vehicle,"cop_limo",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if(_vInfo select 2 == "I_MRAP_03_F") then { 
[_vehicle,"cop_strider",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if(_vInfo select 2 == "B_MRAP_01_F") then { 
[_vehicle,"cop_hunter",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if(_vInfo select 2 == "C_Quadbike_01_F") then { 
[_vehicle,"cop_quad",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if(_vInfo select 2 == "I_Truck_02_covered_F") then { 
[_vehicle,"cop_zamak",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
}; 
 
case "med":  
{ 
if((_vInfo select 2) == "C_Offroad_01_F") then { 
[_vehicle,"med_offroad",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if(_vInfo select 2 == "C_Offroad_02_unarmed_F") then { 
[_vehicle,"ahw_jeep",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if((_vInfo select 2) == "C_SUV_01_F") then { 
[_vehicle,"ahw_suv",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if((_vInfo select 2) == "I_G_Offroad_01_F") then { 
[_vehicle,"adac_offroad",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if((_vInfo select 2) == "C_Van_01_box_F") then { 
[_vehicle,"ahw_van",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if((_vInfo select 2) == "I_Truck_02_box_F") then { 
[_vehicle,"ahw_zamak",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if((_vInfo select 2) == "I_Truck_02_covered_F") then { 
[_vehicle,"ahw_zamaktransport",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
 
if((_vInfo select 2) == "B_Truck_01_mover_F") then { 
[_vehicle,"ahw_hemtt",true] remoteExec ["life_fnc_vehicleAnimate",_unit]; 
}; 
}; 
}; 
 
if(_side == west) then { 
_vehicle addItemCargoGlobal ["20Rnd_556x45_UW_mag",4]; 
_vehicle addItemCargoGlobal ["arifle_SDAR_F",2]; 
}; 
 
[1,"Dein Fahrzeug steht bereit!"] remoteExecCall ["life_fnc_broadcast",_unit]; 
_vehicle remoteExecCall ["life_fnc_kennzeichenCheck",_unit]; 
_vehicle remoteExec ["life_fnc_versicherungCheck",_unit]; 
serv_sv_use = serv_sv_use - [_vid];