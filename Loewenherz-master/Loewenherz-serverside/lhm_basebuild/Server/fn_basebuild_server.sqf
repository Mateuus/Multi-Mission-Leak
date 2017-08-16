/* 
Filename: fn_basebuild_server.sqf 
 
Description: Server Part - initialize basebuilding and spawn objects at server start 
 
Author:Blackd0g 
*/ 
if (isServer) then { 
 
[ 
  "build_fnc_config", 
  "build_fnc_objects", 
  "build_fnc_getPrice", 
  "build_fnc_remove", 
  "build_fnc_setOwnerGang", 
  "build_fnc_updateObjectPos", 
  "build_fnc_calcGarageSpawn", 
  "build_fnc_moveGarageMarker", 
  "build_fnc_spawnObject", 
  "build_fnc_renewObjectFunctions", 
  "build_fnc_openhideoutShop", 
  "build_fnc_AirGarage", 
  "build_fnc_Gatelocks", 
  "build_fnc_moveObject", 
  "build_fnc_placeObject", 
  "build_fnc_removeObject", 
  "build_fnc_setOwner", 
  "build_fnc_toggleBuildMode", 
  "build_fnc_VehicleGarage", 
  "build_fnc_returnVector", 
  "build_fnc_prepareObject" 
] spawn lhm_fnc_streamFunction; 
 
 
// Server Object Array 
If (isNil "lhm_serverObjectMonitor") then { 
lhm_serverObjectMonitor = []; 
}; 
 
LHM_VAR_GANGBASERANGE = 100; 
publicVariable "LHM_VAR_GANGBASERANGE"; 
 
 
 
[] spawn build_fnc_baseBuildStart; 
 
};