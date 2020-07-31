/*
	File: fn_chopShopSell.sqf
	
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Motorbike","Motorcycle","Truck"],25];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};

[localize "STR_Shop_ChopShopSelling", false] spawn domsg;
life_action_inUse = true;
_price2 = cash_in_hand + _price;
[player,_vehicle,_price,_price2] remoteExecCall ["TON_fnc_chopShopSell",(call life_fnc_HCC)];
closeDialog 0;