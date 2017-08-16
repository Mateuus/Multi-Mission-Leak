/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_switchVehicleShop.sqf
	Server: e-Monkeys.com
    
    Description: Change selected vehicle in the Shop
*/
private["_boxType","_display","_VehicleList","_VehicleInfo","_VehicleColorList","_BuyButton","_RentButton","_selectedVeh","_vehClass","_vehListIndex","_selectedVehInfo","_ShopVehicles","_pricerent","_pricebuy","_colorArray","_colorArrayCount","_colorName","_colorCtrl","_vehicleDLC","_playerDLC","_DLCid","_DLCname"];
disableSerialization;

//Display Variabeln
_display = findDisplay 20000;
_VehicleList = _display displayCtrl 1000;
_VehicleInfo = _display displayCtrl 1005;
_VehicleColorList = _display displayCtrl 1100;
_BuyCtrl = _display displayCtrl 1010;
_RentCtrl = _display displayCtrl 1015;
_BuyButton = _display displayCtrl 1201;
_RentButton = _display displayCtrl 1202;

_selectedVeh = lbCurSel _VehicleList;
_vehClass = _VehicleList lbData _selectedVeh;
_vehListIndex = _VehicleList lbValue _selectedVeh;
_BuyCtrl ctrlShow false;
_boxType = ["Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"];

//Create Vehicle local
deleteVehicle EMonkeys_vehicleInShop;

_position = getArray(missionConfigFile >> "CfgVehicleShopPosition" >> "vehicleShopSpawn");
_positionDir = getArray(missionConfigFile >> "CfgVehicleShopPosition" >> "vehicleShopDir") select 0;
waitUntil {isNull EMonkeys_vehicleInShop};
EMonkeys_vehicleInShop = _vehClass createVehiclelocal _position;
EMonkeys_vehicleInShop setPosATL _position;
EMonkeys_vehicleInShop setDir _positionDir;
EMonkeys_vehicleInShop allowDamage false;

//Animate Vehicle
switch(EMonkeys_VehicleShopSettings select 2) do
{
	case "cop": {if(_vehClass == "C_Offroad_01_F") then {[EMonkeys_vehicleInShop,"cop_offroad",true] spawn EMonkeys_fnc_vehicleAnimate}};
	case "civ": {
					if(_vehClass == "B_Heli_Light_01_F") then {[EMonkeys_vehicleInShop,"civ_littlebird",true] spawn EMonkeys_fnc_vehicleAnimate};
					if(_vehClass == "C_Offroad_01_F") then {[EMonkeys_vehicleInShop,"civ_offroad",true] spawn EMonkeys_fnc_vehicleAnimate};
				};
	case "reb": {if(_vehClass in ["B_G_Offroad_01_F","B_G_Offroad_01_armed_F"]) then {[EMonkeys_vehicleInShop,"rebel_offroad",true] spawn EMonkeys_fnc_vehicleAnimate}};
	case "med": {if(_vehClass == "C_Offroad_01_F") then {[EMonkeys_vehicleInShop,"med_offroad",true] spawn EMonkeys_fnc_vehicleAnimate}};
};

//Check DLC's
_vehicleDLC = getText (configfile >> "CfgVehicles" >> _vehClass >> "DLC");
_DLCid = getNumber (configfile >> "CfgMods" >> _vehicleDLC >> "appId");
_DLCname = getText (configfile >> "CfgMods" >> _vehicleDLC >> "name");
_playerDLC = getDLCs 1;


//Change Vehicle Infos
_selectedVehInfo = [_vehClass] call EMonkeys_fnc_fetchVehInfo;
_trunkSpace = getNumber (missionConfigFile >> "CfgVehicles" >> _vehClass >> "trunkWeight");
_fuelSpace = getNumber (missionConfigFile >> "CfgVehicles" >> _vehClass >> "fuelCapicity");
_fuelType = getText (missionConfigFile >> "CfgVehicles" >> _vehClass >> "fuel");
_fuelTypeN = getText (missionConfigFile >> "cfgFuelstationSys" >> "fuelnames" >> _fuelType >> "name");
_ShopVehicles = getArray (missionConfigFile >> "CfgVehicleShop" >> (EMonkeys_VehicleShopSettings select 0) >> "vehicles");

if(!(_vehClass in _boxType)) then
{
	_VehicleInfo ctrlSetStructuredText parseText format[
	"<t size='1' font='PuristaSemiBold'>Höchstgeschwindigkeit: %1 km/h<br/>Pferdestärken: %2<br/>Sitzplätze: %3<br/>Ladekapazität: %4<br/>Treibstoff: %5<br/>Tankgröße: %6 L<br/>Panzerung: %7<br/>Benötigt DLC: %8</t>",
	_selectedVehInfo select 8,
	_selectedVehInfo select 11,
	(_selectedVehInfo select 10) + 1,
	if(_trunkSpace == -1) then {"0"} else {_trunkSpace},
	_fuelTypeN,
	_fuelSpace,
	_selectedVehInfo select 9,
	if(_DLCname == "") then {"Kein"} else {_DLCname}
	];
}else{
	_VehicleInfo ctrlSetStructuredText parseText format[
	"<t size = '1' font='PuristaSemiBold'>Ladekapazität: %1<br/>Panzerung: %2</t>",
	if(_trunkSpace == -1) then {"0"} else {_trunkSpace},
	_selectedVehInfo select 9
	];
};

//Change Prices
_pricerent = [(_ShopVehicles select _vehListIndex),1,1,[0]] call bis_fnc_param;
_pricebuy = [(_ShopVehicles select _vehListIndex),2,1,[0]] call bis_fnc_param;

_BuyCtrl ctrlShow true;
_BuyCtrl ctrlSetStructuredText parseText format["<t size = '1' color='#8cff9b' font='PuristaSemiBold'>%1</t>",if(_pricebuy isEqualTo -1)then{"---------------"}else{([_pricebuy]call EMonkeys_fnc_numberText)+"€"}];

_RentCtrl ctrlSetStructuredText parseText format["<t size = '1' color='#8cff9b' font='PuristaSemiBold'>%1€</t>",[_pricerent]call EMonkeys_fnc_numberText];

//Setup Color List
lbClear _VehicleColorList;

_colorArray = "true" configClasses (missionConfigFile >> "CfgVehicleColor" >> _vehClass);
{
	if(getText(_x >> "type") == (EMonkeys_VehicleShopSettings select 2)) then
	{
		_colorName = getText(_x >> "name");
		_colorCtrl = _VehicleColorList lbAdd _colorName;
		_VehicleColorList lbSetValue [_colorCtrl,parseNumber (ConfigName _x)];
	};
}foreach _colorArray;

_VehicleColorList lbSetCurSel 0;
[EMonkeys_vehicleInShop,(_VehicleColorList lbValue 0)] call EMonkeys_fnc_colorVehicle;


if(_DLCid != 0 && !(_DLCid in _playerDLC)) then
{
	_BuyButton ctrlEnable false;
	_BuyButton ctrlSetTooltip format["Du benötigst ein DLC: %1",_DLCname];
	_BuyButton ctrlSetEventHandler ["ButtonClick", ""];
	_RentButton ctrlEnable false;
	_RentButton ctrlSetTooltip format["Du benötigst ein DLC: %1",_DLCname];
	_RentButton ctrlSetEventHandler ["ButtonClick", ""];
}
else
{
	//Setup Buy Button
	if(_pricebuy isEqualTo -1) then
	{
		_BuyButton ctrlEnable false;
		_BuyButton ctrlSetTooltip "Das Fahrzeug ist nicht Kaufbar";
	} else {
		_BuyButton ctrlEnable true;
		_BuyButton ctrlSetTooltip format["%1 kaufen für %2€", (_selectedVehInfo select 3), [_pricebuy]call EMonkeys_fnc_numberText];
		_BuyButton ctrlSetEventHandler ["ButtonClick", "[0] spawn Emonkeys_fnc_VehicleShopBuy"];
	};

	//Setup Rent Button
	_RentButton ctrlSetTooltip format["%1 mieten für %2€", (_selectedVehInfo select 3), [_pricerent]call EMonkeys_fnc_numberText];
	_RentButton ctrlSetEventHandler ["ButtonClick", "[1] spawn Emonkeys_fnc_VehicleShopBuy"];
};