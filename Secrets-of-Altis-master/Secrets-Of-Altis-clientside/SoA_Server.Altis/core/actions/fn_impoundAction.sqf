/*
	File: fn_impoundAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Impounds the vehicle
*/
private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP"];
_vehicle = cursorObject;
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
if(player distance _vehicle > 10) exitWith {hint "Du bist zu weit weg!"};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	if(count _vehicleData == 0) exitWith {hint "Dieses Fahrzeug wurde womöglich ercheatet, bitte melde dies dem Support!"};
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	[0,"STR_NOTF_BeingImpounded",true,[(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["life_fnc_broadcast",0];
	life_action_inUse = true;
	
	_upp = localize "STR_NOTF_Impounding";
	_sleep = 0.09;
	_cP = 0.01;

	_handle = [_upp,_sleep,_cP,nil,_vehicle,12] spawn life_fnc_processBar;
	WaitUntil{scriptDone _handle};
	if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;life_action_inUse = false;};
	if(life_process_bad) exitWith {life_process_bad = false;life_action_inUse = false;};

	if((count crew _vehicle) == 0) then
	{
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {life_action_inUse = false;};
		_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		
		if(playerSide == west) then {
			switch (true) do
			{
				case (_vehicle isKindOf "Car"): {_price = (call life_impound_car);};
				case (_vehicle isKindOf "Ship"): {_price = (call life_impound_boat);};
				case (_vehicle isKindOf "Air"): {_price = (call life_impound_air);};
				default {_price = 0};
			};
		};

		[_vehicle] call life_fnc_vehicleDeAnimate;
				

		
		if(playerSide == west) then 
		{
			deletevehicle _vehicle;

			[0,"STR_NOTF_HasImpounded",true,[profileName,(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["life_fnc_broadcast",0];
			if(_vehicle in life_vehicles) then {
				life_beatbankgeld = life_beatbankgeld - _price; 
				hint format["Dir wurden %2€ von deinem Bankguthaben entzogen, dadurch, dass du deine(n) eigene(n) %1 beschlagnahmt hast.",_type,_price];
			} else {
				life_beatbankgeld = life_beatbankgeld + _price; hint format[localize "STR_NOTF_Impounded",_type,_price];
			};
			
			if(life_beatbankgeld < 0) then {life_beatbankgeld = 0};
		} else {

			life_impound_inuse = true;
			[_vehicle,true,player,(damage _vehicle),(fuel _vehicle)] remoteExecCall ["SOA_fnc_vehicleStore",2];
			waitUntil {!life_impound_inuse};
		};
	}
		else
	{
		hint localize "STR_NOTF_ImpoundingCancelled";
	};
};
life_action_inUse = false;