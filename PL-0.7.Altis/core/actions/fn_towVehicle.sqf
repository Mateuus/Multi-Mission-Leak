/*
	File: fn_towVehicle.sqf
	Author: Skrow & Skyfezzer
*/
//Error checking
if (vehicle player == player) exitWith {hint "Vous devze être dans un véhicule pour remorquer.";};
// Setup Vars
private ["_vehicle","_vehList","_towVehKind","_towVehicle","_nearObjects"];
_vehicle = vehicle player;
// Get the vehicle we want to tow
_nearObjects = nearestObjects [_vehicle, ["Car","Ship"], 8];
if (count _nearObjects == 0) exitWith{hint "Il n'y a pas de véhicule a remorquer pret de vous.";};
_towVehicle = _nearObjects select 0;
if ((_vehicle distance _towVehicle) < 10) exitWith{hint "Votre véhicule est trop loin pour remorquer, vous devez vous trouver à moins de 9 mètres.";};
_towVehKind = typeOf _towVehicle;
// Setup the list of vehicles the player's vehicle can tow
_vehList = [];
switch (_vehicle) do {
	case isKindOf "O_Heli_Light_02_unarmed_F": {
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
};
if (count _vehList == 0) exitWith{hint "Votre véhicule ne peut pas remorquer de véhicule.";};
if (!(_towVehKind in _vehList)) exitWith{hint "Votre véhicule ne peut pas remorquer ce type de véhicule";};
_vehicle attachObject _towVehicle;
