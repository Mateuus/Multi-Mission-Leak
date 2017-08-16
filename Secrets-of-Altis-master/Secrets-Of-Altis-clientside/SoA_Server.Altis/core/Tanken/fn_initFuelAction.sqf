/*
	File: init_fuel_action.sqf
	Author: Paradox
	Description: AddActions an alle 23 Tanken hinzufügen
*/
for "_i" from 1 to 23 do {
	_fuelstations = nearestObjects[getMarkerPos format["fuelshop_%1",_i],["Land_fs_feed_F"], 50];

	{
		_x setFuelCargo 0;
		_x addaction ["Fahrzeug auftanken",life_fnc_vehicleCheck,"car"];
		_x addaction ["Spritpreise",life_fnc_fuelPrices];
	} foreach _fuelstations;
};

{
	_x addaction ["Helikopter auftanken",life_fnc_vehicleCheck,"heli"];
	_x addaction ["Spritpreise",life_fnc_fuelPrices];
} foreach allMissionObjects "Land_JetEngineStarter_01_F";