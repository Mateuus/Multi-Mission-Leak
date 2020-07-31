/*
	File: fn_openInventory.sqf
	
	
	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data"];
_uid = getPlayerUID player;
life_antispamactive = true;
//Temp fail safe.
[] spawn {
	uiSleep 0.5;
	life_antispamactive = false;
};

if(dialog) exitWith {};
_vehicle = param [0,Objnull,[Objnull]];
if(isNull _vehicle OR !(_vehicle isKindOf "Motorcycle" OR _vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR _vehicle isKindOf "House_F")) exitWith {}; //Either a null or invalid vehicle type.

if((_vehicle getVariable ["trunk_in_use",false])) exitWith {[localize "STR_MISC_VehInvUse", false] spawn domsg;};
_vehicle setVariable["trunk_in_use",true,true];
if(!createDialog "TrunkMenu") exitWith {[localize "STR_MISC_DialogError", false] spawn domsg;}; //Couldn't create the menu?
disableSerialization;

if(_vehicle isKindOf "House_F") then {
	_ownerID = (_house getVariable "house_owner") select 0;
};

if(_vehicle isKindOf "House_F" && _uid != _ownerID) exitwith { closedialog 0; };

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

if(_vehicle isKindOf "House_F" && {count (_vehicle getVariable ["containers",[]]) == 0}) exitWith {[localize "STR_MISC_NoStorageWarn", false] spawn domsg; closeDialog 0; _vehicle setVariable["trunk_in_use",false,true];};
if(_veh_data select 0 == -1 && {!(_vehicle isKindOf "House_F")}) exitWith {closeDialog 0; _vehicle setVariable["trunk_in_use",false,true]; [localize "STR_MISC_NoStorageVeh", false] spawn domsg;};

ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;
_vehicle setVariable["trunkUsers",_uid,true]; //Track who should be in the trunk
_vehicle spawn
{
	waitUntil {isNull (findDisplay 3500)};
	_this setVariable["trunk_in_use",false,true];
	_this setVariable["trunkUsers",nil,true];
	if(_this isKindOf "House_F") then {
		[_this] remoteExecCall ["TON_fnc_updateHouseTrunk",(call life_fnc_HCC)];
	};
};