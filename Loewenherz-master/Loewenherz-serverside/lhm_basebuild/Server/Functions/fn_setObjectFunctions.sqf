/* 
Filename: fn_setObjectFunctions.sqf 
 
Description: sets some functions for spawnable objects 
 
Author: Blackd0g 
*/ 
private ["_entity","_classname","_gangarea_id","_objPos","_name","_marker","_visualMarker","_gangname"]; 
 
_entity = _this select 0; 
_inventory = _this select 1; 
_gangarea_id = _this select 2; 
_gangname = _this select 3; 
_classname = typeOf _entity; 
 
// Checkup 
if (isNil "_entity") exitWith {"LHM_BASEBUILD: Object-Function Error - Object isNull!"}; 
 
switch (_classname) do 
{ 
 case "Flag_Quontrol_F": 
 { 
  _objPos = [20, position _entity, direction _entity, 0] call BUILD_fnc_calcGarageSpawn; 
  _name = format ["ga_building_spawn_%1",_gangarea_id]; 
  _marker = createMarker [_name, _objPos]; 
  _mtmarkertext = format ["%1 Gang Hideout",_gangname]; 
  _marker setMarkerColor "ColorYellow"; 
  _marker setMarkerType "hd_flag"; 
  _marker setMarkerText _mtmarkertext; 
 
  _visualMarker = "Land_JumpTarget_F" createVehicle _objPos; 
 }; 
 case "Land_i_Garage_V1_F": 
 { 
  _objPos = [10, position _entity, direction _entity, 270] call BUILD_fnc_calcGarageSpawn; 
  _name = format ["ga_vehicle_spawn_%1", _gangarea_id]; 
  _marker = createMarker [_name, _objPos]; 
 }; 
 case "Land_TentHangar_V1_F": 
 { 
  _objPos = [35, position _entity, direction _entity, 180] call build_fnc_calcGarageSpawn; 
  _name = format ["ga_air_spawn_%1", _gangarea_id]; 
  _marker = createMarker [_name, _objPos]; 
  "Land_HelipadCivil_F" createVehicle _objPos; 
 }; 
 case "Land_FuelStation_Feed_F": 
 { 
  _entity setFuelCargo 0; 
 }; 
 
 case "Land_fs_feed_F": 
 { 
  _entity setFuelCargo 0; 
 }; 
 
 case "B_CargoNet_01_ammo_F": 
 { 
  _entity setVariable["lastInventory",[]]; 
  [_entity,_inventory] call build_fnc_populateCargo; 
 }; 
}; 
 
diag_log format ["LHM_BASEBUILD: Object-Function setup for '%1' complete",_classname];