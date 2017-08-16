/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Unloads a vehicle from the back of another
*/

private ["_vehicle","_attached"];

if((player getVariable ["restrained",false])||(DS_jailed))exitWith{hint "You can't do this while restrained";};

_vehicle = (nearestObjects [player,["I_Truck_02_transport_F","B_Truck_01_transport_F","O_Truck_03_transport_F"],20]) select 0;
if((isNil "_vehicle")||(isNull _vehicle))exitWith{};
if(!(_vehicle in DS_keyRing))exitWith{hint "You must have the vehicle's keys to do this"};

_attached = (attachedObjects _vehicle) select 0;
if(isNil "_attached")exitWith{hint "There's no vehicle on the truck to unload"};

hint "Unloading, please stand clear of the rear of this vehicle";
systemchat "Unloading, please stand clear of the rear of this vehicle";

sleep 5;
_attached allowDamage false;

switch(typeOf _vehicle)do {
	case "I_Truck_02_transport_F": {
		_attached attachTo [_vehicle,[0,-8.5,-0.4]];
	};
	case "B_Truck_01_transport_F": {
		if((typeOf _attached) in ["I_Heli_Transport_02_F"])exitWith {
			_attached attachTo [_vehicle,[0,-14.5,1.5]];
		};

		if((typeOf _attached) in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F"])exitWith {
			_attached attachTo [_vehicle,[0,-20,5]];
		};

		if((typeOf _attached) in ["O_T_VTOL_02_infantry_F","O_T_VTOL_02_vehicle_F"])exitWith {
			_attached attachTo [_vehicle,[0,-15,1.2]];
		};

		_attached attachTo [_vehicle,[0,-14.5,-0.2]];
	};
	case "O_Truck_03_transport_F": {
		_attached attachTo [_vehicle,[0,-14.5,-0.2]];
	};
};

sleep 1;

{
	detach _x;

	if(!(surfaceIsWater (getPos _x)))then {
		_x setVectorUp (surfaceNormal (getPos _x));
	};
} forEach attachedObjects _vehicle;

_vehicle setVariable ["gotLoad",false,true];
hint "Vehicle unloaded";

sleep 1;
_attached allowDamage true;