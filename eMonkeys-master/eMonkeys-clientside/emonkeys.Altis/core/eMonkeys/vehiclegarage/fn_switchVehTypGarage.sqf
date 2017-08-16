/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_switchVehTypGarage.sqf
	Server: e-Monkeys.com
    
    Description: New Vehicle Garage System
*/
private["_display","_VehicleList","_VehicleTypeList","_selectedVehType","_vehType","_vehTypeVariable","_vehClass","_vehInfos","_vehicle"];
disableSerialization;

_display = findDisplay 21000;
_VehicleList = _display displayCtrl 1000;
_VehicleTypeList = _display displayCtrl 1100;

_selectedVehType = lbCurSel _VehicleTypeList;
_vehType = _VehicleTypeList lbData _selectedVehType;
_vehType = compile _vehType;
_vehTypeVariable = call _vehType;

_vehTypeVariable sort true;

//Setup VehicleList
lbClear _VehicleList;

{
	_vehClass = (_x select 1) select 1;
	_vehInfos = [_vehClass] call EMonkeys_fnc_fetchVehInfo;

	_vehicle = _VehicleList lbAdd (_vehInfos select 3);
	_VehicleList lbSetPicture [_vehicle, (_vehInfos select 2)];
	_VehicleList lbSetData [_vehicle, _vehClass];
	_VehicleList lbSetValue [_vehicle, _ForEachIndex];
}foreach _vehTypeVariable;