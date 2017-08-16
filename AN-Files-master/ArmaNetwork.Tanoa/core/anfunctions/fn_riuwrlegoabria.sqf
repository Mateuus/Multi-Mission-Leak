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
_mode = param [0,-1,[0]];
_display = findDisplay 42125;
_shoppingCartList = _display displayCtrl 1500;
_shoppingCartAmount = _display displayCtrl 1004;
_totalPrice = _display displayCtrl 1010;
_cashOnHand = (_display displayCtrl 1007);
_arrayToAdd = [];
if(count life_shop_cart >= 20) exitWith {hintSilent "Your shopping cart is full!";};
switch(_mode) do {
  //Weapon List
  case 0: {
    if((lbCurSel 1501) isEqualTo -1) exitWith {hintSilent "You haven't selected a weapon!"};
    _className = lbData[1501,(lbCurSel 1501)];
    _wIndex = lbValue[1501,(lbCurSel 1501)];
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _arrayToAdd = [_className,_price];
    life_shop_cart pushBack _arrayToAdd;
    //
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _shoppingCartList lbAdd (_weaponInfo select 1);
    _shoppingCartList lbSetPicture [(lbSize _shoppingCartList)-1,(_weaponInfo select 2)];
    _shoppingCartList lbSetData [(lbSize _shoppingCartList)-1,_className];
    _shoppingCartList lbSetValue [(lbSize _shoppingCartList)-1,_price];
    _shoppingCartList lbSetCurSel 0;
    //
    life_shop_cartTotal = life_shop_cartTotal + _price;
    _totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
    _shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
    if(an_cash >= life_shop_cartTotal) then {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    } else {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    };
  };
  //WeaponShop - ammo
  case 1: {
    if((lbCurSel 1502) isEqualTo -1) exitWith {hintSilent "You haven't selected a magazine!"};
    _className = lbData[1502,(lbCurSel 1502)];
    _wIndex = lbValue[1502,(lbCurSel 1502)];
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _arrayToAdd = [_className,_price];
    life_shop_cart pushBack _arrayToAdd;
    //
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _shoppingCartList lbAdd (_weaponInfo select 1);
    _shoppingCartList lbSetPicture [(lbSize _shoppingCartList)-1,(_weaponInfo select 2)];
    _shoppingCartList lbSetData [(lbSize _shoppingCartList)-1,_className];
    _shoppingCartList lbSetValue [(lbSize _shoppingCartList)-1,_price];
    _shoppingCartList lbSetCurSel 0;
    //
    life_shop_cartTotal = life_shop_cartTotal + _price;
    _totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
    _shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
    if(an_cash >= life_shop_cartTotal) then {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    } else {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    };
  };
  case 2: {
    if((lbCurSel 1503) isEqualTo -1) exitWith {hintSilent "You haven't selected a magazine!"};
    _className = lbData[1503,(lbCurSel 1503)];
    _wIndex = lbValue[1503,(lbCurSel 1503)];
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _arrayToAdd = [_className,_price];
    life_shop_cart pushBack _arrayToAdd;
    //
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _shoppingCartList lbAdd (_weaponInfo select 1);
    _shoppingCartList lbSetPicture [(lbSize _shoppingCartList)-1,(_weaponInfo select 2)];
    _shoppingCartList lbSetData [(lbSize _shoppingCartList)-1,_className];
    _shoppingCartList lbSetValue [(lbSize _shoppingCartList)-1,_price];
    _shoppingCartList lbSetCurSel 0;
    //
    life_shop_cartTotal = life_shop_cartTotal + _price;
    _totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
    _shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
    if(an_cash >= life_shop_cartTotal) then {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    } else {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    };
  };
  case 3: {
    if((lbCurSel 1504) isEqualTo -1) exitWith {hintSilent "You haven't selected a weapon attachment!"};
    _className = lbData[1504,(lbCurSel 1504)];
    _wIndex = lbValue[1504,(lbCurSel 1504)];
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _arrayToAdd = [_className,_price];
    life_shop_cart pushBack _arrayToAdd;
    //
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _shoppingCartList lbAdd (_weaponInfo select 1);
    _shoppingCartList lbSetPicture [(lbSize _shoppingCartList)-1,(_weaponInfo select 2)];
    _shoppingCartList lbSetData [(lbSize _shoppingCartList)-1,_className];
    _shoppingCartList lbSetValue [(lbSize _shoppingCartList)-1,_price];
    _shoppingCartList lbSetCurSel 0;
    //
    life_shop_cartTotal = life_shop_cartTotal + _price;
    _totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
    _shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
    if(an_cash >= life_shop_cartTotal) then {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    } else {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    };
  };
  case 4: {
    if((lbCurSel 1505) isEqualTo -1) exitWith {hintSilent "You haven't selected a Sight!"};
    _className = lbData[1505,(lbCurSel 1505)];
    _wIndex = lbValue[1505,(lbCurSel 1505)];
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _arrayToAdd = [_className,_price];
    life_shop_cart pushBack _arrayToAdd;
    //
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _shoppingCartList lbAdd (_weaponInfo select 1);
    _shoppingCartList lbSetPicture [(lbSize _shoppingCartList)-1,(_weaponInfo select 2)];
    _shoppingCartList lbSetData [(lbSize _shoppingCartList)-1,_className];
    _shoppingCartList lbSetValue [(lbSize _shoppingCartList)-1,_price];
    _shoppingCartList lbSetCurSel 0;
    //
    life_shop_cartTotal = life_shop_cartTotal + _price;
    _totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
    _shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
    if(an_cash >= life_shop_cartTotal) then {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    } else {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    };
  };
  case 5: {
    if((lbCurSel 3000) isEqualTo -1) exitWith {hintSilent "You haven't selected Clothing!"};
    _className = lbData[3000,(lbCurSel 3000)];
    _wIndex = lbValue[3000,(lbCurSel 3000)];
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _arrayToAdd = [_className,_price];
    life_shop_cart pushBack _arrayToAdd;
    //
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _shoppingCartList lbAdd (_weaponInfo select 1);
    _shoppingCartList lbSetPicture [(lbSize _shoppingCartList)-1,(_weaponInfo select 2)];
    _shoppingCartList lbSetData [(lbSize _shoppingCartList)-1,_className];
    _shoppingCartList lbSetValue [(lbSize _shoppingCartList)-1,_price];
    _shoppingCartList lbSetCurSel 0;
    //
    life_shop_cartTotal = life_shop_cartTotal + _price;
    _totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
    _shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
    if(an_cash >= life_shop_cartTotal) then {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    } else {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    };
  };
  case 6: {
    if((lbCurSel 3003) isEqualTo -1) exitWith {hintSilent "You haven't selected Glasses!"};
    _className = lbData[3003,(lbCurSel 3003)];
    _wIndex = lbValue[3003,(lbCurSel 3003)];
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _arrayToAdd = [_className,_price];
    life_shop_cart pushBack _arrayToAdd;
    //
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _shoppingCartList lbAdd (_weaponInfo select 1);
    _shoppingCartList lbSetPicture [(lbSize _shoppingCartList)-1,(_weaponInfo select 2)];
    _shoppingCartList lbSetData [(lbSize _shoppingCartList)-1,_className];
    _shoppingCartList lbSetValue [(lbSize _shoppingCartList)-1,_price];
    _shoppingCartList lbSetCurSel 0;
    //
    life_shop_cartTotal = life_shop_cartTotal + _price;
    _totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
    _shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
    if(an_cash >= life_shop_cartTotal) then {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    } else {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    };
  };
  case 7: {
    if((lbCurSel 3006) isEqualTo -1) exitWith {hintSilent "You haven't selected Headgear!"};
    _className = lbData[3006,(lbCurSel 3006)];
    _wIndex = lbValue[3006,(lbCurSel 3006)];
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _arrayToAdd = [_className,_price];
    life_shop_cart pushBack _arrayToAdd;
    //
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _shoppingCartList lbAdd (_weaponInfo select 1);
    _shoppingCartList lbSetPicture [(lbSize _shoppingCartList)-1,(_weaponInfo select 2)];
    _shoppingCartList lbSetData [(lbSize _shoppingCartList)-1,_className];
    _shoppingCartList lbSetValue [(lbSize _shoppingCartList)-1,_price];
    _shoppingCartList lbSetCurSel 0;
    //
    life_shop_cartTotal = life_shop_cartTotal + _price;
    _totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
    _shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
    if(an_cash >= life_shop_cartTotal) then {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    } else {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    };
  };
  case 8: {
    if((lbCurSel 3009) isEqualTo -1) exitWith {hintSilent "You haven't selected a Vest!"};
    _className = lbData[3009,(lbCurSel 3009)];
    _wIndex = lbValue[3009,(lbCurSel 3009)];
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _arrayToAdd = [_className,_price];
    life_shop_cart pushBack _arrayToAdd;
    //
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _shoppingCartList lbAdd (_weaponInfo select 1);
    _shoppingCartList lbSetPicture [(lbSize _shoppingCartList)-1,(_weaponInfo select 2)];
    _shoppingCartList lbSetData [(lbSize _shoppingCartList)-1,_className];
    _shoppingCartList lbSetValue [(lbSize _shoppingCartList)-1,_price];
    _shoppingCartList lbSetCurSel 0;
    //
    life_shop_cartTotal = life_shop_cartTotal + _price;
    _totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
    _shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
    if(an_cash >= life_shop_cartTotal) then {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    } else {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    };
  };
  case 9: {
    if((lbCurSel 3012) isEqualTo -1) exitWith {hintSilent "You haven't selected a Backpack!"};
    _className = lbData[3012,(lbCurSel 3012)];
    _wIndex = lbValue[3012,(lbCurSel 3012)];
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _arrayToAdd = [_className,_price];
    life_shop_cart pushBack _arrayToAdd;
    //
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _shoppingCartList lbAdd (_weaponInfo select 1);
    _shoppingCartList lbSetPicture [(lbSize _shoppingCartList)-1,(_weaponInfo select 2)];
    _shoppingCartList lbSetData [(lbSize _shoppingCartList)-1,_className];
    _shoppingCartList lbSetValue [(lbSize _shoppingCartList)-1,_price];
    _shoppingCartList lbSetCurSel 0;
    //
    life_shop_cartTotal = life_shop_cartTotal + _price;
    _totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
    _shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
    if(an_cash >= life_shop_cartTotal) then {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    } else {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    };
  };
  case 10: {
    if((lbCurSel 4001) isEqualTo -1) exitWith {hintSilent "You haven't selected a Magazine!"};
    _className = lbData[4001,(lbCurSel 4001)];
    _wIndex = lbValue[4001,(lbCurSel 4001)];
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _arrayToAdd = [_className,_price];
    life_shop_cart pushBack _arrayToAdd;
    //
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _shoppingCartList lbAdd (_weaponInfo select 1);
    _shoppingCartList lbSetPicture [(lbSize _shoppingCartList)-1,(_weaponInfo select 2)];
    _shoppingCartList lbSetData [(lbSize _shoppingCartList)-1,_className];
    _shoppingCartList lbSetValue [(lbSize _shoppingCartList)-1,_price];
    _shoppingCartList lbSetCurSel 0;
    //
    life_shop_cartTotal = life_shop_cartTotal + _price;
    _totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
    _shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
    if(an_cash >= life_shop_cartTotal) then {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    } else {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    };
  };
  case 11: {
    if((lbCurSel 4004) isEqualTo -1) exitWith {hintSilent "You haven't selected an Explosive!"};
    _className = lbData[4004,(lbCurSel 4004)];
    _wIndex = lbValue[4004,(lbCurSel 4004)];
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _arrayToAdd = [_className,_price];
    life_shop_cart pushBack _arrayToAdd;
    //
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _shoppingCartList lbAdd (_weaponInfo select 1);
    _shoppingCartList lbSetPicture [(lbSize _shoppingCartList)-1,(_weaponInfo select 2)];
    _shoppingCartList lbSetData [(lbSize _shoppingCartList)-1,_className];
    _shoppingCartList lbSetValue [(lbSize _shoppingCartList)-1,_price];
    _shoppingCartList lbSetCurSel 0;
    //
    life_shop_cartTotal = life_shop_cartTotal + _price;
    _totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
    _shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
    if(an_cash >= life_shop_cartTotal) then {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    } else {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    };
  };
  case 12: {
    if((lbCurSel 4007) isEqualTo -1) exitWith {hintSilent "You haven't selected an Attachment!"};
    _className = lbData[4007,(lbCurSel 4007)];
    _wIndex = lbValue[4007,(lbCurSel 4007)];
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _arrayToAdd = [_className,_price];
    life_shop_cart pushBack _arrayToAdd;
    //
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _shoppingCartList lbAdd (_weaponInfo select 1);
    _shoppingCartList lbSetPicture [(lbSize _shoppingCartList)-1,(_weaponInfo select 2)];
    _shoppingCartList lbSetData [(lbSize _shoppingCartList)-1,_className];
    _shoppingCartList lbSetValue [(lbSize _shoppingCartList)-1,_price];
    _shoppingCartList lbSetCurSel 0;
    //
    life_shop_cartTotal = life_shop_cartTotal + _price;
    _totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
    _shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
    if(an_cash >= life_shop_cartTotal) then {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    } else {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    };
  };
  case 13: {
    if((lbCurSel 4010) isEqualTo -1) exitWith {hintSilent "You haven't selected an Item!"};
    _className = lbData[4010,(lbCurSel 4010)];
    _wIndex = lbValue[4010,(lbCurSel 4010)];
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _arrayToAdd = [_className,_price];
    life_shop_cart pushBack _arrayToAdd;
    //
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _shoppingCartList lbAdd (_weaponInfo select 1);
    _shoppingCartList lbSetPicture [(lbSize _shoppingCartList)-1,(_weaponInfo select 2)];
    _shoppingCartList lbSetData [(lbSize _shoppingCartList)-1,_className];
    _shoppingCartList lbSetValue [(lbSize _shoppingCartList)-1,_price];
    _shoppingCartList lbSetCurSel 0;
    //
    life_shop_cartTotal = life_shop_cartTotal + _price;
    _totalPrice ctrlSetText format ["Total Amount: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
    _shoppingCartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
    if(an_cash >= life_shop_cartTotal) then {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    } else {
    	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
    };
  };
  default {};
};
