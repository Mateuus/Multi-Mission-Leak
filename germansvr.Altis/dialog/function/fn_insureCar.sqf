#include "..\..\script_macros.hpp"
/*
 File: fn_insureCar.sqf
 Author: Guit0x "Lintox"
 Description:
 Insure a vehicle from the garage.
*/
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_assurPrice","_purchasePrice"];
disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;
if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if((time - life_action_delay) < 1.5) exitWith {hint localize "STR_NOTF_ActionDelay";};
if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};
_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"price");
switch (playerSide) do {
 case civilian: {
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
		_assurPrice = _purchasePrice * LIFE_SETTINGS(getNumber,"vehicle_insure_multiplier");
    };
    case west: {
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");
		_assurPrice = _purchasePrice * LIFE_SETTINGS(getNumber,"vehicle_insure_multiplier");
    };
    case independent: {
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");
		_assurPrice = _purchasePrice * LIFE_SETTINGS(getNumber,"vehicle_insure_multiplier");;
    };
    case east: {
        _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
		_assurPrice = _purchasePrice * LIFE_SETTINGS(getNumber,"vehicle_insure_multiplier");
    };
};
if(!(EQUAL(typeName _assurPrice,typeName 0)) OR _assurPrice < 1) then {_assurPrice = 1000};
if(BANK < _assurPrice) exitWith {hint format[localize "STR_Garage_CashError",[_assurPrice] call life_fnc_numberText];};
[_vid,_pid,_assurPrice,player,life_garage_type] remoteExecCall ["TON_fnc_insureCar",RSERV];
hint format[localize "STR_Assur_OK"],
SUB(BANK,_assurPrice);
life_action_delay = time;
closeDialog 0;