/* 
 File: fn_remove.sqf 
 Author: Blackd0g 
 
 Description: 
 remove a static object 
*/ 
private ["_object"]; 
 
_object = cursorTarget; 
if (isNull _object) exitWith {}; 
deleteVehicle _object; 
 
 
 
