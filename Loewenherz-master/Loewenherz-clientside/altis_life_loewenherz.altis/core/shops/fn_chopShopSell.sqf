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
_nearVehicles = nearestObjects [getMarkerPos lhm_chopShop,["Car","Truck"],25];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};

hint localize "STR_Shop_ChopShopSelling";
closeDialog 0;

////////////////////Anti Dupe by Teebaron///////////////////////////
private ["_upp","_ui","_progress","_pgText","_cP"];
_vehicle setVariable ["lhm_chopShop_antiDupe",(name player), true];

_upp = "Bereite Fahrzeug zum Verkauf vor";
disableSerialization;
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNameSpace getVariable "lhm_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{
	sleep 0.5;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3  (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if((_vehicle getVariable "lhm_chopShop_antiDupe") != (name player)) exitWith {closeDialog 0;titletext["ANTI DUPE, netter Versuch ;D","PLAIN"];_cP = 0};
	if(player distance _vehicle > 20) exitWith {Hint "Bleibe beim Fahrzeug";_cP = 0};
	if(vehicle player != player) exitWith {Hint "Das geht nicht in einem Fahrzeug"};
	if(!alive player) exitWith {};
};
5 cutText ["","PLAIN"];
if(_cP < 1) exitWith {systemChat "Verkauf abgebrochen"}; //Fehler beim Verkaufen! Ende!
///////////////////////////////////////////////////////

lhm_action_inUse = true;
_price2 = lhm_cash + _price;
[[player,_vehicle,_price,_price2],"TON_fnc_chopShopSell",false,false] call lhm_fnc_mp;
