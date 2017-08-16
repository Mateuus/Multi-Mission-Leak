/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_VehicleShopMenu.sqf
	Server: e-Monkeys.com

    Description: Create and Setup Vehicle Shop
*/
private["_ShopType","_SpawnType","_ShopSide","_boxType","_massage","_ShopLicense","_ShopCondition","_closeShop","_SpawnPoints","_display","_VehicleList","_Shop","_ShopVehicles","_ColorCfg","_vehCompresion","_vehAllowed","_markerPos","_markerDir"];
_input = _this select 3;
_ShopType = [_input,0,"",[""]] call BIS_fnc_param;
_SpawnType = [_input,1,"",[""]] call BIS_fnc_param;
_ShopSide = [_input,2,[""],[[]]] call BIS_fnc_param;
_boxType = ["Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"];
_closeShop = false;
_vehAllowed = false;
_SpawnPoints = [];

_position = getArray(missionConfigFile >> "CfgVehicleShopPosition" >> "vehicleShopSpawn");
_positionDir = getArray(missionConfigFile >> "CfgVehicleShopPosition" >> "vehicleShopDir") select 0;
_Shop = missionConfigFile >> "CfgVehicleShop" >> _ShopType;
_ShopLicense = getText(_Shop >> "license");
_ShopCondition = getText(_Shop >> "condition");

if(isNil "EMonkeys_ShopInUse") then {EMonkeys_ShopInUse = false};
if(EMonkeys_ShopInUse) exitWith {};
if(!EMonkeys_HC_isActive) exitWith {["Händler Information",["Es besteht keine Verbindung zur Datenbank","Kontaktiere einen Admin"],"#0090ff"] call EMonkeys_fnc_specialText;};
if(player != vehicle player) exitWith {["Händler Information",["Sie müssen aus ihrem Fahrzeug aussteigen"],"#0090ff"] call EMonkeys_fnc_specialText;};
if(!(side player in _ShopSide)) then {_massage = "Sie können hier nichts kaufen/mieten"; _closeShop = true;};

//Abfrage von Lizenzen
if(!(_ShopLicense isEqualTo "")) then
{
	_ShopLicenseC = compile _ShopLicense;
	if (!(call _ShopLicenseC)) then
	{
		_massage = format["Sie benötigen eine(n) ""%1""",[_ShopLicense] call EMonkeys_fnc_varToStr];
		_closeShop = true;
	};
};

//Abfrage von Bedingungen
if(!(_ShopCondition isEqualTo "")) then
{
	_ShopCondition = compile _ShopCondition;
	if (!(call _ShopCondition)) then
	{
		_massage = "Sie können hier nichts kaufen/mieten";
		_closeShop = true;
	};
};
if(_closeShop) exitWith {["Händler Information",[_massage],"#0090ff"] call EMonkeys_fnc_specialText};

//SpawnPoints vorbereiten
_SpawnPoints = getArray (missionConfigFile >> "CfgVehicleSpawn" >> _SpawnType);
if(count _SpawnPoints < 1) then
{
	_markerPos = getMarkerPos _SpawnType;
	_markerDir = markerDir _SpawnType;
	_SpawnPoints = [[(AGLToASL _markerPos),_markerDir]];
};

//Camera erstellen
EMonkeys_ShopInUse = true;
0 cutText ["","BLACK OUT",2];
uisleep 3;
player allowDamage false;

setViewDistance 1;
EMonkeys_VehicleShopCam = "camera" camCreate [(_position select 0) + 30,(_position select 1),15];
EMonkeys_VehicleShopCam cameraEffect ["internal","back"];
EMonkeys_VehicleShopCam camSetTarget [(_position select 0),(_position select 1),1];
[EMonkeys_VehicleShopCam, _position, 15, 30, 0.5, false] execFSM "core\fsm\cam_round.fsm";
camUseNVG false;
showCinemaBorder false;

0 cutText ["","BLACK IN",3];

createDialog "EMonkeys_vehicle_shop";
disableSerialization;
_display = findDisplay 20000;
_ShopTitel = _display displayCtrl 0900;
_display displaySetEventHandler ["keyDown","_this call EMonkeys_fnc_displayHandler"];

//Set Titel
_ShopName = getText (_Shop >> "name");
_ShopTitel ctrlSetStructuredText parseText format["<t color='#FFFFFF' size='2' align='center' shadow='0'>%1</t>",_ShopName];

//Setup Vehiclelist
_VehicleList = _display displayCtrl 1000;
_ShopVehicles = getArray (_Shop >> "vehicles");
_ColorCfg = getText (_Shop >> "color");
{
	_vehCompresion = _x select 3;
	if(_vehCompresion != "") then
	{
		_vehCompresion = compile _vehCompresion;
		if (call _vehCompresion) then
		{
			_vehAllowed = true;
		}else{
			_vehAllowed = false;
		};
	}else{
		_vehAllowed = true;
	};
	if(_vehAllowed) then
	{
		_vehClass = _x select 0;
		_vehPrice = _x select 1;
		_vehInfos = [_vehClass] call EMonkeys_fnc_fetchVehInfo;
	
		_vehicle = _VehicleList lbAdd (_vehInfos select 3);
		if(!(_vehClass in _boxType)) then {_VehicleList lbSetPicture [_vehicle, (_vehInfos select 2)];};
		_VehicleList lbSetData [_vehicle, _vehClass];
		_VehicleList lbSetValue [_vehicle, _ForEachIndex];
	};
}foreach _ShopVehicles;

//Setup Vehicle
EMonkeys_vehicleInShop = "Land_VR_Target_MRAP_01_F" createVehiclelocal _position;
EMonkeys_vehicleInShop setPosATL _position;
EMonkeys_vehicleInShop setDir _positionDir;
EMonkeys_vehicleInShop allowDamage false;

//Vehicle Shop Settings
EMonkeys_VehicleShopSettings = [_ShopType,_SpawnPoints,_ColorCfg];