#include "..\..\macros.hpp"
/*
	File: fn_impoundAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Impounds the vehicle
*/
private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_side"];
_vehicle = cursorTarget;
_side = player getVariable["playertype",""];
_arrest_vehicle = false;
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
if(player distance cursorTarget > 10) exitWith {};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	if(count _vehicleData == 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	
	if(_side == "COP") then
	{
		//format["%1 dein %2 wird gerade von der Polizei beschlagnahmt.",(_vehicleData select 0) select 1,_vehicleName] remoteExec ["systemChat", -2]; 
		_arrest_vehicle = true; // Fahrzeug auf die Verwahrstelle stellen
	}
	else
	{
		//format["%1 dein %2 wird gerade von der Feuerwehr in die Garage gebracht.",(_vehicleData select 0) select 1,_vehicleName] remoteExec ["systemChat", -2]; 
		_arrest_vehicle = false; // Fahrzeug in die Garage stellen
	};
	
	DWEV_action_inUse = true;
	
	if(_side == "COP") then
	{
		_upp = "Beschlagnahme Fahrzeug";
	}
	else
	{
		_upp = "Parke Fahrzeug ein";
	};
	
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["DWEV_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DWEV_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	while{true} do
	{
		sleep 0.09;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 10) exitWith {};
		if(!alive player) exitWith {};
	};
	5 cutText ["","PLAIN"];
		if(player distance _vehicle > 10 && (side player) == west) exitWith {hint "Beschlagnahmung fehlgeschlagen."; DWEV_action_inUse = false;};
		if(player distance _vehicle > 10 && (side player) == independent) exitWith {hint "Einparken fehlgeschlagen."; DWEV_action_inUse = false;};

	if(!alive player) exitWith {DWEV_action_inUse = false;};
	if(player distance _vehicle > 10) exitWith {DWEV_action_inUse = false;};
		
	//_time = _vehicle getVariable "time";
	//if(isNil {_time}) exitWith {deleteVehicle _vehicle; hint "This vehicle was hacked in"};
	//if((time - _time)  < 120) exitWith {hint "This is a freshly spawned vehicle, you have no right impounding it."};
	
	// Fahrzeug beschlagnahmen lassen wenn kein Lebender mehr drinn sitzt
	_aliveBodyinVehicle = false;
	{if (alive _x) exitwith {_aliveBodyinVehicle = true;};} count crew _vehicle;
	
	
	
	//if((count crew _vehicle) == 0) then
	if (!_aliveBodyinVehicle) then
	{
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {DWEV_action_inUse = false;};
		_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		switch (true) do
		{
			case (_vehicle isKindOf "Car"): {_price = (call DWEV_impound_car);};
			case (_vehicle isKindOf "Ship"): {_price = (call DWEV_impound_boat);};
			case (_vehicle isKindOf "Air"): {_price = (call DWEV_impound_air);};
		};
		
		DWEV_impound_inuse = true;
		[_vehicle,true,player,_arrest_vehicle] remoteExec ["DWF_fnc_vehicleStore",2];
		
		waitUntil {!DWEV_impound_inuse};
		
		if(_side == "COP") then
		{
			hint format["Du hast einen %1 beschlagnahmt.",_type];
			format["%1 hat das Fahrzeug %3 von %2 beschlagnahmt.",getMyDName,(_vehicleData select 0) select 1,_vehicleName] remoteExec ["systemChat", -2]; 
		}
		else
		{
			dwf_atmcash = dwf_atmcash + _price;
			hint format["Du hast ein %1 eingeparkt.\n\nFür das reinigen der Straße hast du %2€ erhalten!",_type,_price];

			format["%1 hat das Fahrzeug %3 von %2 zurück in die Garage gebracht.",getMyDName,(_vehicleData select 0) select 1,_vehicleName] remoteExec ["systemChat", -2]; 
		};
		
		
	}
		else
	{
		
		if(_side == "COP") then
		{
			hint "Beschlagnahmung fehlgeschlagen.";
		}
		else
		{
			hint "Einparken fehlgeschlagen.";
		};
		
	};
};
DWEV_action_inUse = false;