/*
	fn_populateSalesCredit.sqf
	Pennyworth
*/

disableSerialization;

waitUntil {!isNull (findDisplay 2700)};
_display = findDisplay 2700;
_salesman = _display displayCtrl 2701;
lbClear _salesman;
_purchaseButton = _display displayCtrl 2702;
_purchaseButton buttonSetAction "";

_salesman lbAdd "No one - Vehicle is full price";

{
	_salesman lbAdd format["%1 - Vehicle is 10%2 off",name _x,"%"];
	_salesman lbSetData [_foreachIndex+1,str(_x)];
} foreach carSalesmanList;

_purchaseButton buttonSetAction "[] spawn life_fnc_customVehicleShopBuy";