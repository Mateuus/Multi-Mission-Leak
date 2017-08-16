/* 
 File: fn_objects.sqf 
 Author: Blackd0g 
 
 Description: 
 master array of buildable objects 
 
 [ 
  string classname, 
  number price, 
  number weaponstorage, 
  number itemstorage, 
  bool persistent, 
  string type, 
  string description 
  number allowed 
  requirements -> [["Land_Fire_barrel_burning",4],["Land_fortified_nest_small",1],["SearchLight_TK_INS_EP1",1]] 
 ] 
 
 */ 
 
 
 
 
private ["_objects", "_filter"]; 
_filter = _this select 0; 
_objects = []; 
 
switch (_filter) do { 
 
 case "Traffic" : { 
 
  _objects = [ 
   ["RoadCone_F", 50, 0, 0, false, "ServiceItem", "Roadcone",2], 
   ["RoadCone_L_F", 100, 0, 0, false, "ServiceItem", "Roadone with a light",2], 
   ["RoadBarrier_F", 200, 0, 0, false, "ServiceItem", "Road Barrier",2], 
   ["RoadBarrier_small_F", 250, 0, 0, false, "ServiceItem", "Road Barrier with a light",2] 
  ]; 
 }; 
 
 case "Police" : { 
 
  _objects = [ 
   ["Land_CncBarrier_F", 1000, 0, 0, false, "RoadBlock", "Description",2], 
   ["Land_CncBarrier_stripes_F", 1000, 0, 0, false, "RoadBlock", "Description",2], 
   ["TapeSign_F", 300, 0, 0, false, "ServiceItem", "Description",2] 
  ]; 
 }; 
 
 case "GangArea" : { 
 
  _objects = [ 
   ["Land_spp_Mirror_F", 400000, 0, 0, true, "Power", "Solar Power Panels",3,[]], 
   ["Land_cargo_addon02_V2_F", 300000, 0, 0, true, "Building", "a small Cargo Shelter",2,[["Land_spp_Mirror_F",3]]], 
   ["Land_CashDesk_F", 1000000, 0, 0, true, "Market", "Market Store",1,[["Land_spp_Mirror_F",3],["Land_cargo_addon02_V2_F",1]]], 
   ["Land_i_Addon_03_V1_F", 1250000, 0, 0, true, "Building", "Small House V1",1,[["Land_spp_Mirror_F",3],["Land_cargo_addon02_V2_F",1],["Land_CashDesk_F",1]]], 
   ["Land_Metal_wooden_rack_F", 1500000, 0, 0, true, "GeneralStore", "General Store",1,[["Land_spp_Mirror_F",3],["Land_cargo_addon02_V2_F",1],["Land_CashDesk_F",1],["Land_i_Addon_03_V1_F",1]]], 
   ["Land_i_Addon_02_V1_F", 2000000, 0, 0, true, "Building", "Small House V2",1,[["Land_spp_Mirror_F",3],["Land_cargo_addon02_V2_F",1],["Land_CashDesk_F",1],["Land_i_Addon_03_V1_F",1],["Land_Metal_wooden_rack_F",1]]], 
   ["Land_Atm_01_F", 2500000, 0, 0, true, "ATM", "ATM (Cash Terminal)",1,[["Land_spp_Mirror_F",3],["Land_cargo_addon02_V2_F",1],["Land_CashDesk_F",1],["Land_i_Addon_03_V1_F",1],["Land_Metal_wooden_rack_F",1],["Land_i_Addon_02_V1_F",1]]], 
   ["Land_Medevac_HQ_V1_F", 5000000, 0, 0, true, "Healingstation", "Medical Station (Dr. House is waiting for you)",1,[["Land_spp_Mirror_F",3],["Land_cargo_addon02_V2_F",1],["Land_CashDesk_F",1],["Land_i_Addon_03_V1_F",1],["Land_Metal_wooden_rack_F",1],["Land_i_Addon_02_V1_F",1],["Land_Atm_01_F",1]]], 
   ["Land_Cargo_House_V1_F", 6000000, 0, 0, true, "Building", "Jail (can be locked)",1,[["Land_spp_Mirror_F",3],["Land_cargo_addon02_V2_F",1],["Land_CashDesk_F",1],["Land_i_Addon_03_V1_F",1],["Land_Metal_wooden_rack_F",1],["Land_i_Addon_02_V1_F",1],["Land_Atm_01_F",1],["Land_Medevac_HQ_V1_F",1]]], 
   ["Land_ShelvesMetal_F", 7000000, 0, 0, true, "ClothingStore", "Clothing Store",1,[["Land_spp_Mirror_F",3],["Land_cargo_addon02_V2_F",1],["Land_CashDesk_F",1],["Land_i_Addon_03_V1_F",1],["Land_Metal_wooden_rack_F",1],["Land_i_Addon_02_V1_F",1],["Land_Atm_01_F",1],["Land_Medevac_HQ_V1_F",1],["Land_Cargo_House_V1_F",1]]], 
   ["Land_i_Garage_V1_F", 10000000, 0, 0, true, "VehicleGarage", "Vehicle Garage",1,[["Land_spp_Mirror_F",3],["Land_cargo_addon02_V2_F",1],["Land_CashDesk_F",1],["Land_i_Addon_03_V1_F",1],["Land_Metal_wooden_rack_F",1],["Land_i_Addon_02_V1_F",1],["Land_Atm_01_F",1],["Land_Medevac_HQ_V1_F",1],["Land_ShelvesMetal_F",1],["Land_Cargo_House_V1_F",1]]], 
   ["Land_fs_feed_F", 3000000, 0, 0, true, "Fuelstation", "Gas Station (refills Ground Vehicles)",1,[["Land_spp_Mirror_F",3],["Land_cargo_addon02_V2_F",1],["Land_CashDesk_F",1],["Land_i_Addon_03_V1_F",1],["Land_Metal_wooden_rack_F",1],["Land_i_Addon_02_V1_F",1],["Land_Atm_01_F",1],["Land_Medevac_HQ_V1_F",1],["Land_ShelvesMetal_F",1],["Land_i_Garage_V1_F",1],["Land_Cargo_House_V1_F",1]]], 
   ["Land_TentHangar_V1_F", 12000000, 0, 0, true, "HeliSpawn", "Helicopter Garage and Landingplace",1,[["Land_spp_Mirror_F",3],["Land_cargo_addon02_V2_F",1],["Land_CashDesk_F",1],["Land_i_Addon_03_V1_F",1],["Land_Metal_wooden_rack_F",1],["Land_i_Addon_02_V1_F",1],["Land_Atm_01_F",1],["Land_Medevac_HQ_V1_F",1],["Land_ShelvesMetal_F",1],["Land_i_Garage_V1_F",1],["Land_fs_feed_F",1],["Land_Cargo_House_V1_F",1]]], 
   ["Land_FuelStation_Feed_F", 6000000, 0, 0, true, "Kerosinstation", "Kerosin Station (can refill Air-Vehicles)",1,[["Land_spp_Mirror_F",3],["Land_cargo_addon02_V2_F",1],["Land_CashDesk_F",1],["Land_i_Addon_03_V1_F",1],["Land_Metal_wooden_rack_F",1],["Land_i_Addon_02_V1_F",1],["Land_Atm_01_F",1],["Land_Medevac_HQ_V1_F",1],["Land_ShelvesMetal_F",1],["Land_i_Garage_V1_F",1],["Land_fs_feed_F",1],["Land_TentHangar_V1_F",1],["Land_Cargo_House_V1_F",1]]], 
   ["B_CargoNet_01_ammo_F", 15000000, 500, 500, true, "StorageBox", "Storage Box can hold Items,Weapons and Magazines!",1,[["Land_spp_Mirror_F",3],["Land_cargo_addon02_V2_F",1],["Land_CashDesk_F",1],["Land_i_Addon_03_V1_F",1],["Land_Metal_wooden_rack_F",1],["Land_i_Addon_02_V1_F",1],["Land_Atm_01_F",1],["Land_Medevac_HQ_V1_F",1],["Land_ShelvesMetal_F",1],["Land_i_Garage_V1_F",1],["Land_fs_feed_F",1],["Land_TentHangar_V1_F",1],["Land_FuelStation_Feed_F",1],["Land_Cargo_House_V1_F",1]]] 
  ]; 
 }; 
 
 case "Optional" : { 
 
  _objects = [ 
   ["Target_PopUp_Moving_F", 100000, 0, 0, true, "Optional", "Training Popup Target",2,[]], 
   ["Land_MarketShelter_F", 50000, 0, 0, true, "Optional", "Market Shelter",1,[]], 
   ["Land_Shed_Small_F", 350000, 0, 0, true, "Optional", "Small Vehicle Shed",1,[]], 
   ["Land_Sunshade_03_F", 75000, 0, 0, true, "Optional", "Sunshade ",1,[]], 
   ["Campfire_burning_F", 150000, 0, 0, true, "Optional", "Campfire (looks great!)",1,[]], 
   ["Land_ToiletBox_F", 200000, 0, 0, true, "Optional", "for the big business!",1,[]] 
  ]; 
 }; 
 
 case "Defense" : { 
 
  _objects = [ 
   ["Land_BagBunker_Tower_F", 1200000, 0, 0, true, "Building", "Description",1], 
   ["Land_BagBunker_Small_F", 900000, 0, 0, true, "Building", "Description",2], 
   ["Land_Cargo_Patrol_V2_F", 2000000, 0, 0, true, "Building", "Description",2], 
   ["Land_BarGate_F", 50000, 0, 0, true, "Bargate", "Bargate",2], 
   ["Land_HBarrierBig_F", 135000, 0, 0, true, "Wall", "Description",16], 
   //["Land_Stone_8m_F", 80000, 0, 0, true, "Wall", "Description",8], 
   ["Land_Stone_Gate_F", 120000, 0, 0, true, "Wall", "Description",1], 
   ["Land_Wall_IndCnc_4_F", 80000, 0, 0, true, "Wall", "Description",4], 
   ["Land_Wall_Tin_4_2", 70000, 0, 0, true, "Wall", "Description",2], 
   //["Land_City_8m_F", 80000, 0, 0, true, "Wall", "Description",2], 
   ["Land_City_Gate_F", 120000, 0, 0, true, "Wall", "Description",2], 
   ["Land_City2_8m_F", 80000, 0, 0, true, "Wall", "Description",2], 
   ["Land_RampConcrete_F", 250000, 0, 0, true, "Wall", "Description",1], 
   ["Land_Mil_WiredFence_F", 40000, 0, 0, true, "Fence", "Description",6], 
   ["Land_Mil_WiredFence_Gate_F", 80000, 0, 0, true, "Fence", "Description",1], 
   ["Land_PipeWall_concretel_8m_F", 40000, 0, 0, true, "Fence", "Description",4] 
  ]; 
 }; 
 
 case "Lamps" : { 
 
  _objects = [ 
   ["MetalBarrel_burning_F", 50000, 0, 0, true, "Lamp", "Burning Barrel",6], 
   ["Land_LampShabby_F", 50000, 0, 0, true, "Lamp", "Description",1], 
   //["Land_LampDecor_F", 50000, 0, 0, true, "Lamp", "Description",2], 
   ["Land_LampHalogen_F", 50000, 0, 0, true, "Lamp", "Description",2], 
   //["Land_LampHarbour_F", 50000, 0, 0, true, "Lamp", "Description",2], 
   //["Land_LampSolar_F", 50000, 0, 0, true, "Lamp", "Description",2], 
   ["Land_LampStreet_small_F", 50000, 0, 0, true, "Lamp", "Description",1] 
  ]; 
 }; 
 
 case "Admin" : { 
 
  _objects = [ 
   ["Flag_Quontrol_F", 0, 0, 0, true, "GangAreaEntryPoint", "Gang Hideout Starting Point",0] 
  ]; 
 }; 
}; 
 
 
_objects;