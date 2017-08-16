/*
	File: fn_initFuelstations.sqf
	Author: MarioF
	Modified by: Altis Life Germany

	Description:
	Emtpy the Fuelstations and add the Refill action
*/

private["_stations"];

waitUntil{!isNil "life_fuelstation_stationlist"};

{
	_x setFuelCargo 0;
	if((typeOf _x) == "Land_fs_feed_F" && _x getVariable ["ga_id", -1] == -1) then {
		_x addAction["Tanken",PG_fnc_fuelStationMenu,["CAR",0.5],0,false,false,"","vehicle player == player && !life_action_inUse"];
	};
} foreach life_fuelstation_stationlist;

// Init all existing Fueltrucks as well
{
	if((typeOf _x) in life_fuelstation_cfgTrucks) then {
		_x addAction["Anderes Fahrzeug tanken",PG_fnc_fuelStationMenu,["FUELTRUCK",0.5],-1,false,false,"","vehicle player == player && !life_action_inUse && _target in life_vehicles"];
	};
} foreach vehicles;