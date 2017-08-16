/*
	File: fn_openlouisBox.sqf
	Author: Blackd0g

	Description:
	customized vehicle inventory script for louis box
*/
private ["_box","_display","_storeBTN","_takeBTN","_mWeight","_veh_data","_entities"];
if(dialog) exitWith {};
_box = param [0,Objnull,[Objnull]];
_entities = [];

if (typeOf _box != "Land_Pallet_MilBoxes_F") exitWith {};
if((_box getVariable ["trunk_in_use",false])) exitWith {hint localize "STR_MISC_VehInvUse"};
if((_box getVariable ["trunk_in_use",false])) exitWith {hint localize "STR_MISC_VehInvUse"};
if((_box getVariable ["trunk_in_use",false])) exitWith {hint localize "STR_MISC_VehInvUse"};
if((_box getVariable ["trunk_in_use",false])) exitWith {hint localize "STR_MISC_VehInvUse"};

_box setVariable["trunk_in_use",true,true];

if(!createDialog "TrunkMenu") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?
disableSerialization;
ctrlSetText[3501,"Louis Box"];

_display = findDisplay 3500;
_storeBTN = _display displayCtrl 8578;
_takeBTN = _display displayCtrl 8579;
_quickBTN = _display displayCtrl 3499;
_storeBTN ctrlShow false;
_takeBTN ctrlShow false;
_quickBTN ctrlShow false;
_storeBTN ctrlSetText format["-%1",LHM_quick_change_virtitem];
_takeBTN ctrlSetText format["+%1",LHM_quick_change_virtitem];

_veh_data = [_box] call lhm_fnc_vehicleWeight;

if(_veh_data select 0 == -1) exitWith {closeDialog 0; _box setVariable["trunk_in_use",false,true]; hint localize "STR_MISC_NoStorageVeh";};

ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",_veh_data select 1,_veh_data select 0]];

[_box] call lhm_fnc_vehInventory;

lhm_trunk_vehicle = _box;

_box spawn
{
	waitUntil {isNull (findDisplay 3500)};
	_this setVariable["trunk_in_use",false,true];
};