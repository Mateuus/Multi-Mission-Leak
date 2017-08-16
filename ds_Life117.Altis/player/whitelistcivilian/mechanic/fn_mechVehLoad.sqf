/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Loads a vehicle onto the back of another (Mechanic Towing Version)
*/
private["_vehicle","_load","_stage","_willLoad","_fail"];

_fail = false;
_vehicle = nearestObjects[getPos (vehicle player), ["Air","LandVehicle","Ship"],20];
_vehicle = _vehicle select 0;

//systemchat format ["%1",_vehicle];

_stage = (_this select 3) select 0;
_willLoad = false;
if(isNull _vehicle) exitWith {};
[] spawn	{sleep 20;DS_vehicleLoading = false};
if(_stage)exitwith
	{
	DS_loadingVehicle = _vehicle;
	if(!(DS_loadingVehicle in DS_keyRing))exitwith{_fail = true};
	DS_vehicleLoading = true;
	systemchat format ["Loading Vehicle Setup",_vehicle];
	};
if(_fail)exitwith{};	

//systemchat format ["Past this point",_vehicle];

if(!DS_vehicleLoading)exitwith{hint "You haven't selected a vehicle to tow this onto"};
if(isNull DS_loadingVehicle)exitwith{hint "There is no vehicle selected to tow this vehicle onto"};
//if(_vehicle isKindOf "LandVehicle")then{_vehicle = nearestObjects[getPos (vehicle player), ["Air","Ship"],20];};
if(DS_loadingVehicle distance player > 30)exitwith{hint "You are too far from your tow vehicle to complete this"};

hint "Connecting vehicle.....";
_vehicle allowDamage false;
_vehicle enableSimulation false;

if(!local _vehicle)then
	{
	[[_vehicle,player],"HUNT_fnc_changeOwner",true,false] spawn BIS_fnc_MP;
	};
waitUntil{(local _vehicle)};

switch(true)do
	{
	case (typeOf _vehicle in ["C_SUV_01_F","C_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","B_G_Offroad_01_F"]):
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
	case (typeOf _vehicle in ["B_MRAP_01_F"]):
		{
		_willLoad = true;
		_vehicle attachTo[DS_loadingVehicle,[0,-3.5,1.3]];
		sleep 0.2;
		_vehicle setVectorUp [0,-1.3,5];
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



















