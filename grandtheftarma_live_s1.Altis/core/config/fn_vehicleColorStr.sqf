private ["_vehicle", "_index", "_color"];
_vehicle = [_this, 0, "", [""]] call GTA_fnc_param;
_index = [_this, 1, -1, [0]] call GTA_fnc_param;

_color = switch _vehicle do {
  //--- Taru
  case "O_Heli_Transport_04_F";
  case "O_Heli_Transport_04_bench_F";
  case "O_Heli_Transport_04_medevac_F";
  case "O_Heli_Transport_04_repair_F";
  case "O_Heli_Transport_04_covered_F";
  case "O_Heli_Transport_04_ammo_F";
  case "O_Heli_Transport_04_box_F": {
    switch _index do {
      case 0: {"CSAT"};
      case 1: {"Black"};
    };
  };

  case "C_Offroad_01_F": {
    switch _index do {
      case 0: {"Red"};
      case 1: {"Yellow"};
      case 2: {"White"};
      case 3: {"Blue"};
      case 4: {"Dark Red"};
      case 5: {"Blue / White"};
      case 6: {"Yellow"};
      case 7: {"Monster Offroad"};
      case 8: {"Police"};
    };
  };

  case "B_G_Offroad_01_F";
  case "B_G_Offroad_01_armed_F": {
    switch _index do {
      case 0: {"Guerrilla 01"};
      case 1: {"Guerrilla 02"};
      case 2: {"Guerrilla 03"};
      case 3: {"Guerrilla 04"};
      case 4: {"Guerrilla 05"};
      case 5: {"Guerrilla 06"};
      case 6: {"Guerrilla 07"};
      case 7: {"Guerrilla 08"};
      case 8: {"Guerrilla 09"};
      case 9: {"Guerrilla 10"};
      case 10: {"Guerrilla 11"};
      case 11: {"Guerrilla 12"};
      case 12: {"NATO"};
      case 13: {"Black"};
    };
  };

  case "C_Hatchback_01_F": {
    switch _index do {
      case 0: {"Beige"};
      case 1: {"Green"};
      case 2: {"Blue"};
      case 3: {"Dark Blue"};
      case 4: {"Yellow"};
      case 5: {"White"};
      case 6: {"Grey"};
      case 7: {"Black"};
      case 8: {"Paramedic"};
      case 9: {"HATO"};
      case 10: {"Police"};
    };
  };

  case "C_Hatchback_01_sport_F": {
    switch _index do	{
      case 0: {"Red"};
      case 1: {"Dark Blue"};
      case 2: {"Orange"};
      case 3: {"Black / White"};
      case 4: {"Tan"};
      case 5: {"Green"};
      case 6: {"Monster WRC Sport"};
      case 7: {"Redbull WRC Sport"};
      case 8: {"Dominos"};
      case 9: {"Monster WRC Sport 2"};
      case 10: {"Redbull WRC Sport 2"};
      case 11: {"KFC"};
      case 12: {"WRC"};
      case 13: {"Paramedic"};
      case 14: {"RPU"};
    };
  };

  case "C_SUV_01_F": {
    switch _index do	{
      case 0: {"Dark Red"};
      case 1: {"Black"};
      case 2: {"Silver"};
      case 3: {"Orange"};
      case 4: {"Paramedic"};
      case 5: {"HATO"};
      case 6: {"Kavala SUV"};
      case 7: {"Pyrgos SUV"};
      case 8: {"RPU SUV"};
      case 9: {"Military Police"};
      case 10: {"Metro Taxi Service"};
      case 11: {"Press"};
      case 12: {"Jurassic Park"};
      case 13: {"Halloween"};
      case 14: {"Black"};
      case 15: {"Black"};
    };
  };

  case "C_Van_01_box_F": {
    switch _index do {
      case 0: {"White"};
      case 1: {"Red"};
      case 2: {"Black"};
      case 3: {"The Creamy Wagon"};
      case 4: {"Ambulance"};
    };
  };

  case "C_Van_01_transport_F": {
    switch _index do {
      case 0: {"White"};
      case 1: {"Red"};
      case 2: {"HATO"};
    };
  };

  case "C_Van_01_fuel_F": {
    switch _index do {
      case 0: {"HATO"};
    };
  };

  case "B_Quadbike_01_F" : {
    switch _index do {
      case 0: {"Brown"};
      case 1: {"Digi Desert"};
      case 2: {"Black"};
      case 3: {"Blue"};
      case 4: {"Red"};
      case 5: {"White"};
      case 6: {"Digi Green"};
      case 7: {"Hunter Camo"};
      case 8: {"Rebel Camo"};
      case 9: {"Police"};
    };
  };

  case "B_Heli_Light_01_F";
  case "C_Heli_Light_01_civil_F": {
    switch _index do {
      case 0: {"Blue"};
      case 1: {"Red"};
      case 2: {"BlueLine"};
      case 3: {"Elliptical"};
      case 4: {"Furious"};
      case 5: {"Graywatcher"};
      case 6: {"Jeans"};
      case 7: {"Light"};
      case 8: {"Shadow"};
      case 9: {"Speedy"};
      case 10: {"Sunset"};
      case 11: {"Vrana"};
      case 12: {"Wasp"};
      case 13: {"Wave"};
      case 14: {"Digital"};
      case 15: {"AAF"};
      case 16: {"NATO"};
      case 17: {"Black"};
      case 18: {"NPAS"};
      case 19: {"Paramedic"};
    };
  };

  case "O_Heli_Light_02_unarmed_F": {
    switch _index do {
      case 0: {"Black"};
      case 1: {"White / Blue"};
      case 2: {"AAF"};
      case 3: {"CSAT"};
      case 4: {"Paramedic"};
    };
  };

  case "B_MRAP_01_F";
  case "B_MRAP_01_hmg_F": {
    switch _index do {
      case 0: {"Police"};
      case 1: {"NATO"};
    };
  };

  case "I_MRAP_03_F";
  case "I_MRAP_03_hmg_F": {
    switch _index do {
      case 0: {"AAF"};
      case 1: {"NATO"};
    };
  };

  case "O_MRAP_02_F": {
    switch _index do	{
      case 0: {"OPFOR"};
      case 1: {"Light Black"};
      case 2: {"Black"};
      case 3: {"Sky Blue"};
      case 4: {"Dark Blue"};
      case 5: {"Lime Green"};
      case 6: {"Orange"};
      case 7: {"Red"};
      case 8: {"Khaki"};
      case 9: {"White"};
      case 10: {"Tan"};
      case 11: {"Grey"};
      case 12: {"Olive"};
    };
  };

  case "I_Truck_02_covered_F": {
    switch _index do {
      case 0: {"Orange"};
      case 1: {"Police"};
      case 2: {"Redbull"};
      case 3: {"Red"};
      case 4: {"Purple"};
      case 5: {"Blue"};
      case 6: {"Yellow"};
      case 7: {"Green"};
      case 8: {"HATO"};
    };
  };

  case "I_Truck_02_transport_F": {
    switch _index do {
      case 0: {"Orange"};
      case 1: {"Black"};
      case 2: {"Red"};
      case 3: {"Purple"};
      case 4: {"Blue"};
      case 5: {"Yellow"};
      case 6: {"Green"};
    };
  };

  case "I_Heli_Transport_02_F": {
    switch _index do {
      case 0: {"Ion"};
      case 1: {"Dahoman"};
      case 2: {"Black"};
      case 3: {"AAF"};
    };
  };

  case "I_Heli_light_03_unarmed_F": {
    switch _index do {
      case 0: {"AAF"};
      case 1: {"I99"};
      case 2: {"Olive"};
      case 3: {"NATO"};
    };
  };

  case "B_Truck_01_box_F";
  case "B_Truck_01_ammo_F": {
    switch _index do	{
      case 0: {"Industrial"};
      case 1: {"Khaki"};
      case 2: {"Military"};
    };
  };

  case "B_Heli_Transport_03_unarmed_F": {
    switch _index do {
      case 0: {"Black"};
      case 1: {"NATO"};
    };
  };

  case "C_Offroad_01_repair_F": {
    switch _index do	{
      case 0: {"HATO"};
    };
  };

  case "I_Truck_02_box_F": {
    switch _index do	{
      case 0: {"HATO"};
    };
  };

  case "I_UGV_01_F": {
    switch _index do	{
      case 0: {"HATO"};
    };
  };

  case "O_Boat_Armed_01_hmg_F": {
    switch _index do	{
      case 0: {"NATO"};
    };
  };

  case "B_Heli_Attack_01_F": {
    switch _index do	{
      case 0: {"NATO"};
    };
  };
};

[_color, ""] select (typeName _color == typeName true)
