#include <macro.h>
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sells a vehicle from the garage.
*/

private ["_vehicle","_vid","_pid","_unit","_action","_price","__GETC__"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection";titletext[localize "STR_Global_NoSelection","Plain"];};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(lhm_action_inUse) exitWith {Hint "You can't sell it now";titletext["You can't sell it now","Plain"]; };
_action = [
	"Wollen Sie wirklich dieses Fahrzeug verkaufen?",
	"LOEWENHERZ BESTÄTIGUNG",
	"JA",
	"NEIN"
] call BIS_fnc_guiMessage;

if(_action) then {
	lhm_action_inUse = true;

	if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error";titletext[localize "STR_Garage_Selection_Error","Plain"];};

	[] spawn {
		sleep 60;
		lhm_action_inUse = false;
	};

	_price = [_vehicle,__GETC__(lhm_garage_sell)] call TON_fnc_index;
	if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(lhm_garage_sell) select _price) select 1;};

	[[_vid,_pid,_price,player,lhm_garage_type],"TON_fnc_vehicleDelete",false,false] call lhm_fnc_mp;
	hint format[localize "STR_Garage_SoldCar",[_price] call lhm_fnc_numberText];
	lhm_atmcash = lhm_atmcash + _price;
	[1] call SOCK_fnc_updatePartial;
	closeDialog 0;

	[] spawn {
		sleep 10;
		lhm_action_inUse = false;
	};

};