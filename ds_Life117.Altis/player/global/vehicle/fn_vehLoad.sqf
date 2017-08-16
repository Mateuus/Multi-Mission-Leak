/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Loads a vehicle onto the back of another
*/
private["_vehicle","_load","_stage","_willLoad","_fail"];

_fail = false;
_vehicle = nearestObjects[getPos (vehicle player), ["Air","LandVehicle","Ship"],20];
_vehicle = _vehicle select 0;
_stage = (_this select 3) select 0;
_willLoad = false;
if(isNull _vehicle) exitWith {};
[] spawn	{sleep 20;DS_vehicleLoading = false};
if(_stage)exitwith
	{
	if(!(DS_loadingVehicle in DS_keyRing))exitwith{_fail = true};
	DS_vehicleLoading = true;
	DS_loadingVehicle = _vehicle;
	};
if(_fail)exitwith{};	
if(!DS_vehicleLoading)exitwith{hint "You haven't selected a vehicle to load this onto"};
if(isNull DS_loadingVehicle)exitwith{hint "There is no vehicle selected to load this vehicle onto"};
if(_vehicle isKindOf "LandVehicle")then{_vehicle = nearestObjects[getPos (vehicle player), ["Air","Ship"],20];};
if(DS_loadingVehicle distance player > 30)exitwith{hint "You are too far from your loading vehicle to complete this"};

hint "Loading vehicle.....";
switch(typeOf DS_loadingVehicle)do
	{
	case "I_Truck_02_transport_F":
		{
		if(typeOf _vehicle in ["C_Boat_Civil_01_F","C_Rubberboat","O_SDV_01_F"])then
			{
			_willLoad = true;
			_vehicle attachTo[DS_loadingVehicle,[0,-1.5,1]];
			};
		if(typeOf _vehicle in ["C_Heli_Light_01_civil_F","B_Heli_Light_01_armed_F","B_Heli_Light_01_F"])then
			{
			_willLoad = true;
			_vehicle attachTo[DS_loadingVehicle,[0,-2.5,0.4]];
			};
		};
	case "B_Truck_01_transport_F":
		{
		if(typeOf _vehicle in ["C_Boat_Civil_01_F","C_Rubberboat","O_SDV_01_F"])then
			{
			_willLoad = true;
			_vehicle attachTo[DS_loadingVehicle,[0,-1.5,1]];
			};
		if(typeOf _vehicle in ["C_Heli_Light_01_civil_F","B_Heli_Light_01_armed_F","B_Heli_Light_01_F"])then
			{
			_willLoad = true;
			_vehicle attachTo[DS_loadingVehicle,[0,-2.5,0.4]];
			};
		if(typeOf _vehicle in ["O_Heli_Light_02_unarmed_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_F","I_Heli_light_03_F"])then
			{
			_willLoad = true;
			_vehicle attachTo[DS_loadingVehicle,[0,-3,2.2]];
			};
		if(typeOf _vehicle in ["I_Plane_Fighter_03_AA_F"])then
			{
			_willLoad = true;
			_vehicle attachTo[DS_loadingVehicle,[0,-3,2.2]];
			};
		if(typeOf _vehicle in ["B_Plane_CAS_01_F"])then
			{
			_willLoad = true;
			_vehicle attachTo[DS_loadingVehicle,[0,-2.7,1.2]];
			};
		};
	};
if(!_willLoad)exitWith
	{
	hint "This vehicle type can not be loaded onto your selected vehicle";
	DS_vehicleLoading = false;
	DS_loadingVehicle = nil;
	};
hint "Vehicle loaded";
DS_loadingVehicle setVariable ["gotLoad",true,true];
DS_vehicleLoading = false;
DS_loadingVehicle = nil;



















