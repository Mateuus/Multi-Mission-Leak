/* 
 File: fn_MobileCopStation.sqf 
 Author: CooliMC "Marc" 
  
 Description: 
 Starts the construction of the mobile Cop Station ! PLS DONt STEAL THIS SCRIPT !!!! IF YOU WANT TO USE IT FOR YOUR SERVER PLS ASK ME IN STEAM (http://steamcommunity.com/id/CooliMC) !!! 
*/ 
 
private["_vehicle","_parts"]; 
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
 
if(isNull _vehicle) exitWith {}; 
 
if(!("B_Truck_01_mover_F" == typeOf _vehicle)) exitWith {}; 
 
if(isNil {_vehicle getVariable "construction";}) then 
{ 
 _vehicle setVariable ["construction", FALSE, TRUE]; 
}; 
 
if((speed _vehicle) > 0) exitWith {hint "Fahrzeug muss stillstehen bevor es sich aufbaut !!!"}; 
 
_vehicle spawn { 
if(!(_this getVariable "construction")) then 
{ 
 _this setVariable ["construction", TRUE, TRUE]; 
 _this allowDamage false; 
  
 {if(!isNil{_x}) then {moveOut _x}} forEach crew _this; 
 _this enableSimulation false; 
  
 _this setVariable ["Fuel", (fuel _this), TRUE]; 
 _this setFuel 0; 
 _this setVariable ["pillar1", TRUE, TRUE]; 
 _this setVariable ["pillar2", TRUE, TRUE]; 
 
 _parts = "Land_FuelStation_Shed_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false;  
 _parts attachTo [_this, [0.06, -0.2, 1.6]]; 
 _this disableCollisionWith _parts; 
 detach _parts; 
 _this disableCollisionWith _parts; 
 _this setVariable ["p1", _parts, TRUE]; 
  
 sleep 0.1; 
  
 _parts = "Land_TTowerSmall_1_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [7.0, -3.0, 6.4]]; 
 detach _parts; 
 _this setVariable ["p2", _parts, TRUE]; 
  
 sleep 0.1; 
  
 _parts = "Land_SolarPanel_1_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [7.0, 1.0, 5.5]]; 
 detach _parts; 
 _this setVariable ["p3", _parts, TRUE]; 
  
 _parts = "Land_SolarPanel_1_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [7.0, 0.9, 5.5]]; 
 detach _parts; 
 _this setVariable ["p4", _parts, TRUE]; 
  
 _parts = "Land_SolarPanel_1_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [7.0, -1.2, 5.5]]; 
 detach _parts; 
 _this setVariable ["p5", _parts, TRUE]; 
  
 sleep 0.1; 
  
 deleteVehicle (_this getVariable "a6"); 
  
 _parts = "Land_PortableLight_double_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts attachTo [_this, [-3.5, 3.4, 5.93]]; 
 detach _parts; 
 _this setVariable ["p17", _parts, TRUE]; 
  
 _parts = "Land_PortableLight_double_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts attachTo [_this, [3.5, 3.4, 5.93]]; 
 detach _parts; 
 _this setVariable ["p18", _parts, TRUE]; 
  
 _parts = "Land_PortableLight_double_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts attachTo [_this, [7.0, 6.5, -0.6]]; 
 detach _parts; 
 _parts setDir ((getDir _this)+30); 
 _this setVariable ["p19", _parts, TRUE]; 
  
 _parts = "Land_PortableLight_double_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts attachTo [_this, [-7.0, -7.5, -0.6]]; 
 detach _parts; 
 _parts setDir ((getDir _this)+220); 
 _this setVariable ["p20", _parts, TRUE]; 
  
 sleep 0.1; 
  
 deleteVehicle (_this getVariable "a5"); 
  
 _parts = "Land_PierLadder_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [-6.8, -5.5, 1.9]]; 
 detach _parts; 
 _this setVariable ["p23", _parts, TRUE]; 
  
 sleep 0.1; 
  
 deleteVehicle (_this getVariable "a7"); 
  
 _parts = "Land_Crash_barrier_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [0.0, 7.8, -1.3]]; 
 detach _parts; 
 _parts setDir ((getDir _this)+270); 
 _this setVariable ["p24", _parts, TRUE]; 
  
 _parts = "Land_Crash_barrier_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [0.0, -8.0, -1.3]]; 
 detach _parts; 
 _parts setDir ((getDir _this)+90); 
 _this setVariable ["p25", _parts, TRUE]; 
  
 _parts = "Land_Crash_barrier_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [-6.8, 7.8, -1.3]]; 
 detach _parts; 
 _parts setDir ((getDir _this)+90); 
 _this setVariable ["p26", _parts, TRUE]; 
  
 _parts = "Land_Crash_barrier_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [6.8, -8.0, -1.3]]; 
 detach _parts; 
 _parts setDir ((getDir _this)+270); 
 _this setVariable ["p27", _parts, TRUE]; 
  
 sleep 0.1; 
  
 deleteVehicle (_this getVariable "a1"); 
  
 _parts = "Land_MobileLandingPlatform_01_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [-0.65, -3.4, 4.65]]; 
 detach _parts; 
 _this setVariable ["p6", _parts, TRUE]; 
  
 sleep 0.1; 
  
 deleteVehicle (_this getVariable "a2"); 
 deleteVehicle (_this getVariable "a3"); 
 deleteVehicle (_this getVariable "a4"); 
  
 _parts = "Land_City_Pillar_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [1.8, 4.0, -2.6]]; 
 detach _parts; 
 _this setVariable ["p7", _parts, TRUE]; 
  
 _parts = "Land_City_Pillar_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [2.8, 4.0, -2.6]]; 
 detach _parts; 
 _this setVariable ["p8", _parts, TRUE]; 
  
 _parts = "Land_City_Pillar_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [3.8, 4.0, -2.6]]; 
 detach _parts; 
 _this setVariable ["p9", _parts, TRUE]; 
  
 _parts = "Land_City_Pillar_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [4.8, 4.0, -2.6]]; 
 detach _parts; 
 _this setVariable ["p10", _parts, TRUE]; 
  
 _parts = "Land_City_Pillar_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [5.8, 4.0, -2.6]]; 
 detach _parts; 
 _this setVariable ["p11", _parts, TRUE]; 
 
 _parts = "Land_City_Pillar_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [-1.8, -4.0, -2.6]]; 
 detach _parts; 
 _this setVariable ["p12", _parts, TRUE]; 
  
 _parts = "Land_City_Pillar_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [-2.8, -4.0, -2.6]]; 
 detach _parts; 
 _this setVariable ["p13", _parts, TRUE]; 
  
 _parts = "Land_City_Pillar_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [-3.8, -4.0, -2.6]]; 
 detach _parts; 
 _this setVariable ["p14", _parts, TRUE]; 
  
 _parts = "Land_City_Pillar_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [-4.8, -4.0, -2.6]]; 
 detach _parts; 
 _this setVariable ["p15", _parts, TRUE]; 
  
 _parts = "Land_City_Pillar_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [-5.8, -4.0, -2.6]]; 
 detach _parts; 
 _this setVariable ["p16", _parts, TRUE]; 
  
 sleep 0.1; 
  
 _parts = "Land_LampHalogen_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts attachTo [_this, [-6.8, -3.0, -0.1]]; 
 detach _parts; 
 _parts setDir ((getDir _this)+260); 
 _this setVariable ["p21", _parts, TRUE]; 
  
 _parts = "Land_LampHalogen_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts attachTo [_this, [-6.8, 2.6, -0.1]]; 
 detach _parts; 
 _parts setDir ((getDir _this)+100); 
 _this setVariable ["p22", _parts, TRUE]; 
  
 {if(!isNil{_x}) then {moveOut _x}} forEach crew _vehicle; 
 [_this] remoteExec ["tanoarpg_fnc_MobileCopStationLocal", -2, true]; 
} 
else 
{ 
 {if(!isNil{_x}) then {moveOut _x}} forEach crew _this; 
 _this enableSimulation false; 
 removeAllActions _this; 
 
 deleteVehicle (_this getVariable "p21"); 
 deleteVehicle (_this getVariable "p22"); 
  
 sleep 0.1; 
  
 deleteVehicle (_this getVariable "p7"); 
 deleteVehicle (_this getVariable "p8"); 
 deleteVehicle (_this getVariable "p9"); 
 deleteVehicle (_this getVariable "p10"); 
 deleteVehicle (_this getVariable "p11"); 
 deleteVehicle (_this getVariable "p12"); 
 deleteVehicle (_this getVariable "p13"); 
 deleteVehicle (_this getVariable "p14"); 
 deleteVehicle (_this getVariable "p15"); 
 deleteVehicle (_this getVariable "p16"); 
  
 _parts = "Land_City_Pillar_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [0.5, -1.85, -0.33]]; 
 _parts setVectorUp [0 , 1000000000000 , 1]; 
 _this setVariable ["a2", _parts, TRUE]; 
  
 _parts = "Land_City_Pillar_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [-0.5, -1.85, -0.33]]; 
 _parts setVectorUp [0 , 1000000000000 , 1]; 
 _this setVariable ["a3", _parts, TRUE]; 
  
 _parts = "Land_City_Pillar_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [0.0, -1.85, -0.33]]; 
 _parts setVectorUp [0 , 1000000000000 , 1]; 
 _this setVariable ["a4", _parts, TRUE]; 
  
 sleep 0.1; 
  
 deleteVehicle (_this getVariable "p6"); 
  
 _parts = "Land_MobileLandingPlatform_01_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [0, -1.1, -0.15]]; 
 _parts setVectorDirAndUp [[1,0,0],[0,0,1]]; 
 _this setVariable ["a1", _parts, TRUE]; 
  
 sleep 0.1; 
  
 deleteVehicle (_this getVariable "p24"); 
 deleteVehicle (_this getVariable "p25"); 
 deleteVehicle (_this getVariable "p26"); 
 deleteVehicle (_this getVariable "p27"); 
  
 _parts = "Land_Crash_barrier_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [-1.0, -0.25, 0.8]]; 
 _parts setVectorDirAndUp [[1,0,0],[0,0,1]]; 
 _parts setvectorup [100 , -0.192 , 1]; 
 _this setVariable ["a7", _parts, TRUE]; 
  
 sleep 0.1; 
  
 deleteVehicle (_this getVariable "p23"); 
  
 _parts = "Land_PierLadder_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [0.0, 0.0, 1.055]]; 
 _parts setvectorup [ 0, 4, 1]; 
 _this setVariable ["a5", _parts, TRUE]; 
  
 sleep 0.1; 
  
 deleteVehicle (_this getVariable "p17"); 
 deleteVehicle (_this getVariable "p18"); 
 deleteVehicle (_this getVariable "p19"); 
 deleteVehicle (_this getVariable "p20"); 
  
 _parts = "Land_PortableLight_double_F" createVehicle getpos _this; 
 _parts allowDamage false; 
 _parts enablesimulation false; 
 _parts attachTo [_this, [0.7, -2.0, 0.28]]; 
 _parts setVectorDirAndUp [[-1,-1000000000000000,0],[0,0,1]]; 
 _parts setvectorup [0 , -75 , -1]; 
 _this setVariable ["a6", _parts, TRUE]; 
  
 sleep 0.1; 
  
 deleteVehicle (_this getVariable "p3"); 
 deleteVehicle (_this getVariable "p4"); 
 deleteVehicle (_this getVariable "p5"); 
  
 sleep 0.1; 
  
 deleteVehicle (_this getVariable "p2"); 
  
 sleep 0.1; 
  
 detach _this; 
 deleteVehicle (_this getVariable "p1"); 
  
 _this setFuel (_this getVariable "Fuel"); 
 _this setVariable ["construction", FALSE, TRUE]; 
  
 {if(!isNil{_x}) then {moveOut _x}} forEach crew _this; 
 [_this] remoteExec ["tanoarpg_fnc_MobileCopStationLocal", -2, true]; 
}; 
};