#include <macro.h>
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_price","_action"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;

_action = [
	"Möchtest du dieses Fahrzeug wirklich verkaufen?",
	"Fahrzeug verkaufen",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;


if!(_action) exitWith {};
if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_price = [_vehicle,playerside] call life_fnc_classPrices;
if(_price == -1) then {_price = 1000} else {_price = _price/2};

[_vid,_pid,_price,player,life_garage_type] remoteExecCall ["SOA_fnc_vehicleDelete",2];
hint format[localize "STR_Garage_SoldCar",[_price] call life_fnc_numberText];
life_beatbankgeld = life_beatbankgeld + _price;

closedialog 0;