/*
	File: fn_fuelStationAddAction.sqf
	Author: MarioF
	
	Description:
	Adds the Action to Fueltrucks
*/

private["_vehicle"];

_vehicle = param [0,objNull];

if(isNull _vehicle) exitWith {};

_vehicle addAction["Refuel other Vehicles",lhm_fnc_fuelStationMenu,["FUELTRUCK",1],-1,false,false,"","vehicle player == player && !lhm_action_inUse && _target in lhm_vehicles"];