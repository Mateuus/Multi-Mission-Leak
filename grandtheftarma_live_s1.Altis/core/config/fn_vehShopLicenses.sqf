private ["_veh", "_ret"];
_veh = _this select 0;

if (_veh == "B_Quadbike_01_F") exitWith {true};

switch (life_veh_shop select 0) do {
	case "kart_shop";
	case "civ_car";
	case "civ_car2": {license_civ_driver};
	case "civ_ship": {license_civ_boat};
	case "civ_air": {license_civ_air};
	case "civ_truck": {license_civ_truck};
  case "reb_air";
	case "reb_car": {license_civ_rebel};
	case "civ_jet": {license_civ_jet};
	case "med_shop";
	case "med_air_hs";
	case "cop_air";
	case "cop_car";
	case "cop_car_rpu";
	case "cop_ship";
	case "mil_car";
	case "mil_ship";
	case "mil_air";
	case "mil_jet";
	case "hato_car";
	case "event_derby";
	case "event_helicopters";
	case "press_car";
	case "press_helicopters";
	case "reb_air";
	case "taxi_car": {true};
	default {false};
};
