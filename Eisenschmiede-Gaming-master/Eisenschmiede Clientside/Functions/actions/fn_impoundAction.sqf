#include "..\script_macros.hpp"
/*
	File: fn_impoundAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Impounds the vehicle
*/
private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP"];
_vehicle = cursorTarget;
if(player distance cursorTarget > 10) exitWith {};
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || ((typeOf _vehicle) in ["Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_fuel_F","B_Slingload_01_Cargo_F","B_Slingload_01_Fuel_F","Land_Pod_Heli_Transport_04_bench_F","Land_Pod_Heli_Transport_04_covered_F"]))) exitWith {};

_vehicleData = _vehicle getVariable ["vehicle_info_owners",[]];
if(EQUAL((count _vehicleData),0)) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

if(playerSide == west) then {

[0,"STR_NOTF_BeingImpounded",true,[SEL(SEL(_vehicleData,0),1),_vehicleName]] remoteExec ["ES_fnc_broadcast",-2];

} else {

[0,"STR_NOTF_BeingImpoundedMed",true,[SEL(SEL(_vehicleData,0),1),_vehicleName]] remoteExec ["ES_fnc_broadcast",-2];

};

ES_action_inUse = true;

_upp = localize "STR_NOTF_Impounding";
//Setup our progress bar.
disableSerialization;
5 cutRsc ["ES_progress","PLAIN"];
_ui = uiNamespace getVariable "ES_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
	
while{true} do {
	sleep 0.09;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _vehicle > 10) exitWith {};
	if(!alive player) exitWith {};
};

5 cutText ["","PLAIN"];
	
if(player distance _vehicle > 10) exitWith {hint localize "STR_NOTF_ImpoundingCancelled"; ES_action_inUse = false;};
if(!alive player) exitWith {ES_action_inUse = false;};

if(EQUAL(count crew _vehicle,0)) then {

	if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || ((typeOf _vehicle) in ["Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_fuel_F","B_Slingload_01_Cargo_F","B_Slingload_01_Fuel_F","Land_Pod_Heli_Transport_04_bench_F","Land_Pod_Heli_Transport_04_covered_F"]))) exitWith {ES_action_inUse = false;};
	_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

	switch (true) do {
		case (_vehicle isKindOf "Car"): {_price = ES_SETTINGS(getNumber,"impound_car");};
		case (_vehicle isKindOf "Ship"): {_price = ES_SETTINGS(getNumber,"impound_boat");};
		case (_vehicle isKindOf "Air"): {_price = ES_SETTINGS(getNumber,"impound_air");};
	};
	
	ES_impound_inuse = true;
	[_vehicle,true,player] remoteExec ["ES_fnc_vehicleStore",2];
	waitUntil {!ES_impound_inuse};
	hint format[localize "STR_NOTF_Impounded",_type,_price];
	[0,"STR_NOTF_HasImpounded",true,[profileName,SEL(SEL(_vehicleData,0),1),_vehicleName]] remoteExec ["ES_fnc_broadcast",-2];
	ES_atmbank = ES_atmbank + _price;
} else {
	hint localize "STR_NOTF_ImpoundingCancelled";
};

ES_action_inUse = false;