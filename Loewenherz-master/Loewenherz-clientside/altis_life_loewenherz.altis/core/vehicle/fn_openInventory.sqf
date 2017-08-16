/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/


private ["_vehicle","_display","_storeBTN","_takeBTN","_mWeight","_veh_data","_entities"];
if(dialog) exitWith {};
_vehicle = param [0,Objnull,[Objnull]];
if(isNull _vehicle OR !(_vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR _vehicle isKindOf "Box_IND_Grenades_F" OR _vehicle isKindOf "B_supplyCrate_F")) exitWith {}; //Either a null or invalid vehicle type.
if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};
//_unitsnear = (nearestObjects[_vehicle, ["Man"], 12]) arrayIntersect playableUnits;
//if(count _unitsnear > 1) exitWith {hint localize "STR_NOTF_PlayerNear"};

if((_vehicle getVariable ["trunk_in_use",false])) exitWith {hint localize "STR_MISC_VehInvUse"};
if((_vehicle getVariable ["trunk_in_use",false])) exitWith {hint localize "STR_MISC_VehInvUse"};

if((typeOf _vehicle) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) then {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in lhm_vehicles) && {(_house getVariable ["locked",false])}) exitWith {
		hint localize "STR_House_ContainerDeny";
	};
};

_vehicle setVariable["trunk_in_use",true,true];
if(!createDialog "TrunkMenu") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?
disableSerialization;

if(_vehicle isKindOf "Box_IND_Grenades_F" OR _vehicle isKindOf "B_supplyCrate_F") then {
	ctrlSetText[3501,format[(localize "STR_MISC_HouseStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
} else {
	ctrlSetText[3501,format[(localize "STR_MISC_VehStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
};



// Anti Dupe

LHM_Trunk_Anti_Dupe = netid _vehicle;
if(vehicle player == player) then {
	_entities = nearestObjects [player, ["MAN"], 15];

	{
		if(!(isplayer _x)) then {
			_entities = _entities - [_x];
		};

	} foreach _entities;
} else {
	_entities = crew (vehicle player);

	{
		if(!(alive _x)) then {
			_entities = _entities - [_x];
		};

	} foreach _entities;

};
_entities = _entities - [player];
if(count(_entities) != 0) then {
	[[LHM_Trunk_Anti_Dupe],"lhm_fnc_trunk_anti_dupe",[_entities],false] call lhm_fnc_mp;
};

// Anti Dupe



_display = findDisplay 3500;
_storeBTN = _display displayCtrl 8578;
_takeBTN = _display displayCtrl 8579;
_storeBTN ctrlSetText format["-%1",LHM_quick_change_virtitem];
_takeBTN ctrlSetText format["+%1",LHM_quick_change_virtitem];

_veh_data = [_vehicle] call lhm_fnc_vehicleWeight;

if(_veh_data select 0 == -1) exitWith {closeDialog 0; _vehicle setVariable["trunk_in_use",false,true]; hint localize "STR_MISC_NoStorageVeh";};

ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call lhm_fnc_vehInventory;
lhm_trunk_vehicle = _vehicle;

_vehicle spawn {
	waitUntil {isNull (findDisplay 3500)};
	_this setVariable["trunk_in_use",false,true];
	if(_this isKindOf "Box_IND_Grenades_F" OR _this isKindOf "B_supplyCrate_F") then {
		[[_this],"TON_fnc_updateHouseTrunk",false,false] call lhm_fnc_mp;
	};
	LHM_Trunk_Anti_Dupe = nil;
};