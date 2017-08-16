/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_switchVehColorShop.sqf
	Server: e-Monkeys.com
    
    Description: Close the Vehicle Shop
*/
0 cutText ["","BLACK OUT",2];
EMonkeys_EscRoundCam = true;
closeDialog 0;
uisleep 2;

deleteVehicle EMonkeys_vehicleInShop;

EMonkeys_VehicleShopCam cameraEffect ["terminate","back"];
camDestroy EMonkeys_VehicleShopCam;
[] call EMonkeys_fnc_updateViewDistance;
player allowDamage true;
0 cutText ["","BLACK IN",2];

//Delete all Variable's
EMonkeys_VehicleShopCam = nil;
EMonkeys_vehicleInShop = nil;
EMonkeys_VehicleShopSettings = nil;
EMonkeys_ZoomOldVehicleShop = nil;
EMonkeys_ShopInUse = false;