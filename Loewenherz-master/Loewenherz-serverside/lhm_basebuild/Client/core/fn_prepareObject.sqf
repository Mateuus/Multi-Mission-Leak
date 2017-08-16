#include <macro.hpp> 
/* 
 File: fn_prepareObject.sqf 
 Author: Blackd0g 
  
 Description: sets special functions to objects 
*/ 
private ["_object","_objPos","_name","_marker"]; 
 
_object = param [0,objNull,[objNull]]; 
 
if (isNull _object) exitWith {hint "Ungueltiges Objekt";}; 
 
_object allowDamage false; 
 
switch (typeOf _object) do {    
  
 case "Flag_Quontrol_F" : { 
  _objPos = [20, position _object, direction _object, 270] call BUILD_fnc_calcGarageSpawn; 
  _name = format ["ga_building_spawn_%1", (lhm_gangData select 0)]; 
  _marker = createMarker [_name, _objPos];    
  "Land_JumpTarget_F" createVehicle _objPos; // Spawn Visual Marker 
 }; 
  
 case "Land_i_Garage_V1_F" : {           
  _objPos = [10, position _object, direction _object, 270] call BUILD_fnc_calcGarageSpawn; 
  _name = format ["ga_vehicle_spawn_%1", (lhm_gangData select 0)]; 
  _marker = createMarker [_name, _objPos];             
 };  
  
 case "Land_TentHangar_V1_F" : {           
  _objPos = [35, position _object, direction _object, 180] call build_fnc_calcGarageSpawn; 
  _name = format ["ga_air_spawn_%1", (lhm_gangData select 0)]; 
  _marker = createMarker [_name, _objPos]; 
  "Land_HelipadCivil_F" createVehicle _objPos; // Spawn Visual Marker 
 };  
  
 case "Land_Atm_01_F" : {           
   
 };  
  
 case "Land_FuelStation_Feed_F" : { 
  _object setFuelCargo 0; 
 };   
  
 case "Land_fs_feed_F" : { 
  _object setFuelCargo 0; 
 };   
  
 case "Land_Medevac_HQ_V1_F" : {           
   
 };          
  
 case "Land_CashDesk_F" : {           
   
 }; 
  
 case "Land_Metal_wooden_rack_F" : {           
   
 };     
  
 case "Land_ShelvesMetal_F" : {           
   
 }; 
  
 case "B_CargoNet_01_ammo_F" : { 
  clearWeaponCargoGlobal _object; 
  clearMagazineCargoGlobal _object; 
  clearItemCargoGlobal _object; 
  clearBackpackCargoGlobal _object; 
  _object setVariable["lastInventory",[]]; 
 }; 
};