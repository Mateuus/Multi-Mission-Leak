#include <macro.h> 
/* 
 File: 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Master configuration list / array for buyable vehicles & prices and their shop. 
*/ 
private["_shop","_return"]; 
_shop = param [0,"",[""]]; 
if(_shop == "") exitWith {[]}; 
_return = []; 
switch (_shop) do 
{ 
 // *** DONATOR VEHICLE SHOP *** // 
 case "donator_1": 
 {                  // Donator Level 1 
  _return pushBack ["B_Quadbike_01_F",2500]; 
  _return pushBack ["C_Offroad_01_F",12500]; 
  _return pushBack ["C_SUV_01_F",35000]; 
  _return pushBack ["C_Hatchback_01_F",9500]; 
  _return pushBack ["B_Heli_Light_01_F",253000]; // Hummingbird 
 
  if((player getVariable ["LHM_Donatorlevel",0]) == 2) then    // Donator Level 2 
  { 
   _return pushBack ["O_Heli_Light_02_unarmed_F",750000]; // Orca 
   _return pushBack ["I_Truck_02_transport_F",75000]; 
   _return pushBack ["I_Truck_02_covered_F",100000]; 
   _return pushBack ["O_MRAP_02_F",400000]; //ifrit 
  }; 
  if((player getVariable ["LHM_Donatorlevel",0]) >= 3) then    // Donator Level 3 
  { 
   _return pushBack ["O_Heli_Light_02_unarmed_F",750000]; // Orca 
   _return pushBack ["I_Truck_02_transport_F",75000]; 
   _return pushBack ["I_Truck_02_covered_F",100000]; 
   _return pushBack ["I_Heli_Transport_02_F",1200000]; 
   _return pushBack ["C_Hatchback_01_sport_F",25000]; 
   _return pushBack ["B_Truck_01_box_F",350000]; 
   _return pushBack ["O_Truck_03_device_F",450000]; 
   _return pushBack ["O_Heli_Transport_04_bench_F",1200000]; // Taru DLC 
   _return pushBack ["B_Heli_Transport_03_unarmed_F",2000000]; // Huron DLC 
   _return pushBack ["O_MRAP_02_F",400000];//ifrit 
  }; 
 }; 
 
 // *** DONATOR AIR SHOP ***  (not in use)// 
 case "donator_2": 
 {                  // Donator Level 1 
  _return pushBack ["B_Heli_Light_01_F",200000]; 
 
  if((player getVariable ["LHM_Donatorlevel",0]) == 2) then   // Donator Level 2 
  { 
   _return pushBack ["O_Heli_Light_02_unarmed_F",600000]; 
  }; 
 
  if((player getVariable ["LHM_Donatorlevel",0]) >= 3) then   // Donator Level 3 
  { 
   _return pushBack ["O_Heli_Light_02_unarmed_F",600000]; // Orca 
   _return pushBack ["I_Heli_Transport_02_F",1200000]; 
   _return pushBack ["O_Heli_Transport_04_bench_F",1200000]; // Taru DLC 
   _return pushBack ["B_Heli_Transport_03_unarmed_F",2000000]; // Huron DLC 
  }; 
 }; 
}; 
 
_return; 
