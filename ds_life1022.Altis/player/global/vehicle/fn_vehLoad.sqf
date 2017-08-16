/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Loads a vehicle onto the back of another
*/

private ["_willLoad","_vehicle"];

if((player getVariable ["restrained",false])||(DS_jailed))exitWith{hint "You can't do this while restrained";};

_willLoad = false;

[] spawn {
	sleep 20;
	DS_vehicleLoading = false;
};

if(isNil "DS_loadingVehicle")exitWith {
	_vehicle = (nearestObjects [player,["I_Truck_02_transport_F","B_Truck_01_transport_F","O_Truck_03_transport_F"],20]) select 0;

	if(isNull _vehicle)then {
		hint "No loading vehicle was found";
	} else {
		DS_vehicleLoading = true;
		DS_loadingVehicle = _vehicle;
		hint "Scroll wheel on another vehicle and select 'Load this vehicle onto a truck' to load it";
	};
};

if(isNil "DS_loadingVehicle")exitWith{hint "There is no vehicle selected to load this vehicle onto"};
if(isNull DS_loadingVehicle)exitWith{hint "There is no vehicle selected to load this vehicle onto"};
if(!(DS_loadingVehicle in DS_keyRing))exitWith{hint "You must have the vehicle's keys to do this"};

_vehicle = (nearestObjects [player,["Car","Air","Ship"],20]) select 0;
if((isNil "_vehicle")||(isNull _vehicle))exitWith{hint "No vehicle was found to load onto the loading vehicle"};

if(DS_loadingVehicle distance player > 30)exitWith{hint "You are too far from your loading vehicle to do this"};

hint "Loading vehicle...";

switch(typeOf DS_loadingVehicle)do {
	case "I_Truck_02_transport_F": {
		if((typeOf _vehicle) in ["C_Boat_Civil_01_F","C_Rubberboat","O_SDV_01_F","I_C_Boat_Transport_02_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-1.5,1]];
		};
		if((typeOf _vehicle) in ["C_Scooter_Transport_01_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-1,0.6]];
		};
		if((typeOf _vehicle) in ["C_Heli_Light_01_civil_F","B_Heli_Light_01_armed_F","B_Heli_Light_01_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2.5,0.4]];
		};
	};
	case "B_Truck_01_transport_F": {
		//Land Vehicles
		if((typeOf _vehicle) in ["B_Quadbike_01_F","C_Hatchback_01_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Offroad_02_unarmed_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2.2,1.1]];
		};
		if((typeOf _vehicle) in ["C_Van_01_box_F","C_Van_01_fuel_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-1.6,1.1]];
		};
		/*
		if((typeOf _vehicle) in ["I_Truck_02_transport_F","I_Truck_02_covered_F","O_Truck_02_fuel_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2.27,1.91]];
		};
		*/
		if((typeOf _vehicle) in ["O_Truck_03_device_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-0.55,1.54]];
		};
		if((typeOf _vehicle) in ["B_T_LSV_01_unarmed_F","B_T_LSV_01_armed_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2.16,1.64]];
		};
		if((typeOf _vehicle) in ["O_T_LSV_02_unarmed_F","O_T_LSV_02_armed_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0.19,-2.1,1.21]];
		};
		if((typeOf _vehicle) in ["B_MRAP_01_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-0.69,1.68]];
		};
		if((typeOf _vehicle) in ["B_MRAP_01_hmg_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-0.69,2.23]];
		};
		if((typeOf _vehicle) in ["O_MRAP_02_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-0.61,1.92]];
		};
		if((typeOf _vehicle) in ["O_MRAP_02_hmg_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-0.61,2.27]];
		};
		if((typeOf _vehicle) in ["I_MRAP_03_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-1.9,1.31]];
		};
		if((typeOf _vehicle) in ["I_MRAP_03_hmg_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-1.9,1.92]];
		};

		//Air Vehicles
		if((typeOf _vehicle) in ["C_Heli_Light_01_civil_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2.95,0.08]];
		};
		if((typeOf _vehicle) in ["B_Heli_Light_01_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-1.96,0.88]];
		};
		if((typeOf _vehicle) in ["O_Heli_Light_02_unarmed_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-1.04,2.38]];
		};
		if((typeOf _vehicle) in ["I_Heli_Transport_02_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-3.4,3.42]];
		};
		if((typeOf _vehicle) in ["I_Heli_light_03_unarmed_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-3.44,1.72]];
		};
		if((typeOf _vehicle) in ["O_Heli_Transport_04_fuel_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-1.72,2.4]];
		};
		if((typeOf _vehicle) in ["O_Heli_Transport_04_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-1.72,2.8]];
		};
		if((typeOf _vehicle) in ["B_Heli_Transport_03_unarmed_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-1.3,3.12]];
		};
		if((typeOf _vehicle) in ["C_Plane_Civil_01_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-3.18,1.06]];
		};
		if((typeOf _vehicle) in ["I_Plane_Fighter_03_AA_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2.15,2.06]];
		};
		if((typeOf _vehicle) in ["B_Plane_CAS_01_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2.15,1.39]];
		};
		if((typeOf _vehicle) in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-4.05,6.43]];
		};
		if((typeOf _vehicle) in ["O_T_VTOL_02_infantry_F","O_T_VTOL_02_vehicle_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0.03,-1.82,2.78]];
		};

		//Sea Vehicles
		if((typeOf _vehicle) in ["C_Rubberboat"])exitWith	{
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2.27,1.02]];
		};
		if((typeOf _vehicle) in ["C_Boat_Civil_01_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2.27,1.08]];
		};
		if((typeOf _vehicle) in ["C_Scooter_Transport_01_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2.27,0.9]];
		};
		if((typeOf _vehicle) in ["O_SDV_01_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-1.41,1.34]];
		};
		if((typeOf _vehicle) in ["I_C_Boat_Transport_02_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2.2,1]];
		};
		if((typeOf _vehicle) in ["O_Boat_Armed_01_hmg_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-1.17,2.8]];
		};
	};
	case "O_Truck_03_transport_F": {
		if((typeOf _vehicle) in ["C_Boat_Civil_01_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-3.4,1]];
		};
		if((typeOf _vehicle) in ["C_Rubberboat","I_C_Boat_Transport_02_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2.5,1]];
		};
		if((typeOf _vehicle) in ["O_SDV_01_F","C_Scooter_Transport_01_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2,1]];
		};
		if((typeOf _vehicle) in ["C_Heli_Light_01_civil_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-3.5,0.4]];
		};
		if((typeOf _vehicle) in ["B_Heli_Light_01_armed_F","B_Heli_Light_01_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2.5,0.4]];
		};
		if((typeOf _vehicle) in ["O_Heli_Light_02_unarmed_F","O_Heli_Light_02_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-3,2.2]];
		};
		if((typeOf _vehicle) in ["I_Heli_light_03_unarmed_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-4.5,2.2]];
		};
		if((typeOf _vehicle) in ["I_Heli_light_03_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-4.5,2]];
		};
		if((typeOf _vehicle) in ["C_Plane_Civil_01_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-4,1.2]];
		};
		if((typeOf _vehicle) in ["I_Plane_Fighter_03_AA_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-3,2.4]];
		};
		if((typeOf _vehicle) in ["B_Plane_CAS_01_F"])exitWith {
			_willLoad = true;
			_vehicle attachTo [DS_loadingVehicle,[0,-2.7,1.8]];
		};
	};
};

if(!_willLoad)exitWith {
	hint "This vehicle type can not be loaded onto your loading truck";
	DS_vehicleLoading = false;
	DS_loadingVehicle = nil;
};

hint "Vehicle loaded";
DS_loadingVehicle setVariable ["gotLoad",true,true];
DS_vehicleLoading = false;
DS_loadingVehicle = nil;