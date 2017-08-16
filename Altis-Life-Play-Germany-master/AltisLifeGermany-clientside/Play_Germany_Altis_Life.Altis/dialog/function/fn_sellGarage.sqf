#include <macro.h>
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by: RafiQuak for PlayGermany
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_sellPrice"];
disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = steamid;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_action = [
	"Achtung, willst du dein Fahrzeug wirklich verkaufen?",
	"ACHTUNG",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;

if(_action) then {

	_sellPrice = switch(playerSide) do {
		case civilian: {SEL(M_CONFIG(getArray,CONFIG_VEHICLES,_vehicle,"garageSell"),0)};
		case west: {0};
		case independent: {0};
		case east: {0};
	};
	
	if(!(EQUAL(typeName _sellPrice,typeName 0)) OR _sellPrice < 0) then {_sellPrice = 1000};
	[[_vid,_pid,_sellPrice,player,life_garage_type],"TON_fnc_vehicleDelete",false,false] call life_fnc_MP;
	hint format[localize "STR_Garage_SoldCar",[_sellPrice] call life_fnc_numberText];
	ADD(BANK,_sellPrice);
};
closeDialog 0;