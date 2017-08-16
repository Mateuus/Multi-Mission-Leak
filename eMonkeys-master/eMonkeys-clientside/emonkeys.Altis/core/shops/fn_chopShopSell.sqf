/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
if(eM_action_inUse) exitWith {hint "Du kannst nur aller 10 Minuten ein Fahrzeug verkaufen!"};
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos EMonkeys_chopShop,["Car","Truck","Air"],8];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};

eM_action_inUse = true;
hint "Verkaufe Fahrzeug .. Bitte warten!";
_price2 = EMonkeys_c164 + _price;
[[player,_vehicle,_price,_price2],"TON_fnc_chopShopSell",false,false] call EMonkeys_fnc_MP;
closeDialog 0;

uisleep (3 * 60);
eM_action_inUse = false;