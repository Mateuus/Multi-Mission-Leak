private[];

if (!life_placeable_placing_active) exitWith {};

deleteVehicle life_placeable_active_object;
life_placeable_placing_active = false;
life_placeable_active_object = ObjNull;

