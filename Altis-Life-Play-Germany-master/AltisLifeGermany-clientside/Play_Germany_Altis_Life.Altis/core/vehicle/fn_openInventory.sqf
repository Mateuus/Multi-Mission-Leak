/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by: RafiQuak for PlayGermany

	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data","_exit"];
if(dialog) exitWith {};
if(isNil "PG_containers") then {PG_containers = ["Box_IND_AmmoVeh_F", "B_Slingload_01_Cargo_F","B_Slingload_01_Repair_F","Land_Wreck_Traw_F","Land_Wreck_Traw2_F"];};
_exit = false;
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle OR !(_vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR _vehicle isKindOf "House_F" OR typeOf _vehicle in PG_containers)) exitWith {}; //Either a null or invalid vehicle type.


_trunkInUse = _vehicle getVariable ["trunk_in_use",""];
if((_trunkInUse != "") && (_trunkInUse != profileName)) then {
	_action = [
		"Achtung, jemand greift bereits auf den Kofferraum zu, willst du ihn kicken?",
		"Achtung",
		"Ja",
		"Nein"
	] call BIS_fnc_guiMessage;

	if(_action) then {
		_exit = false;
	} else {
		_exit = true;
	};
};
if (_exit) exitWith {};

_vehicle setVariable["trunk_in_use",profileName,true];

if(!createDialog "TrunkMenu") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?
disableSerialization;

if(_vehicle isKindOf "House_F") then {
	ctrlSetText[3501,format[(localize "STR_MISC_HouseStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
} else {
	ctrlSetText[3501,format[(localize "STR_MISC_VehStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
};

if(_vehicle isKindOf "House_F") then {
	private["_mWeight"];
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_vehicle getVariable["containers",[]]);
	_veh_data = [_mWeight,(_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_veh_data = [_vehicle] call life_fnc_vehicleWeight;
};

if(_vehicle isKindOf "House_F" && {count (_vehicle getVariable ["containers",[]]) == 0}) exitWith {hint localize "STR_MISC_NoStorageWarn"; closeDialog 0; _vehicle setVariable["trunk_in_use","",true];};
if(_veh_data select 0 == -1 && {!(_vehicle isKindOf "House_F")}) exitWith {closeDialog 0; _vehicle setVariable["trunk_in_use","",true]; hint localize "STR_MISC_NoStorageVeh";};

ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

_vehicle spawn
{
	waitUntil {isNull (findDisplay 3500)};
	_this setVariable["trunk_in_use","",true];
	if(_this isKindOf "House_F") then {
		[[_this],"TON_fnc_updateHouseTrunk",false,false] call life_fnc_MP;
	};
};