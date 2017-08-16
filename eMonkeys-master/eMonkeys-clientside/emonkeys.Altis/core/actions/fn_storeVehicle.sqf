/*
	File: fn_storeVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Stores the vehicle in the garage.
*/
private["_VehicleType","_nearVehicles","_vehicle","_vehOwnerData","_vehDBData"];
_VehicleType = [_this,3,"",[""]] call BIS_fnc_param;

//HeadlessClient check
if(!EMonkeys_HC_isActive) exitWith {["Garagen Information",["Es besteht keine Verbindung zur Datenbank","Kontaktiere einen Admin"],"#0090ff"] call EMonkeys_fnc_specialText;};

if(_VehicleType == "") then
{
	_VehicleType = ["Car","Air","Ship","Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"];
} else {
	if(_VehicleType == "Box") then
	{
		_VehicleType = ["Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"]
	} else {
		_VehicleType = [_VehicleType];
	};
};

if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos (_this select 0),_VehicleType,30]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehOwnerData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehOwnerData  > 0) then
			{
				_vehOwner = (_vehOwnerData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};
};
if(isNil "_vehicle") exitWith {["Garagen Information",["Es steht kein passendes Fahrzeug in der Nähe"],"#0090ff"] call EMonkeys_fnc_specialText};
if(isNull _vehicle) exitWith {};
_vehDBData = _vehicle getVariable["dbInfo",[]];
if(count _vehDBData == 0) exitWith {["Garagen Information",["Dieses Fahrzeug ist gemietet","und kann nicht geparkt werden"],"#0090ff"] call EMonkeys_fnc_specialText};
[[_vehicle,false,(_this select 1),(fuel _vehicle)],"TON_fnc_vehicleStore",false,false] call EMonkeys_fnc_mp;
["Garagen Information",["Eine Moment ...","dein Fahrzeug wird geparkt"],"#0090ff"] call EMonkeys_fnc_specialText;
eM_garage_store = true;