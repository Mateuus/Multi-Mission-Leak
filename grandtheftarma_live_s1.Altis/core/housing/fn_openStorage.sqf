
/*
File: fn_openStorage.sqf
Author: Mario2002

Description:
open the house storage
*/
private["_house","_veh_data","_used","_houseData"];
if(dialog) exitWith {};
_house = cursorObject;//[_this,0,Objnull,[Objnull]] call GTA_fnc_param;
if(isNull _house OR (count (_house getVariable["containers", []]) < 1)) exitWith {systemChat "Bad House";}; //Either a null or invalid vehicle type.

if((_house getVariable ["trunk_in_use",false])) exitWith {hint "This storage is in use, only one person can use it at a time."};
_house setVariable["trunk_in_use",true,true];
if(!createDialog "TrunkHouseMenu") exitWith {"Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;
ctrlSetText[8501,format["House Trunk - %1",getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName")]];

_weight = 0;
_houseData = _house getVariable["Trunk",[[],0]];
if(count _houseData == 0) then {
	_used = 0;
} else {
	_used = _houseData select 1;
};

_radius = (((boundingBoxReal _house select 0) select 2) - ((boundingBoxReal _house select 1) select 2));
_boxes = nearestObjects [position _house, ["Land_Box_AmmoOld_F","B_supplyCrate_F"], _radius];
{
	_box_data = [_x] call life_fnc_vehicleWeight;
	_weight = _weight + (_box_data select 0);
	_used = _used + (_box_data select 1);
}forEach _boxes;

_veh_data = [_weight, _used];

if(_veh_data select 0 == -1) exitWith {closeDialog 0;hint "close dialog";};

ctrlSetText[8504,format["Weight: %1/%2",_veh_data select 1,_veh_data select 0]];

[_house] call life_fnc_houseInventory;
life_trunk_vehicle = _house;

[_house] spawn
{
	waitUntil {isNull (findDisplay 8500)};
	(_this select 0) setVariable["trunk_in_use",false,true];
};