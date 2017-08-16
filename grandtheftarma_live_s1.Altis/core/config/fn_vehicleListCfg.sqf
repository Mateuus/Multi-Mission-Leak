private ["_shop", "_return"];
_shop = [_this, 0, "", [""]] call GTA_fnc_param;

if (_shop == "") exitWith {[]};
_return = [];

switch _shop do {
  case "mil_car":  {
    _return pushBack ["C_SUV_01_F", 0];
    _return pushBack ["B_G_Offroad_01_F", 0];

    if (["GTA_milRank"] call GTA_fnc_const >= 4) then {
      _return pushBack ["B_G_Offroad_01_armed_F", 0];
    };

    if (["GTA_milRank"] call GTA_fnc_const >= 2) then {
      _return pushBack ["I_MRAP_03_F", 0];
      _return pushBack ["B_MRAP_01_F", 0];
    };

    _return pushBack ["B_Quadbike_01_F", 0];
    _return pushBack ["B_Truck_01_mover_F", 0];
    _return pushBack ["B_Truck_01_transport_F", 0];
    _return pushBack ["B_Truck_01_covered_F", 0];
    _return pushBack ["B_Truck_01_box_F", 0];

    if (["GTA_milRank"] call GTA_fnc_const >= 5) then {
      _return pushBack ["B_Truck_01_medical_F", 0];
      _return pushBack ["B_Truck_01_fuel_F", 0];
    };

    if (["GTA_milRank"] call GTA_fnc_const >= 4) then {
      _return pushBack ["B_UGV_01_F", 0];
    };

    if (["GTA_milRank"] call GTA_fnc_const >= 9) then {
      _return pushBack ["I_MRAP_03_hmg_F", 0];
      _return pushBack ["B_MRAP_01_hmg_F", 0];
    };
  };

  case "mil_air":  {
    _return pushBack ["B_Heli_Light_01_F", 0];
    _return pushBack ["C_Heli_Light_01_civil_F", 0];

    if (["GTA_milRank"] call GTA_fnc_const >= 4) then {
      _return pushBack ["B_Heli_Transport_01_F", 0];
      _return pushBack ["B_Heli_Transport_01_camo_F", 0];
      _return pushBack ["B_Heli_Transport_03_F", 0];
      _return pushBack ["B_Heli_Transport_03_unarmed_F", 0];
      _return pushBack ["I_Heli_light_03_unarmed_F", 0];
    };

    if (["GTA_milRank"] call GTA_fnc_const >= 8) then {
      _return pushBack ["B_Heli_Attack_01_F", 0];
    };
  };

  case "mil_jet":  {
    if (["GTA_milRank"] call GTA_fnc_const >= 6) then {
      _return pushBack ["B_UAV_02_F", 0];
      _return pushBack ["B_Plane_CAS_01_F", 0];
    };
  };

  case "mil_ship": {
    if (["GTA_milRank"] call GTA_fnc_const >= 4) then {
      _return pushBack ["O_Boat_Armed_01_hmg_F", 0];
    };

    _return pushBack ["C_Boat_Civil_01_police_F", 0];
    _return pushBack ["B_Boat_Transport_01_F", 0];
    _return pushBack ["B_SDV_01_F", 0];
  };

  case "kart_shop": {
    _return pushBack ["C_Kart_01_Blu_F", 250000];
    _return pushBack ["C_Kart_01_Fuel_F", 250000];
    _return pushBack ["C_Kart_01_Red_F", 250000];
    _return pushBack ["C_Kart_01_Vrana_F", 250000];
  };

  case "med_shop": {
    _return pushBack ["C_Van_01_box_F", 0];

    if (["GTA_medRank"] call GTA_fnc_const >= 2) then {
      _return pushBack ["C_SUV_01_F", 0];
      _return pushBack ["C_Hatchback_01_F", 0];
    };

    if (["GTA_medRank"] call GTA_fnc_const >= 4) then {
      _return pushBack ["C_Hatchback_01_sport_F", 0];
    };
  };

  case "med_air_hs": {
    if (["GTA_medRank"] call GTA_fnc_const >= 3) then  {
      _return pushBack ["C_Heli_Light_01_civil_F", 0];
    };

    if (["GTA_medRank"] call GTA_fnc_const >= 4) then {
      _return pushBack ["O_Heli_Light_02_unarmed_F", 0];
    };
  };

  case "civ_car":  {
    _return pushBack ["B_Quadbike_01_F", 7500];
    _return pushBack ["C_Hatchback_01_F", 20000];
    _return pushBack ["C_Offroad_01_F", 25000];
    _return pushBack ["C_SUV_01_F", 30000];
    _return pushBack ["C_Hatchback_01_sport_F", 150000];
  };

  case "civ_car2": {
    _return pushBack ["C_Hatchback_01_F", 20000];
    _return pushBack ["C_Offroad_01_F", 25000];
    _return pushBack ["C_SUV_01_F", 30000];
    _return pushBack ["C_Hatchback_01_sport_F", 150000];
  };

  case "event_derby": {
    _return pushBack ["B_Quadbike_01_F", 0];
    _return pushBack ["C_Hatchback_01_F", 0];
    _return pushBack ["C_Offroad_01_F", 0];
    _return pushBack ["C_SUV_01_F", 0];
    _return pushBack ["C_Hatchback_01_sport_F", 0];
  };

  case "event_helicopters": {
    _return pushBack ["C_Heli_Light_01_civil_F", 0];              //--- M900
    _return pushBack ["B_Heli_Light_01_F", 0];                    //--- Hummingbird
    _return pushBack ["O_Heli_Light_02_unarmed_F", 0];            //--- Orca
    _return pushBack ["I_Heli_Transport_02_F", 0];                //--- Mohawk
    _return pushBack ["B_Heli_Transport_03_unarmed_F", 0];        //--- Huron
    _return pushBack ["O_Heli_Transport_04_F", 0];                //--- Taru
    _return pushBack ["O_Heli_Transport_04_bench_F", 0];          //--- Taru (Bench)
    _return pushBack ["O_Heli_Transport_04_covered_F", 0];        //--- Taru (Covered)
    _return pushBack ["O_Heli_Transport_04_box_F", 0];            //--- Taru (Cargo)
  };

  case "taxi_car": {
    _return pushBack ["C_SUV_01_F", 33000];
  };

  case "press_car": {
    _return pushBack ["C_SUV_01_F", 40000];
  };

  case "press_helicopters": {
    _return pushBack ["C_Heli_Light_01_civil_F", 500000];      //--- M900
  };

  case "civ_truck": {
    if (!license_civ_rebel && {!license_civ_advrebel}) then {
      _return pushBack ["C_Van_01_transport_F", 42000]; //--- Truck
      _return pushBack ["C_Van_01_box_F", 84000]; //--- Truck Boxer
    };

    _return pushBack ["I_Truck_02_transport_F", 210000];
    _return pushBack ["I_Truck_02_covered_F", 280000];

    _return pushBack ["O_Truck_03_transport_F", 450000];
    _return pushBack ["O_Truck_03_covered_F", 550000];
    _return pushBack ["O_Truck_03_device_F", 3000000];

    _return pushBack ["B_Truck_01_ammo_F", 825000];
    _return pushBack ["B_Truck_01_box_F", 1300000];

    _return pushBack ["I_Truck_02_fuel_F", 975000];
    _return pushBack ["O_Truck_03_fuel_F", 1950000];
  };

  case "reb_car": {
    _return pushBack ["B_Quadbike_01_F", 7500];
    _return pushBack ["B_G_Offroad_01_F", 15000];
    _return pushBack ["B_Truck_01_ammo_F", 825000];
    _return pushBack ["B_Truck_01_box_F", 1300000];
    if (license_civ_advrebel) then {_return pushBack ["O_MRAP_02_F", 3000000]};
    _return pushBack ["B_G_Offroad_01_armed_F", 1000000];
  };

  case "reb_air": {
    _return pushBack ["B_Heli_Light_01_F", 1000000];                //--- Hummingbird
    _return pushBack ["I_Heli_light_03_unarmed_F", 5000000];        //--- Hellcat
    _return pushBack ["O_Heli_Light_02_unarmed_F", 3000000];        //--- Orca
    _return pushBack ["I_Heli_Transport_02_F", 5000000];            //--- Mohawk
    _return pushBack ["B_Heli_Transport_03_unarmed_F", 7000000];    //--- Huron
    _return pushBack ["O_Heli_Transport_04_F", 2500000];            //--- Taru
    _return pushBack ["O_Heli_Transport_04_bench_F", 3000000];      //--- Taru (Bench)
    _return pushBack ["O_Heli_Transport_04_covered_F", 4500000];    //--- Taru (Covered)
    _return pushBack ["O_Heli_Transport_04_box_F", 10000000];       //--- Taru (Cargo)
  };

  case "cop_car":  {
    _return pushBack ["B_Quadbike_01_F", 0];

    if (["GTA_copRank"] call GTA_fnc_const >= 2 || {license_cop_sru}) then {
      _return pushBack ["C_Hatchback_01_F", 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 3 || {license_cop_sru}) then {
      _return pushBack ["C_SUV_01_F", 0];
      _return pushBack ["C_Offroad_01_F", 0];
      _return pushBack ["I_Truck_02_covered_F", 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 6) then {
      _return pushBack ["C_Hatchback_01_sport_F", 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 7 || {license_cop_sru}) then {
      _return pushBack ["B_MRAP_01_F", 0];
    };
  };

  case "cop_car_rpu":  {
    if (["GTA_copRank"] call GTA_fnc_const >= 2 || {license_cop_sru}) then {
      _return pushBack ["C_Hatchback_01_F", 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 3 || {license_cop_sru}) then {
      _return pushBack ["C_SUV_01_F", 0];
      _return pushBack ["C_Offroad_01_F", 0];
      _return pushBack ["I_Truck_02_covered_F", 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 4) then {
      _return pushBack ["C_Hatchback_01_sport_F", 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 7 || {license_cop_sru}) then {
      _return pushBack ["B_MRAP_01_F", 0];
    };
  };

  case "civ_air": {
    _return pushBack ["C_Heli_Light_01_civil_F", 500000];             //--- M900
    _return pushBack ["O_Heli_Light_02_unarmed_F", 3000000];          //--- Orca
    _return pushBack ["I_Heli_Transport_02_F", 5000000];              //--- Mohawk
    _return pushBack ["O_Heli_Transport_04_covered_F", 4500000];      //--- Taru (Covered)
    _return pushBack ["O_Heli_Transport_04_box_F", 10000000];         //--- Taru (Cargo)

    //--- Huron Cargo Container
    if (["loadmaster"] call GTA_fnc_hasPerk) then {
      _return pushBack ["B_Slingload_01_Cargo_F", 5000000, false];
    };
  };

  case "cop_airhq";
  case "cop_air": {
    if ((license_cop_npas && {["GTA_copRank"] call GTA_fnc_const >= 3}) || {["GTA_copRank"] call GTA_fnc_const >= 8}) then {
      _return pushBack ["B_Heli_Light_01_F", 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 4 && {license_cop_npas}) then {
      _return pushBack ["I_Heli_light_03_unarmed_F", 0];
    };

    if (["GTA_copRank"] call GTA_fnc_const >= 6 && {license_cop_npas}) then {
      _return pushBack ["B_Heli_Transport_03_unarmed_F", 0];
    };
  };

  case "civ_ship": {
    _return pushBack ["C_Rubberboat", 15000];
    _return pushBack ["B_Boat_Transport_01_F", 15000];
    _return pushBack ["O_Boat_Transport_01_F", 15000];
    _return pushBack ["I_Boat_Transport_01_F", 15000];
    _return pushBack ["C_Boat_Civil_01_F", 85000];
    _return pushBack ["B_SDV_01_F", 1400000];
    _return pushBack ["O_SDV_01_F", 1400000];
    _return pushBack ["I_SDV_01_F", 1400000];
  };

  case "cop_ship": {
    _return pushBack ["B_Boat_Transport_01_F", 0];
    _return pushBack ["C_Boat_Civil_01_police_F", 0];
    if (["GTA_copRank"] call GTA_fnc_const >= 3) then {
      _return pushBack ["B_SDV_01_F", 0];
    };
  };

  case "civ_jet":  {
    _return pushBack ["O_Plane_CAS_02_F", 15000000];
  };

  case "hato_car": {
    _return pushBack ["C_Van_01_transport_F", 0];

    if (["GTA_hatoRank"] call GTA_fnc_const >= 2) then {
      _return pushBack ["C_SUV_01_F", 0];
      _return pushBack ["C_Hatchback_01_F", 0];
      _return pushBack ["C_Offroad_01_repair_F", 0];
      _return pushBack ["C_Van_01_fuel_F", 0];
      _return pushBack ["I_Truck_02_box_F", 0];
    };

    if (["GTA_hatoRank"] call GTA_fnc_const >= 3) then {
      _return pushBack ["I_Truck_02_covered_F", 0];
      _return pushBack ["I_UGV_01_F", 0];
    };
  };
};

//--- Convert buy price to rental price (ghetto method)
//{
//  _x set [1, ((_x select 1) / 150) * 100];
//} forEach _return;

//--- Donator (50% reduced price)
if (["GTA_donatorLevel", 0] call GTA_fnc_getConstant > 0 || {[] call GTA_fnc_isMonthlySale}) then {
  {
    _x params [
      "",
      ["_price", 0, [0]],
      ["_discount", true, [true]]
    ];

    if (_discount) then {
      _x set [1, _price / 2];
    };
  } forEach _return;
};

_return
