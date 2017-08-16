/* 
Filename: fn_moveGarageMarker.sqf 
 
Author: Blackd0g 
 
Description: if a garage was moved this will move the marker too 
*/ 
private["_object","_objPos","_name"]; 
 
_object = param [0,objNull,[objNull]]; 
if (isNull _object) exitWith {hint "Ungueltiges Objekt";}; 
 
switch (typeOf _object) do 
{ 
 case "Flag_Quontrol_F" : { 
  _objPos = [20, position _object, direction _object, 270] call BUILD_fnc_calcGarageSpawn; 
  _name = format ["ga_building_spawn_%1", (lhm_gangData select 0)]; 
  _name setMarkerPos _objPos; 
 }; 
 
 case "Land_i_Garage_V1_F": 
 { 
  _objPos = [10, position _object, direction _object, 270] call build_fnc_calcGarageSpawn; 
  _name = format ["ga_vehicle_spawn_%1", (lhm_gangData select 0)]; 
  _name setMarkerPos _objPos; 
 }; 
 case "Land_TentHangar_V1_F": 
 { 
  _objPos = [35, position _object, direction _object, 180] call build_fnc_calcGarageSpawn; 
  _name = format ["ga_air_spawn_%1", (lhm_gangData select 0)]; 
  _name setMarkerPos _objPos; 
 }; 
  
};