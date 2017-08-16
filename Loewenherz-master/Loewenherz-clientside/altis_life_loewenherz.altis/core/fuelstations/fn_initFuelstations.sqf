/*
	File: fn_initFuelstations.sqf
	Author: MarioF

	Description:
	Emtpy the Fuelstations and add the Refill action
*/

private["_stations"];

waitUntil{!isNil "lhm_fuelstation_stationlist"};
sleep 1;

{
	_x setFuelCargo 0;
	if((typeOf _x) == "Land_fs_feed_F" && _x getVariable ["ga_id", -1] == -1) then {
		_x addAction["Refuel Vehicle",lhm_fnc_fuelStationMenu,["CAR",0.5],0,false,false,"","vehicle player == player && !lhm_action_inUse"];
	};
} foreach lhm_fuelstation_stationlist;

// Init all existing Fueltrucks as well
/*
{
	if((typeOf _x) in lhm_fuelstation_cfgTrucks) then {
		_x addAction["Refuel other Vehicles",lhm_fnc_fuelStationMenu,["FUELTRUCK",0.5],-1,false,false,"","vehicle player == player && !lhm_action_inUse && _target in lhm_vehicles"];
	};
} foreach vehicles;
*/