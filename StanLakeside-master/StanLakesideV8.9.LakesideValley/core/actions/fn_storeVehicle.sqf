/*
	File: fn_storeVehicle.sqf
	
	
	Description:
	Stores the vehicle in the garage.
*/
private["_nearVehicles","_vehicle"];
if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
else
{
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship","Motorcycle","Bicycle","Motorbike"],30]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {[localize "STR_Garage_NoNPC", false] spawn domsg;};
if(isNull _vehicle) exitWith {};
[_vehicle,false,(_this select 1)] remoteExec ["TON_fnc_vehicleStore",(call life_fnc_HCC)];
[localize "STR_Garage_Store_Server", false] spawn domsg;
life_garage_store = true;