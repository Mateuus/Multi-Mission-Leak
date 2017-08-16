private ["_vehicleData","_vehicle"];

_vehicle = cursorTarget;

			{	
			  deleteVehicle _x;
			} forEach attachedObjects _vehicle;

if(typeOf (_vehicle) == "CraterLong")exitwith
	{
	deleteVehicle _vehicle;
	};
if(typeOf (_vehicle) == "CraterLong_small")exitwith
	{
	deleteVehicle _vehicle;
	};

if(!alive _vehicle) exitwith {deleteVehicle _vehicle;};
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "tank") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F") || (typeOf _vehicle == "B_Slingload_01_Cargo_F") || (typeOf _vehicle == "B_Slingload_01_Medevac_F") || (typeOf _vehicle == "B_Slingload_01_Repair_F") || (typeOf _vehicle == "B_Slingload_01_Fuel_F"))) exitWith {};
if(player distance cursorTarget > 50) exitWith {};

if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "tank") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F") || (typeOf _vehicle == "B_Slingload_01_Cargo_F") || (typeOf _vehicle == "B_Slingload_01_Medevac_F") || (typeOf _vehicle == "B_Slingload_01_Repair_F") || (typeOf _vehicle == "B_Slingload_01_Fuel_F")) then
{
	_vehicleData = _vehicle getVariable["vehicle_owners",[]];
	if(_vehicleData isEqualTo []) exitWith {systemchat "No data so deleting";deleteVehicle _vehicle}; //Bad vehicle.
	DS_impounded = true;
	[[_vehicle,true,player],"HUNT_fnc_storeVehicle",false,false] spawn BIS_fnc_MP;
	systemchat "Had data so sent to the server";
	waitUntil {!DS_impounded};
};

