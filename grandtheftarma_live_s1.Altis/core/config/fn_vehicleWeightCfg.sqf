private "_className";
_className = [_this, 0, "", [""]] call GTA_fnc_param;

switch _className do {
  //--- Offroads
  case "C_Offroad_01_F": {50};
  case "B_G_Offroad_01_F": {50};

  //--- Quadbike
  case "B_Quadbike_01_F": {5};

  //--- Hatchbacks
  case "C_Hatchback_01_F": {15};
  case "C_Hatchback_01_sport_F": {10};

  //--- SUV
  case "C_SUV_01_F": {25};

  //--- Trucks
  case "C_Van_01_transport_F": {70};
  case "I_G_Van_01_transport_F": {70};
  case "C_Van_01_box_F": {140};

  //--- HEMTTs
  case "B_Truck_01_transport_F": {300};
  case "B_Truck_01_covered_F": {300};
  case "B_Truck_01_ammo_F": {580};
  case "B_Truck_01_box_F": {700};
  case "B_Truck_01_fuel_F": {1400};

  //--- Zamak Transports
  case "I_Truck_02_transport_F": {210};
  case "I_Truck_02_covered_F": {280};
  case "I_Truck_02_fuel_F": {750};

  //--- Tempest Transports
  case "O_Truck_03_transport_F": {350};
  case "O_Truck_03_device_F": {420};
  case "O_Truck_03_covered_F": {420};
  case "O_Truck_03_repair_F": {700};
  case "O_Truck_03_ammo_F": {700};
  case "O_Truck_03_fuel_F": {1500};

  //--- Hunter, Ifrit, Strider
  case "B_MRAP_01_F": {50};
  case "O_MRAP_02_F": {50};
  case "I_MRAP_03_F": {50};

  //--- Boats
  case "C_Rubberboat";
  case "B_Boat_Transport_01_F";
  case "O_Boat_Transport_01_F";
  case "I_Boat_Transport_01_F": {40};
  case "C_Boat_Civil_01_F";
  case "C_Boat_Civil_01_police_F";
  case "C_Boat_Civil_01_rescue_F": {250};
  case "O_Boat_Armed_01_hmg_F";
  case "B_Boat_Armed_01_minigun_F";
  case "I_Boat_Armed_01_minigun_F": {350};

  //--- Submarines
  case "B_SDV_01_F";
  case "O_SDV_01_F";
  case "I_SDV_01_F": {350};

  //--- Hummingbird
  case "B_Heli_Light_01_F": {5};
  case "C_Heli_Light_01_civil_F": {5};

  //--- Hellcat
  case "I_Heli_light_03_unarmed_F": {5};
  case "I_Heli_light_03_F": {5};

  //--- Orca
  case "O_Heli_Light_02_unarmed_F": {100};

  //--- Mohawk
  case "I_Heli_Transport_02_F": {250};

  //--- Huron
  case "B_Heli_Transport_03_F": {350};
  case "B_Heli_Transport_03_unarmed_F": {350};

  //--- Mi-48 Kajman
  case "O_Heli_Attack_02_F": {300};
  case "O_Heli_Attack_02_black_F": {300};

  //--- Taru
  case "O_Heli_Transport_04_F": {5};
  case "O_Heli_Transport_04_bench_F": {5};
  case "O_Heli_Transport_04_covered_F": {25};
  case "O_Heli_Transport_04_box_F": {500};

  //--- HATO Repair Vehicles
  case "C_Offroad_01_repair_F": {150};
  case "I_Truck_02_box_F": {400};

  //--- Medical Vehicles
  case "I_Truck_02_medical_F": {50};
  case "O_Truck_03_medical_F": {50};
  case "B_Truck_01_medical_F": {50};

  //--- House Storage Containers
  case "Box_IND_Grenades_F": {250};
  case "B_supplyCrate_F": {1000};

  //--- Container
  case "B_Slingload_01_Cargo_F": {350};

  default {-1};
};
