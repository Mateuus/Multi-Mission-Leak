/*
	File: fn_storeVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
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
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],30]; //Fetch vehicles within 30m.
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




if(isNil "_vehicle") exitWith {hint "Kein Fahrzeug in der Nähe der Werkstatt"};
if(isNull _vehicle) exitWith {};
if(_vehicle getVariable["sperre",false]) exitWith {hint "Dieses Fahrzeug hat bereits eine Wegfahsperre!"};
if (dwf_cash < 50000) exitWith {hint "Du hast nicht genug Geld dabei um eine Wegfahrsperre montieren zu lassen"};

dwf_cash = dwf_cash - 50000;
hint "Die Werkstatt baut nun eine Alarmanlage in dein Fahrzeug ein! Bitte warte bis der Einbau fertiggestellt ist!";
sleep 5;
[0] call SOCK_fnc_updatePartial;
[player,_vehicle] remoteExec ["DWF_fnc_addVehicleSperre",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
