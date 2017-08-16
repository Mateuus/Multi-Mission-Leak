/*
	File: vehicle_check.sqf
	Author: Paradox
	
	Description: Checkt die Fahrzeuge und deren Krafstoffe
*/
private ["_vehicle","_mode"];

_mode = _this select 3;

switch(_mode) do {

	case "car": 
	{
		_vehicle = nearestObject [getPos (_this select 0), "LandVehicle"];

		if(isNull _vehicle OR !alive _vehicle OR isNil "_vehicle") exitWith {hint "Fahrzeug kaputt oder nicht existent."};
		if!(_vehicle in life_vehicles) exitwith {hint "Keines deiner Fahrzeug gefunden!"};
		if(_vehicle iskindof "Air") exitwith {hint "Ein Flugzeug/Helikopter kann nicht an einer normalen Tankstelle betankt werden!"};

		_diesel = ["C_Van_01_transport_F","C_Van_01_box_F","C_Van_01_fuel_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_mover_F","B_Truck_01_box_F","B_Truck_01_Repair_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","I_Truck_02_transport_F","I_Truck_02_covered_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_03_covered_F","O_Truck_03_device_F","B_T_LSV_01_unarmed_F","O_T_LSV_02_unarmed_F"];
		_super = ["C_Offroad_01_F","I_G_Offroad_01_F","C_Hatchback_01_F","B_MRAP_01_F","B_G_Offroad_01_F","I_MRAP_03_F","O_MRAP_02_F","C_Quadbike_01_F","B_Quadbike_01_F","C_Offroad_02_unarmed_F"];
		_superplus = ["C_SUV_01_F","C_Hatchback_01_sport_F"];

		switch(true)do
		{
			case (typeof _vehicle in _diesel): {[_vehicle] call life_fnc_diesel;};
			case (typeof _vehicle in _super): {[_vehicle] call life_fnc_super;};
			case (typeof _vehicle in _superplus): {[_vehicle] call life_fnc_superplus;};
			default {hint "Dein Fahrzeug kann nicht gefunden werden, melde das dringend einem Admin. Tanke nun Super mit einem Tank von 50 Litern."; call life_fnc_super;}
		};
	};

	case "heli": 
	{
		_vehicle = nearestObject [getPos (_this select 0), "Air"];

		if(isNull _vehicle OR !alive _vehicle OR isNil "_vehicle") exitWith {hint "Flugzeug/Helikopter kaputt oder nicht existent."};
		if!(_vehicle in life_vehicles) exitwith {hint "Keines deiner Flugzeuge/Helikopter gefunden!"};
		if(_vehicle iskindof "Landvehicle") exitwith {hint "Dieses Fahrzeug kann nicht an einer Helikopter-Tankstelle betankt werden."};

		[_vehicle] call life_fnc_kerosin;
	};
};