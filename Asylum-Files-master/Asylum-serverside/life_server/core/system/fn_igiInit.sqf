private ["_obj", "_obj_type"]; 
 
_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
if (isNull _obj) then {sleep 5}; 
if (isNull _obj) exitWith {}; 
_obj_type = typeOf _obj; 
 
if (_obj_type in ["I_Heli_Transport_02_F"]) then 
{ 
_obj setVariable["box_num", 0, true]; 
_obj setVariable["slots_num", -7, true]; 
_obj setVariable["can_load", true, true]; 
_obj setVariable["can_copilot", true, true]; 
_obj setVariable["can_outside", true, true]; 
_obj setVariable["zload", -2.25, true]; 
_obj setVariable["load_offset", 4.5, true]; 
_obj setVariable["usable_ramp", true, true]; 
}; 
if (_obj_type in ["B_Heli_Light_01_F","C_Heli_Light_01_civil_F"]) then 
{ 
_obj setVariable["box_l", _obj, true]; 
_obj setVariable["box_r", _obj, true]; 
 
_obj setVariable["box_num_l", 0, true]; 
_obj setVariable["box_num_r", 0, true]; 
_obj setVariable["slots_num_l", -1, true]; 
_obj setVariable["slots_num_r", -1, true]; 
_obj setVariable["can_load", true, true]; 
_obj setVariable["can_copilot", true, true]; 
_obj setVariable["can_outside", true, true]; 
_obj setVariable["zload", -0.48, true]; 
_obj setVariable["load_offset", 1, true]; 
_obj setVariable["usable_ramp", true, true]; 
}; 
if (_obj_type in ["C_Offroad_01_F", "B_G_Offroad_01_F"]) then 
{ 
_obj setVariable["box_num", 0, true]; 
_obj setVariable["slots_num", -2, true]; 
_obj setVariable["can_load", true, true]; 
_obj setVariable["can_outside", true, true]; 
_obj setVariable["zload", -0.65, true]; 
_obj setVariable["load_offset", 1.5, true]; 
}; 
if (_obj_type in ["C_Van_01_box_F", "B_G_Van_01_transport_F", "C_Van_01_transport_F"]) then 
{ 
_obj setVariable["box_num", 0, true]; 
_obj setVariable["slots_num", -3, true]; 
_obj setVariable["can_load", true, true]; 
_obj setVariable["can_outside", true, true]; 
_obj setVariable["zload", -0.6, true]; 
_obj setVariable["load_offset", 1, true]; 
}; 
if (_obj_type in ["I_Truck_02_transport_F", "O_Truck_02_transport_F", "I_Truck_02_covered_F", "O_Truck_02_covered_F"]) then 
{ 
_obj setVariable["box_num", 0, true]; 
_obj setVariable["slots_num", -4, true]; 
_obj setVariable["can_load", true, true]; 
_obj setVariable["can_outside", true, true]; 
_obj setVariable["zload", -0.8, true]; 
_obj setVariable["load_offset", -0.5, true]; 
}; 
if (_obj_type in ["O_Truck_03_transport_F", "O_Truck_03_covered_F"]) then 
{ 
_obj setVariable["box_num", 0, true]; 
_obj setVariable["slots_num", -5, true]; 
_obj setVariable["can_load", true, true]; 
_obj setVariable["can_outside", true, true]; 
_obj setVariable["zload", -0.4, true]; 
_obj setVariable["load_offset", 0.5, true]; 
}; 
if (_obj_type in ["B_Truck_01_covered_F", "B_Truck_01_transport_F", "B_Truck_01_box_F"]) then 
{ 
_obj setVariable["box_num", 0, true]; 
_obj setVariable["slots_num", -6, true]; 
_obj setVariable["can_load", true, true]; 
_obj setVariable["can_outside", true, true]; 
if (_obj_type in ["B_Truck_01_box_F", "Marinir_Truck_01_box_FG"]) then 
{ 
_obj setVariable["zload", -0.4, true]; 
_obj setVariable["load_offset", 0.8, true]; 
} 
else 
{ 
_obj setVariable["zload", -0.5, true]; 
_obj setVariable["load_offset", 0, true]; 
}; 
};