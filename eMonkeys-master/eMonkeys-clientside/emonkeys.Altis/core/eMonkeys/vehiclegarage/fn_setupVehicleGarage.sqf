/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_setupVehicleGarage.sqf
	Server: e-Monkeys.com
    
    Description: New Vehicle Garage System
*/
private["_vehicles","_display","_VehicleTypeList","_VehicleInfo","_GarageTypes","_vehClass","_vehType","_vehSort","_typeName","_typeVariable","_type"];
disableSerialization;

_vehicles = [_this,0,"",[[]]] call BIS_fnc_param;
_display = findDisplay 21000;
_VehicleTypeList = _display displayCtrl 1100;
_VehicleInfo = _display displayCtrl 1005;
_GarageTypes = EMonkeys_VehicleGarageSettings select 0;

if(!(TypeName _vehicles == "ARRAY")) exitWith
{
	_VehicleInfo ctrlSetStructuredText parseText "<t size = '0.95'>Fehler beim Abfragen deiner Fahrzeuge</t>";
};
_VehicleInfo ctrlSetStructuredText parseText "<t size = '0.95'>Fahrzeuge wurden geladen</t>";

//Setup Variables
EMonkeys_VehicleTypeList_car = [];
EMonkeys_VehicleTypeList_air = [];
EMonkeys_VehicleTypeList_truck = [];
EMonkeys_VehicleTypeList_atv = [];
EMonkeys_VehicleTypeList_armored = [];
EMonkeys_VehicleTypeList_plane = [];
EMonkeys_VehicleTypeList_boat = [];
EMonkeys_VehicleTypeList_log = [];

{
	_vehClass = _x select 1;
	_vehType = getText (missionConfigFile >> "CfgVehicles" >> _vehClass >> "type");
	_vehSort = getNumber (missionConfigFile >> "CfgVehicles" >> _vehClass >> "sort");
	
	if(_vehType == "car") then {EMonkeys_VehicleTypeList_car pushBack [_vehSort,_x]};
	if(_vehType == "air") then {EMonkeys_VehicleTypeList_air pushBack [_vehSort,_x]};
	if(_vehType == "truck") then {EMonkeys_VehicleTypeList_truck pushBack [_vehSort,_x]};
	if(_vehType == "atv") then {EMonkeys_VehicleTypeList_atv pushBack [_vehSort,_x]};
	if(_vehType == "armored") then {EMonkeys_VehicleTypeList_armored pushBack [_vehSort,_x]};
	if(_vehType == "plane") then {EMonkeys_VehicleTypeList_plane pushBack [_vehSort,_x]};
	if(_vehType == "boat") then {EMonkeys_VehicleTypeList_boat pushBack [_vehSort,_x]};
	if(_vehType == "log") then {EMonkeys_VehicleTypeList_log pushBack [_vehSort,_x]};
}foreach _vehicles;

//Setup VehicleList
_VehicleTypeList lbAdd "Wähle einen Fahrzeug Typ";
_VehicleTypeList lbSetCurSel 0;
{
	_typeName = getText (missionConfigFile >> "CfgVehicleGarage" >> "vehicleTypes" >> _x >> "name");
	_typeVariable = getText (missionConfigFile >> "CfgVehicleGarage" >> "vehicleTypes" >> _x >> "variable");

	_type = _VehicleTypeList lbAdd _typeName;
	_VehicleTypeList lbSetData [_type, _typeVariable];
}foreach _GarageTypes;


