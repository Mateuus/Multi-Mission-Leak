#include <macro.h>
scopeName "destroy";
/*
	File: fn_impoundAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Impounds the vehicle
*/
private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_filters"];
_vehicle = param [0,ObjNull,[ObjNull]];
_filters = ["Car","Air","Ship","Tank"];
if(life_action_inuse) exitWith {};
if(!((KINDOF_ARRAY(_vehicle,_filters)))) exitWith {};
if(player distance cursorObject > 10) exitWith {};

_vehicleData = _vehicle getVariable ["vehicle_info_owners",[]];
if(count _vehicleData isEqualTo 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
_vehicleName = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _vehicle),"displayName");
if(_vehicle getVariable["purpose",""] isEqualTo "truck_mission") then
	{
		[0,format["%1 is impounding a delivery truck.",name player]] remoteExecCall ["life_fnc_brusathusek",-2];
	} else {
		[0,"STR_NOTF_BeingDestroyed",true,[SEL(SEL(_vehicleData,0),1),_vehicleName]] remoteExecCall ["life_fnc_brusathusek",-2];
	};

life_action_inUse = true;
_upp = localize "STR_NOTF_Destroying";
//Setup our progress bar.
disableSerialization;
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText format["%1...",_upp];
_processTime = 10;
_processTime = (_processTime) / (1 / 0.006);
for [{_i = 0},{_i < 1},{_i = _i + 0.006}] do
{
	_progress progressSetPosition _i;
	sleep _processTime;
	if(!alive player) exitWith {
		life_action_inUse = false;
		[false] call life_fnc_tufruxatra;
		breakOut "destroy";
	};
	if(player != vehicle player) exitWith {
		titleText ["You can't impound from inside a Vehicle!","PLAIN"];
		life_action_inUse = false;
		[false] call life_fnc_tufruxatra;
		breakOut "destroy";
	};
	if(player distance (position _vehicle) > 10) exitWith {
		titleText ["You're too far to continue!","PLAIN"];
		life_action_inUse = false;
		[false] call life_fnc_tufruxatra;
		breakOut "destroy";
	};
};

[false] call life_fnc_tufruxatra;

if(player distance _vehicle > 10) exitWith {hintSilent localize "STR_NOTF_DestroyingCancelled"; life_action_inUse = false;};
if(!alive player) exitWith {life_action_inUse = false;};

if((count crew _vehicle) isEqualTo 0) then
{
	if(!(KINDOF_ARRAY(_vehicle,_filters))) exitWith {life_action_inUse = false;};

	_type = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _vehicle),"displayName");
	switch (true) do {
		case (_vehicle isKindOf "Car"): {_price = LIFE_SETTINGS(getNumber,"impound_car");};
		case (_vehicle isKindOf "Ship"): {_price = LIFE_SETTINGS(getNumber,"impound_boat");};
		case (_vehicle isKindOf "Air"): {_price = LIFE_SETTINGS(getNumber,"impound_air");};
		case (_vehicle isKindOf "Tank"): {_price = LIFE_SETTINGS(getNumber,"impound_tank");};
	};

	life_impound_inuse = true;
	if(_vehicle getVariable["purpose",""] == "truck_mission") then
		{
			_price = LIFE_SETTINGS(getNumber,"impound_truck");
			hintSilent format["You have impounded a delivery truck.\n\nYou have received $%1 for cleaning up the streets!",_price];
			[0,format["%1 has impounded a delivery truck",name player]] remoteExecCall ["life_fnc_brusathusek",-2];
			[_price,1,0] call life_fnc_sewawruk;
			deleteVehicle _vehicle;
			life_impound_inuse = false;
		} else {
			deleteVehicle _vehicle;
			hintSilent format[localize "STR_NOTF_Destroyed",_type,_price];
			[0,"STR_NOTF_HasDestroyed",true,[profileName,SEL(SEL(_vehicleData,0),1),_vehicleName]] remoteExecCall ["life_fnc_brusathusek",-2];
			[_price,1,0] call life_fnc_sewawruk;
		};
} else {
		hintSilent localize "STR_NOTF_DestroyingCancelled";
};
life_action_inUse = false;
