/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_vehicleGarageMenu.sqf
	Server: e-Monkeys.com

    Description: New Vehicle Garage System
*/
private["_input","_GarageType","_SpawnType","_VehicleTyps","_GarageSide","_SpawnPoints","_markerPos","_markerDir","_GarageName","_display","_VehicleInfo","_GarageTitel","_GarageTitel"];
disableSerialization;
_input = _this select 3;
_GarageType = [_input,0,"",[""]] call BIS_fnc_param;
_SpawnType = [_input,1,"",[""]] call BIS_fnc_param;
_VehicleTyps = [_input,2,[""],[[]]] call BIS_fnc_param;
_GarageSide = [_input,3,[""],[[]]] call BIS_fnc_param;

if(!EMonkeys_HC_isActive) exitWith {["Garagen Information",["Es besteht keine Verbindung zur Datenbank","Kontaktiere einen Admin"],"#0090ff"] call EMonkeys_fnc_specialText;};
if(player != vehicle player) exitWith {["Garagen Information",["Sie müssen aus ihrem Fahrzeug aussteigen"],"#0090ff"] call EMonkeys_fnc_specialText;};
if(!(side player in _GarageSide)) exitWith {["Garagen Information",["Sie können hier nichts kaufen/mieten"],"#0090ff"] call EMonkeys_fnc_specialText;};

if(!(createDialog "EMonkeys_vehicle_garage")) exitWith {};

_display = findDisplay 21000;
_VehicleInfo = _display displayCtrl 1005;

//Setup VehicleList
_VehicleInfo ctrlSetStructuredText parseText "<t size = '0.95'>Fahrzeuge werden abgerufen</t>";
[[player,getPlayerUID player,playerSide,_GarageType],"TON_fnc_getVehicles",false,false] call EMonkeys_fnc_MP;

//SpawnPoints vorbereiten
_SpawnPoints = getArray (missionConfigFile >> "CfgVehicleSpawn" >> _SpawnType);
if(count _SpawnPoints < 1) then
{
	_markerPos = getMarkerPos _SpawnType;
	_markerDir = markerDir _SpawnType;
	_SpawnPoints = [[(AGLToASL _markerPos),_markerDir]];
};

EMonkeys_VehicleGarageSettings = [_VehicleTyps,_SpawnPoints,_GarageType];