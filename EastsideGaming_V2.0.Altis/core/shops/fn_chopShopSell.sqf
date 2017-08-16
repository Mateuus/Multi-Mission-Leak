#include "..\..\script_macros.hpp"
/*
    File: fn_chopShopSell.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sells the selected vehicle off.
*/
disableSerialization;
private ["_control","_price","_vehicle","_nearVehicles","_price2","_chopable"];
_control = CONTROL(39400,39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format ["%1", _vehicle];
_chopable = LIFE_SETTINGS(getArray,"chopShop_vehicles");
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,_chopable,25];
_vehicle = (_nearVehicles select _vehicle);
if (isNull _vehicle) exitWith {};

hint localize "STR_Shop_ChopShopSelling";
life_action_inUse = true;
_price2 = CASH + _price;
[0] call SOCK_fnc_updatePartial;


[player,_vehicle,_price,_price2] remoteExecCall ["TON_fnc_chopShopSell",RSERV];
_log = format["%1 (%2) hat %3 für %4$ verkauft [CHOP SHOP].", player getVariable["realname", name player], getPlayerUID player, str(_vehicle), [_price]call life_fnc_numberText];
["VEHICLE_SELL_LOG", _log] remoteExecCall ["ESG_fnc_logging", 2];
closeDialog 0;