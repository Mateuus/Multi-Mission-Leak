/*
  File: fn_removePlaceable.sqf
*/

private["_object"];
_object = cursorTarget;
if(isNil "_object") exitWith {};
deleteVehicle _object;
