/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_switchVehColorShop.sqf
	Server: e-Monkeys.com
    
    Description: Buy or Rent the selected Vehicle with selected Color
*/
private["_vehicleCfg","_price","_typeBuy","_display","_VehicleColorList","_selectedColor","_selectedVeh","_vehListIndex","_colorCfg","_ShopVehicles","_uid","_finalPrice"];
disableSerialization;
_typeBuy = [_this,0,1,[0]] call bis_fnc_param;

_display = findDisplay 20000;
_VehicleColorList = _display displayCtrl 1100;
_VehicleList = _display displayCtrl 1000;

_selectedVeh = lbCurSel _VehicleList;
_selectedColor = lbCurSel _VehicleColorList;
_vehicleClass = _VehicleList lbData _selectedVeh;
_vehListIndex = _VehicleList lbValue _selectedVeh;
_colorClass = _VehicleColorList lbValue _selectedColor;

_ShopVehicles = getArray (missionConfigFile >> "CfgVehicleShop" >> (EMonkeys_VehicleShopSettings select 0) >> "vehicles");
_vehInfos = [_vehicleClass] call EMonkeys_fnc_fetchVehInfo;
_pricerent = (_ShopVehicles select _vehListIndex) select 1;
_pricebuy = (_ShopVehicles select _vehListIndex) select 2;
_uid = getPlayerUID player;

0 cutText ["","BLACK OUT",1];
EMonkeys_EscRoundCam = true;
closeDialog 0;
uisleep 2;

deleteVehicle EMonkeys_vehicleInShop;
[] call EMonkeys_fnc_updateViewDistance;
EMonkeys_VehicleShopCam cameraEffect ["terminate","back"];
camDestroy EMonkeys_VehicleShopCam;
player allowDamage true;

//Check HC Connected
if(!EMonkeys_HC_isActive) exitWith
{
	0 cutText ["","BLACK IN",1];
	["Händler Information",["Transfer abgebrochen","Es besteht keine Verbindung zur Datenbank","Kontaktiere einen Admin"],"#0090ff"] call EMonkeys_fnc_specialText;
	
	EMonkeys_VehicleShopCam = nil;
	EMonkeys_vehicleInShop = nil;
	EMonkeys_VehicleShopSettings = nil;
	EMonkeys_ZoomOldVehicleShop = nil;
	EMonkeys_ShopInUse = false;
};

//Buy or Rent Vehicle
switch (_typeBuy) do
{
	case 0: 
	{	
		if(EMonkeys_c164 < _pricebuy) then 
		{
			0 cutText ["","BLACK IN",1];
			["Händler Information",["Transfer abgebrochen","Du hast nicht genug Geld dabei"],"#0090ff"] call EMonkeys_fnc_specialText;
		}
		else
		{
			[[player,_uid,_vehicleClass,_colorClass,_pricebuy,(EMonkeys_VehicleShopSettings select 1),0],"TON_fnc_buyVehicle",false,false] call EMonkeys_fnc_mp;
			["",["Einen Moment...",format["dein(e) %1 wird gerade vorbereitet...",_vehInfos select 3]],"","#81c800",5] call EMonkeys_fnc_specialText;
		};
	};
	case 1:
	{
		if(EMonkeys_c164 < _pricerent) then 
		{
			0 cutText ["","BLACK IN",1];
			["Händler Information",["Transfer abgebrochen","Du hast nicht genug Geld dabei"],"#0090ff"] call EMonkeys_fnc_specialText;
		}
		else
		{
			[[player,_uid,_vehicleClass,_colorClass,_pricerent,(EMonkeys_VehicleShopSettings select 1),1],"TON_fnc_buyVehicle",false,false] call EMonkeys_fnc_mp;
			["",["Einen Moment...",format["dein(e) %1 wird gerade vorbereitet...",_vehInfos select 3]],"","#81c800",5] call EMonkeys_fnc_specialText;
		};
	};
};

//Delete all Variable's
EMonkeys_VehicleShopCam = nil;
EMonkeys_vehicleInShop = nil;
EMonkeys_VehicleShopSettings = nil;
EMonkeys_ZoomOldVehicleShop = nil;
EMonkeys_ShopInUse = false;