/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Cleans up the player's target vehicle
*/

private ["_action","_vehicle","_vehicleData"];

if(!((getPlayerUID player) in DS_adminList1))exitWith{};

_action = [
	"Cleanup Vehicle? (If you are spectating this will clean up the vehicle that person is looking at)",
	"Important",
	"Continue",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

if(isNull DS_amUnit)then{DS_amUnit = player;};

_vehicle = cursorTarget;
if(isNull _vehicle)exitWith{systemChat "No vehicle was found to clean up.";};

if(DS_amUnit isEqualTo player)then {
	systemChat "Cleaning up vehicle...";
} else {
	systemChat "Cleaning up the vehicle the player you are spectating is looking at...";
};

{
    deleteVehicle _x;
} forEach attachedObjects _vehicle;

if(((typeOf _vehicle) isEqualTo "CraterLong")||((typeOf _vehicle) isEqualTo "CraterLong_small"))exitWith{deleteVehicle _vehicle;};
if(!alive _vehicle)exitWith{deleteVehicle _vehicle;};
if((DS_amUnit isEqualTo player)&&(player distance _vehicle > 50))exitWith{};

if((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship")||(_vehicle isKindOf "Tank")||((typeOf _vehicle) in ["Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_covered_F","Land_Pod_Heli_Transport_04_medevac_F","Land_Pod_Heli_Transport_04_repair_F","B_Slingload_01_Cargo_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F","B_Slingload_01_Fuel_F"]))then {
	_vehicleData = _vehicle getVariable ["vehicle_owners",[]];

	if((_vehicle getVariable ["convoy_truck",false])||(_vehicle getVariable ["truckMission",false]))then {
		deleteVehicle _vehicle;
		systemChat "Vehicle cleaned up and deleted (Must be a mission vehicle).";
	} else {
		[_vehicle,true,player] remoteExec ["HUNT_fnc_storeVehicle",2];
		systemChat "Vehicle cleaned up and stored.";
	};
};