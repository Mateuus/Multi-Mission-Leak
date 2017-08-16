/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Returns information about the closes vehicle to the police officer
*/
private ["_vehicle","_type","_speed","_vehicleData","_owner"];

_vehicle = nearestObjects [(getpos player),["LandVehicle"],30];
_vehicle = _vehicle select 1;//Dont select the players own vehicle

if(isNil"_vehicle")exitwith{hint "No nearby vehicle detected"};

_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_speed = (speed _vehicle);
_vehicleData = _vehicle getVariable["vehicle_owners",[]];

hint format ["Running plates of a %1....",_type];

if(count _vehicleData == 0)then
	{
	_owner = "No Owner Found";
	}
	else
	{
	_owner = ((_vehicleData select 0)select 1);
	};
sleep 7;

player say3D "dingdong";
hint format ["Vehicle Information\n\nType: %1\nSpeed: %2\nOwner: %3",_type,_speed,_owner];