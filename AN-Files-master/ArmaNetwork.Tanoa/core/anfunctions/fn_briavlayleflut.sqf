/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
disableSerialization;
_display = findDisplay 42125;
_shoppingCartList = _display displayCtrl 1500;
_shoppingCartAmount = _display displayCtrl 1004;
_totalPrice = _display displayCtrl 1010;
_cashOnHand = _display displayCtrl 1007;
_arrayToFind = [];
_className = lbData[1500,(lbCurSel 1500)];
_wIndex = lbValue[1500,(lbCurSel 1500)];
//systemChat format ["%1",_wIndex];
_arrayToFind = [_className,_wIndex];
lbDelete[1500,(lbCurSel 1500)];

_index = life_shop_cart find _arrayToFind;
life_shop_cart deleteAt _index;

life_shop_cartTotal = life_shop_cartTotal - _wIndex;
_totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
_shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
if(an_cash >= life_shop_cartTotal) then {
  _cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
} else {
  _cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
};
