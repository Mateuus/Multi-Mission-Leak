/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_params = (_this select 3);
_shopSide = _params param [0,sideUnknown,[civilian]];
_shopFlag = _params param [1,"",[""]];
_shopWeapon = _params param [2,"",[""]];
_shopClothing = _params param [3,"",[""]];
_shopItems = _params param [4,"",[""]];
_shopAcc = _params param [5,"",[""]];
disableSerialization;
if(!alive player || {dialog}) exitWith {};
if(_shopSide isEqualTo sideUnknown && {playerSide != _shopSide}) exitWith {systemChat "Not authorized to access this shop!";};
if(!createDialog "shop_landingpage") exitWith {};
life_shopInfo_array = [];
life_shopInfo_array = [_shopFlag,_shopWeapon,_shopClothing,_shopItems,_shopAcc];
life_shop_cart = [];
life_shop_cartTotal = 0;
_display = findDisplay 42123;
_ctrlText = _display displayCtrl 1100;
_weaponBtn = _display displayCtrl 2405;
_clothingBtn = _display displayCtrl 2406;
_accBtn = _display displayCtrl 2407;
_itemsBtn = _display displayCtrl 2410;//unused

if((diag_tickTime - life_combat_lastTick) < 30) then {
  _ctrlText ctrlSetStructuredText parseText format ["<t size='2' align='center'>%1 Main Menu</t><br/><br/><t size='1.2' align='center'>You currently aren't able to access the shops due to being in combat</t>",_shopFlag];
  _weaponBtn ctrlEnable false;
  _clothingBtn ctrlEnable false;
  _accBtn ctrlEnable false;
  _itemsBtn ctrlEnable false;
} else {
  _ctrlText ctrlSetStructuredText parseText format ["<t size='2' align='center'>%1 Main Menu</t><br/><br/><t size='1.2' align='center'>Select an option from below to continue!</t><br/><br/>",_shopFlag];
  if(_shopWeapon isEqualTo "") then {_weaponBtn ctrlEnable false;} else {_weaponBtn ctrlEnable true;};
  if(_shopClothing isEqualTo "") then {_clothingBtn ctrlEnable false;} else {_clothingBtn ctrlEnable true;};
  if(_shopItems isEqualTo "") then {_accBtn ctrlEnable false;} else {_accBtn ctrlEnable true;};
  _itemsBtn ctrlEnable false;
};
