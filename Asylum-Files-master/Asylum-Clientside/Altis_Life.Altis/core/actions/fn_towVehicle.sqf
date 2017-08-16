/*
	File: fn_towVehicle.sqf
	Author: Skalicon
*/
//Error checking
if (vehicle player == player) exitWith {hint "You must be in a vehicle to tow.";};
// Setup Vars
private ["_vehicle","_vehList","_towVehKind","_towVehicle","_nearObjects"];
_vehicle = vehicle player;
// Get the vehicle we want to tow
_nearObjects = nearestObjects [_vehicle, ["Car","Ship"], 8];
if (count _nearObjects == 0) exitWith{hint "There are no vehicle within range to tow.";};
_towVehicle = _nearObjects select 0;
if ((_vehicle distance _towVehicle) < 5) exitWith{hint "The vehicle is too close to tow, it must be more than 4 meters away from the vehicle.";};
_towVehKind = typeOf _towVehicle;
// Setup the list of vehicles the player's vehicle can tow
_vehList = [];
switch (_vehicle) do {
	case isKindOf "C_Heli_Light_01_civil_F";
	case isKindOf "B_Heli_Light_01_F": {
		_vehList = [
			"B_Quadbike_01_F"
		];
	};
	case isKindOf "O_Heli_Light_02_unarmed_F": {
		_vehList = [
			"B_Quadbike_01_F",
			"C_Hatchback_01_F",
			"C_Hatchback_01_sport_F",
			"C_Offroad_01_F",
			"B_G_Offroad_01_armed_F",
			"C_SUV_01_F",
			"C_Rubberboat"
		];
	};
	case isKindOf "I_Heli_Transport_02_F": {
		_vehList = [
			"B_Quadbike_01_F",
			"C_Hatchback_01_F",
			"C_Hatchback_01_sport_F",
			"C_Offroad_01_F",
			"B_G_Offroad_01_armed_F",
			"C_SUV_01_F",
			"C_Van_01_transport_F",
			"C_Van_01_fuel_F",
			"O_MRAP_02_F",
			"B_MRAP_01_F",
			"B_MRAP_01_hmg_F",
			"C_Van_01_box_F",
			"I_Truck_02_transport_F",
			"I_Truck_02_covered_F",
			"C_Rubberboat",
			"C_Boat_Civil_01_F",
			"B_Boat_Transport_01_F",
			"C_Boat_Civil_01_police_F"
		];
	};
	case isKindOf "I_Heli_light_03_unarmed_F": {
		_vehList = [
			"B_Quadbike_01_F",
			"C_Hatchback_01_F",
			"C_Hatchback_01_sport_F",
			"C_Offroad_01_F",
			"B_G_Offroad_01_armed_F",
			"C_SUV_01_F",
			"C_Van_01_transport_F",
			"C_Van_01_fuel_F",
			"O_MRAP_02_F",
			"B_MRAP_01_F",
			"B_MRAP_01_hmg_F",
			"C_Van_01_box_F",
			"I_Truck_02_transport_F",
			"I_Truck_02_covered_F",
			"C_Rubberboat",
			"C_Boat_Civil_01_F",
			"B_Boat_Transport_01_F",
			"C_Boat_Civil_01_police_F"
		];
	};
	case isKindOf "ship": {
		_vehList = ["ship"];
	};
	case isKindOf "car": {
		if (_vehicle isKindOf "B_Quadbike_01_F") then {
			_vehList = ["B_Quadbike_01_F"];
		} else {
			_vehList = ["car"];
		};
	};
};
if (count _vehList == 0) exitWith{hint "Your vehicle can't tow vehicles.";};
if (!(_towVehKind in _vehList)) exitWith{hint "Your vehicle cannot tow this kind of vehicle.";};
_vehicle attachObject _towVehicle;