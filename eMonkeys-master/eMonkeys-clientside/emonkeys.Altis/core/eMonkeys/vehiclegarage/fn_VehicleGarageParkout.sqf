/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_VehicleGarageParkout.sqf
	Server: e-Monkeys.com
    
    Description: New Vehicle Garage System
*/
private["_display","_VehicleList","_VehicleTypeList","_selectedVehType","_vehType","_vehTypeVariable","_selectedVeh","_vehicleClass","_vehListIndex","_colorClass","_uid","_priceArray","_price"];
disableSerialization;

_display = findDisplay 21000;
_VehicleList = _display displayCtrl 1000;
_VehicleTypeList = _display displayCtrl 1100;

_selectedVehType = lbCurSel _VehicleTypeList;
_vehType = _VehicleTypeList lbData _selectedVehType;
_vehType = compile _vehType;
_vehTypeVariable = call _vehType;

_selectedVeh = lbCurSel _VehicleList;
_vehicleClass = _VehicleList lbData _selectedVeh;
_vehListIndex = _VehicleList lbValue _selectedVeh;
_price = 0;

_priceArray = getArray (missionConfigFile >> "CfgVehicles" >> _vehicleClass >> "garageFee");
switch (playerSide) do
{
	case civilian: {_price = _priceArray select 0};
	case opfor: {_price = _priceArray select 0};
	case west: {_price = _priceArray select 1};
	case independent: {_price = _priceArray select 2};
};

if((EMonkeys_VehicleGarageSettings select 2) == "impound") then
{
	_price = ((_price / 100)* 25) + _price;
};

closeDialog 0;

//Check HC Connected
if(!EMonkeys_HC_isActive) exitWith
{
	["Garagen Information",["Transfer abgebrochen","Es besteht keine Verbindung zur Datenbank","Kontaktiere einen Admin"],"#0090ff"] call EMonkeys_fnc_specialText;
	
	EMonkeys_VehicleGarageSettings = nil;
	EMonkeys_GarageInUse = false;
};

//Parkout Vehicle
if(EMonkeys_a164 < _price) then 
{
	["Garagen Information",["Transfer abgebrochen","Du hast nicht genug Geld"],"#0090ff"] call EMonkeys_fnc_specialText;
}
else
{
	cutText ["","BLACK OUT",1.5];
	uisleep 2;
	_uid = getPlayerUID player;
	_vehicleVariable = ((_vehTypeVariable select _vehListIndex) select 1);
	_vid = _vehicleVariable select 0;
	_vcolor = _vehicleVariable select 4;
	_vplate = _vehicleVariable select 3;
	_vfuel = _vehicleVariable select 5;
	_vehInfos = [_vehicleClass] call EMonkeys_fnc_fetchVehInfo;
	[[player,_uid,_vid,_vehicleClass,_vcolor,_vplate,_vfuel,_price,(EMonkeys_VehicleGarageSettings select 1),(EMonkeys_VehicleGarageSettings select 2)],"TON_fnc_parkoutVehicle",false,false] call EMonkeys_fnc_mp;
	["",["Einen Moment...",format["dein(e) %1 wird gerade vorbereitet...",_vehInfos select 3]],"","#81c800",3] call EMonkeys_fnc_specialText;
};

//Delete Variable
EMonkeys_VehicleGarageSettings = nil;
