#include "..\..\script_macros.hpp"

private ["_vehToScrap","_prohibitedVehicles"];
//Vehicle to scrap
_vehToScrap = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_prohibitedVehicles = ["B_Truck_01_ammo_F","B_G_Offroad_01_armed_F"];
_vehicleClass = typeOf _vehToScrap;

//Something fucked up
if(isNull _vehToScrap) exitWith {}; 

//Cant sell certain stuff
if (_vehicleClass isKindOf "Air") exitWith {hint "You cannot scrap air vehicles. Do not destroy this vehicle!"};
if (_vehicleClass in _prohibitedVehicles) exitWith {hint "This vehicle is not allowed to be crushed. Do not destroy this vehicle!"};

//Just incase
if ((player distance (getMarkerPos "scrapyard") < 30 ) || (player distance (getMarkerPos "scrapyard_1") < 30 ) || (player distance (getMarkerPos "scrapyard_2") < 30 )) then 
{
	_price = 15000 + (floor random 25000); //Base price for now, change later
	_price2 = CASH + _price;
	[player,_vehToScrap,_price,_price2,2] remoteExecCall ["TON_fnc_chopShopSell",RSERV];
	closeDialog 0;

	} else {

	hint "You are not near a scrapyard!";	
};