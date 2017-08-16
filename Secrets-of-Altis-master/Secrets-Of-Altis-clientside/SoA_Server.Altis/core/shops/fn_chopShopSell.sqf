/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck","Air"],50];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};
if(((_vehicle getVariable ["vehicle_info_owners",[[0,"Unbekannt"]]] select 0) select 0) == getplayerUID player) exitWith {hint "Du kannst dein eigenes Fahrzeug hier nicht verkaufen!";};
if((_vehicle getVariable ["versicherung","Keine"]) == "Vollkasko") exitWith {
	hint "Dieses Fahrzeug besitzt eine GPS-Alarmierung. Der Autoschieber will es nicht."
};

hint localize "STR_Shop_ChopShopSelling";
life_action_inUse = true;
_price2 = life_beatgeld + _price;

[_vehicle] call life_fnc_vehicleDeAnimate;

[player,_vehicle,_price,_price2] remoteExecCall ["SOA_fnc_chopShopSell",2];
[profilename,typeOf _vehicle,((_vehicle getVariable ["vehicle_info_owners",[[0,"Unbekannt"]]] select 0) select 1),4] remoteExecCall ["life_fnc_logdat",2];
closeDialog 0;