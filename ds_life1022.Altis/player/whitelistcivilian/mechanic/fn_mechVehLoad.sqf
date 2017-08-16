/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Loads a vehicle onto the back of another (Mechanic Towing Version)
*/

private["_vehicle","_load","_willLoad"];

_vehicle = objNull;
_willLoad = false;
[] spawn	{sleep 20;DS_vehicleLoading = false; DS_loadingVehicle = nil;};
if(isNil "DS_loadingVehicle")exitwith
	{
	_vehicle = nearestObjects[(vehicle player), ["LandVehicle"],20];
	_vehicle = _vehicle select 0;

	if(isNull _vehicle)then
		{
			hint "No tow vehicle was found";
		}
		else
		{
			if (typeOf _vehicle != "B_Truck_01_mover_F")then
				{
					hint "No tow vehicle was found";
				}
				else
				{
					DS_vehicleLoading = true;
					DS_loadingVehicle = _vehicle;
					hint "Scroll wheel on another vehicle and select 'Tow This Vehicle' to tow it";
					systemchat "Scroll wheel on another vehicle and select 'Tow This Vehicle' to tow it";
				};
		};
	};
if(isNull DS_loadingVehicle)exitwith{hint "There is no vehicle selected to tow this vehicle onto"};
//if(!(DS_loadingVehicle in DS_keyRing))exitwith{hint "You must have the vehicle's keys to do this"};
_vehicle = nearestObjects[(vehicle player), ["Air","LandVehicle","Ship"],20];
_vehicle = _vehicle select 0;
if(isNull _vehicle)exitwith {hint "No vehicle was found to load onto the tow vehicle"};
if(_vehicle == DS_loadingVehicle)then
	{
		_vehicle = nearestObjects[(vehicle player), ["Air","LandVehicle","Ship"],20];
		_vehicle = _vehicle select 1;

		if(isNil "_vehicle")exitwith {};
		if(isNull _vehicle)exitwith {};

		if(_vehicle == DS_loadingVehicle)exitwith
			{
				DS_vehicleLoading = false;
				DS_loadingVehicle = nil;
				hint "You can not tow your tow vehicle!"
			};
	};
if(isNil "_vehicle")exitwith {hint "No vehicle was found to load onto the tow vehicle"};
if(isNull _vehicle)exitwith {hint "No vehicle was found to load onto the tow vehicle"};
if(DS_loadingVehicle distance player > 30)exitwith{hint "You are too far from your tow vehicle to complete this"};

hint "Connecting vehicle...";
_vehicle allowDamage false;
_vehicle enableSimulation false;

if(!local _vehicle)then
	{
	[_vehicle,player] remoteExec ["HUNT_fnc_changeOwner",2];
	};
waitUntil{(local _vehicle)};

switch(true)do
	{
	case (typeOf _vehicle in ["C_SUV_01_F","C_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","B_G_Offroad_01_F","C_Offroad_02_unarmed_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-5,0.4]];
		sleep 0.2;
		_vehicle setVectorUp [0,-2,5];
		};
	case (typeOf _vehicle in ["C_Van_01_transport_F","C_Van_01_box_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-5,0.7]];
		sleep 0.2;
		_vehicle setVectorUp [0,-2,5];
		};
	case (typeOf _vehicle in ["I_Truck_02_transport_F","I_Truck_02_covered_F","O_Truck_02_fuel_F","O_Truck_03_repair_F","O_Truck_03_medical_F","O_Truck_03_device_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-5.5,1.1]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		};
	case (typeOf _vehicle in ["B_Truck_01_fuel_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_box_F","B_Truck_01_mover_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-6.3,0.7]];
		sleep 0.2;
		_vehicle setVectorUp [0,-0.8,5];
		};
	case (typeOf _vehicle in ["B_T_LSV_01_unarmed_F", "B_T_LSV_01_armed_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-4.8,0.8]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,3];
		};
	case (typeOf _vehicle in ["O_T_LSV_02_unarmed_F", "O_T_LSV_02_armed_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-4.7,0.5]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,3];
		};
	case (typeOf _vehicle in ["B_MRAP_01_F", "B_MRAP_01_hmg_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-3.6,1.26]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,4];
		};
	case (typeOf _vehicle in ["O_MRAP_02_F", "O_MRAP_02_hmg_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-3.6,1.5]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,4];
		};
	case (typeOf _vehicle in ["I_MRAP_03_F", "I_MRAP_03_hmg_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-4.37,0.5]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,4];
		};
	case (typeOf _vehicle in ["B_Quadbike_01_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-3.5,1.2]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		};
	case (typeOf _vehicle in ["C_Heli_Light_01_civil_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-1.5,0.2]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		sleep 0.2;
		_vehicle setDir 180;
		};
	case (typeOf _vehicle in ["B_Heli_Light_01_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-1.5,1.1]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		sleep 0.2;
		_vehicle setDir 180;
		};
	case (typeOf _vehicle in ["O_Heli_Light_02_unarmed_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-0.5,2.1]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		sleep 0.2;
		_vehicle setDir 180;
		};
	case (typeOf _vehicle in ["I_Heli_Transport_02_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-1.1,3.5]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		sleep 0.2;
		_vehicle setDir 0;
		};
	case (typeOf _vehicle in ["I_Heli_light_03_unarmed_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-1.1,2.2]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		sleep 0.2;
		_vehicle setDir 0;
		};
	case (typeOf _vehicle in ["O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_bench_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-1.4,1.8]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		sleep 0.2;
		_car setDir 180;
		};
	case (typeOf _vehicle in ["O_Heli_Transport_04_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,1.4,1.8]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		sleep 0.2;
		_vehicle setDir 180;
		};
	case (typeOf _vehicle in ["B_Heli_Transport_03_unarmed_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,2.8,3.2]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		sleep 0.2;
		_vehicle setDir 180;
		};
	case (typeOf _vehicle in ["C_Plane_Civil_01_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-3.75,0.55]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,4];
		};
	case (typeOf _vehicle in ["C_Rubberboat"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-4.1,0.7]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		};
	case (typeOf _vehicle in ["C_Boat_Civil_01_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-4.1,0.6]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		};
	case (typeOf _vehicle in ["C_Scooter_Transport_01_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-3.6,0.9]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		};
	case (typeOf _vehicle in ["O_SDV_01_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-3.6,1.4]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		};
	case (typeOf _vehicle in ["I_C_Boat_Transport_02_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-4.4,0.7]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1,5];
		};
	};
_vehicle allowDamage true;
_vehicle enableSimulation true;
if(!_willLoad)exitWith
	{
	hint "This vehicle type can not be towed";
	DS_vehicleLoading = false;
	DS_loadingVehicle = nil;
	};
hint "Vehicle Connected";
DS_loadingVehicle setVariable ["gotLoad",true,true];
DS_vehicleLoading = false;
DS_loadingVehicle = nil;