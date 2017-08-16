/* 
    Author: Arkensor 
    DESC: Load some global cached vehicles for the shop until BI fixes their shit 
*/ 
private["_object","_pos","_vehicle"]; 
 
//Load underground for air spawn 
{ 
 _object = (_x select 0) createVehicleLocal [0,0,987]; 
 _object enableSimulation false; 
 _object allowDamage false; 
 _object setDamage 0; 
 _object setDir (_x select 2); 
 _object setPosATL (_x select 1); 
 _object call compile format["%1",_x select 3]; 
 
 //Make it more smooth 
 sleep 2; 
 
} forEach [ 
    ["Land_Pier_F",[1472.49,28422.5,1230.02],0,""], 
    ["Land_Pier_F",[1472.39,28437.7,1230.05],0,""] 
]; 
 
//Array to boradcast 
OkWYO = []; 
gyRSj = []; 
{ 
    _pos = [1472.19,28427.9,1232.35]; 
    _pos set [2, ((_pos select 2) + 0.024)]; 
    _vehicle = _x createVehicle _pos; 
    waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; 
    _vehicle allowDamage false; 
    _vehicle enableSimulation false; 
    _vehicle setPosATL _pos; 
    _vehicle hideObjectGlobal true; 
    [_vehicle] call zero_fnc_puM; 
 
    //Add the vehicle to the list 
    OkWYO pushBack [_x, _vehicle]; 
 gyRSj pushBack _vehicle; 
 
 //Make it more smooth 
 sleep 2; 
  
} forEach [ 
 "B_Heli_Light_01_F", 
 "O_Heli_Light_02_unarmed_F", 
 "I_Heli_Transport_02_F", 
 "B_Heli_Transport_03_unarmed_F", 
 "I_Plane_Fighter_03_AA_F", 
 "B_Plane_CAS_01_F", 
 "O_Plane_CAS_02_F", 
    "O_Heli_Transport_04_bench_F", 
    "O_Heli_Transport_04_covered_F", 
    "O_Heli_Transport_04_box_F", 
    "O_Heli_Attack_02_F", 
    "O_Heli_Attack_02_black_F", 
 "B_Heli_Transport_03_F", 
 "B_Heli_Transport_01_F", 
 "I_Heli_light_03_F", 
 "B_Heli_Attack_01_F", 
 "B_Heli_Transport_01_camo_F", 
 "C_Heli_Light_01_civil_F", 
    "I_Heli_light_03_unarmed_F", 
    "O_Heli_Transport_04_medevac_F" 
]; 
 
publicVariable "OkWYO"; 
