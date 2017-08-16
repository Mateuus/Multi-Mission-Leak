/*
  ArmA.Network
  Rathbone
  Opens Clothing Menu
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private [];
disableSerialization;
if(isNull (findDisplay 42125)) then {createDialog "generalshop";};
[1] call life_fnc_wrietriugledro;
_shopFlag = life_shopInfo_array select 0;
_shopType = life_shopInfo_array select 2;
_dialog = findDisplay 42125;
_weaponList = (_dialog displayCtrl 1501);
_cartAmount = (_dialog displayCtrl 1004);
_cartTotal = (_dialog displayCtrl 1010);
_cashOnHand = (_display displayCtrl 1007);
_shopFlagD = (_dialog displayCtrl 1001);
_weaponBtn = (_dialog displayCtrl 2402);
_itemsBtn = (_dialog displayCtrl 2404);
_clothingBtn = (_dialog displayCtrl 2401);
_accBtn = (_dialog displayCtrl 2403);

_cartList = _dialog displayCtrl 1500;
_backPackList = _dialog displayCtrl 3012;
_vestList = _dialog displayCtrl 3009;
_hatList = _dialog displayCtrl 3006;
_glassesList = _dialog displayCtrl 3003;
_clothingList = _dialog displayCtrl 3000;

_clothingBtn ctrlEnable false;
if((life_shopInfo_array select 1) isEqualTo "") then {_weaponBtn ctrlEnable false;} else {_weaponBtn ctrlEnable true;_weaponBtn buttonSetAction "call life_fnc_priegoukouchlu";};
if((life_shopInfo_array select 3) isEqualTo "") then {_itemsBtn ctrlEnable false;} else {_itemsBtn ctrlEnable true;_itemsBtn buttonSetAction "call life_fnc_flacoestlugieg";};
if((life_shopInfo_array select 4) isEqualTo "") then {_accBtn ctrlEnable false;} else {_accBtn ctrlEnable true;};

_cartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
_cartTotal ctrlSetText format ["Total Price: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
_shopFlagD ctrlSetText format ["%1 - Clothing Shop",_shopFlag];
if(an_cash >= life_shop_cartTotal) then {
  _cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
} else {
  _cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
};

if(!isClass (missionConfigFile >> "CfgShops" >> "clothing" >> _shopType)) exitWith { diag_log format ["Shop %1 has no config entry!",_shopType]; closeDialog 0;};

_clothingArray = getArray (missionConfigFile >> "CfgShops" >> "clothing" >> _shopType >> "clothing");
_glassesArray = getArray (missionConfigFile >> "CfgShops" >> "clothing" >> _shopType >> "glasses");
_hatsArray = getArray (missionConfigFile >> "CfgShops" >> "clothing" >> _shopType >> "hats");
_vestsArray = getArray (missionConfigFile >> "CfgShops" >> "clothing" >> _shopType >> "vests");
_backPackArray = getArray (missionConfigFile >> "CfgShops" >> "clothing" >> _shopType >> "backpacks");

//lbClear _cartList;
lbClear _backPackList;
lbClear _vestList;
lbClear _hatList;
lbClear _glassesList;
lbClear _clothingList;
/*
if(count life_shop_cart > 0) then {
  {
    _className = _x select 0;
    _price = getNumber (missionConfigFile >> "CfgShop" >> _className >> "price" >> str (playerSide));
    _weaponInfo = [_className] call life_fnc_thagawrepru;
    _cartList lbAdd (_weaponInfo select 1);
    _cartList lbSetPicture [(lbSize _cartList)-1,(_weaponInfo select 2)];
    _cartList lbSetData [(lbSize _cartList)-1,_className];
    _cartList lbSetValue [(lbSize _cartList)-1,_price];
    _cartList lbSetCurSel 0;
  } forEach (life_shop_cart);
};
*/
if(count _clothingArray isEqualTo 0) then {
  _clothingList lbAdd "No Clothing Found";
  _clothingList lbSetCurSel -1;
  _clothingList ctrlEnable false;
} else {
  _clothingList ctrlEnable true;
  {
    _className = _x;
  	if(isClass (missionConfigFile >> "CfgShop" >> _className)) then {
  		private ["_requirement"];
  		_requirement = getText(missionConfigFile >> "CfgShop" >> _className >> "requirement" >> str (playerSide));
  		if(_requirement isEqualTo "") then {
  			_requirement = compile "true";
  		} else {
  			_requirement = compile _requirement;
  		};
  		if(call _requirement) then {
  			_clothingInfo = [_className] call life_fnc_thagawrepru;
  			_clothingList lbAdd (_clothingInfo select 1);
  			_clothingList lbSetPicture [(lbSize _clothingList)-1,(_clothingInfo select 2)];
  			_clothingList lbSetData [(lbSize _clothingList)-1,_className];
  			_clothingList lbSetValue [(lbSize _clothingList)-1,_ForEachIndex];
  			_clothingList lbSetCurSel -1;
  		};
  	} else {
  		diag_log format ["%1",_className];
  	};
  } forEach (_clothingArray);
};

if(count _glassesArray isEqualTo 0) then {
  _glassesList lbAdd "No Glasses Found";
  _glassesList lbSetCurSel -1;
  _glassesList ctrlEnable false;
} else {
  _glassesList ctrlEnable true;
  {
    _className = _x;
  	if(isClass (missionConfigFile >> "CfgShop" >> _className)) then {
  		private ["_requirement"];
  		_requirement = getText(missionConfigFile >> "CfgShop" >> _className >> "requirement" >> str (playerSide));
  		if(_requirement isEqualTo "") then {
  			_requirement = compile "true";
  		} else {
  			_requirement = compile _requirement;
  		};
  		if(call _requirement) then {
  			_glassesInfo = [_className] call life_fnc_thagawrepru;
  			_glassesList lbAdd (_glassesInfo select 1);
  			_glassesList lbSetPicture [(lbSize _glassesList)-1,(_glassesInfo select 2)];
  			_glassesList lbSetData [(lbSize _glassesList)-1,_className];
  			_glassesList lbSetValue [(lbSize _glassesList)-1,_ForEachIndex];
  			_glassesList lbSetCurSel -1;
  		};
  	} else {
  		diag_log format ["%1",_className];
  	};
  } forEach (_glassesArray);
};

if(count _hatsArray isEqualTo 0) then {
  _hatList lbAdd "No hats Found";
  _hatList lbSetCurSel -1;
  _hatList ctrlEnable false;
} else {
  _hatList ctrlEnable true;
  {
    _className = _x;
  	if(isClass (missionConfigFile >> "CfgShop" >> _className)) then {
  		private ["_requirement"];
  		_requirement = getText(missionConfigFile >> "CfgShop" >> _className >> "requirement" >> str (playerSide));
  		if(_requirement isEqualTo "") then {
  			_requirement = compile "true";
  		} else {
  			_requirement = compile _requirement;
  		};
  		if(call _requirement) then {
  			_hatsInfo = [_className] call life_fnc_thagawrepru;
  			_hatList lbAdd (_hatsInfo select 1);
  			_hatList lbSetPicture [(lbSize _hatList)-1,(_hatsInfo select 2)];
  			_hatList lbSetData [(lbSize _hatList)-1,_className];
  			_hatList lbSetValue [(lbSize _hatList)-1,_ForEachIndex];
  			_hatList lbSetCurSel -1;
  		};
  	} else {
  		diag_log format ["%1",_className];
  	};
  } forEach (_hatsArray);
};

if(count _vestsArray isEqualTo 0) then {
  _vestList lbAdd "No Vests Found";
  _vestList lbSetCurSel -1;
  _vestList ctrlEnable false;
} else {
  _vestList ctrlEnable true;
  {
    _className = _x;
  	if(isClass (missionConfigFile >> "CfgShop" >> _className)) then {
  		private ["_requirement"];
  		_requirement = getText(missionConfigFile >> "CfgShop" >> _className >> "requirement" >> str (playerSide));
  		if(_requirement isEqualTo "") then {
  			_requirement = compile "true";
  		} else {
  			_requirement = compile _requirement;
  		};
  		if(call _requirement) then {
  			_vestsInfo = [_className] call life_fnc_thagawrepru;
  			_vestList lbAdd (_vestsInfo select 1);
  			_vestList lbSetPicture [(lbSize _vestList)-1,(_vestsInfo select 2)];
  			_vestList lbSetData [(lbSize _vestList)-1,_className];
  			_vestList lbSetValue [(lbSize _vestList)-1,_ForEachIndex];
  			_vestList lbSetCurSel -1;
  		};
  	} else {
  		diag_log format ["%1",_className];
  	};
  } forEach (_vestsArray);
};

if(count _backPackArray isEqualTo 0) then {
  _backPackList lbAdd "No Backpacks Found";
  _backPackList lbSetCurSel -1;
  _backPackList ctrlEnable false;
} else {
  _backPackList ctrlEnable true;
  {
    _className = _x;
  	if(isClass (missionConfigFile >> "CfgShop" >> _className)) then {
  		private ["_requirement"];
  		_requirement = getText(missionConfigFile >> "CfgShop" >> _className >> "requirement" >> str (playerSide));
  		if(_requirement isEqualTo "") then {
  			_requirement = compile "true";
  		} else {
  			_requirement = compile _requirement;
  		};
  		if(call _requirement) then {
  			_backpackInfo = [_className] call life_fnc_thagawrepru;
  			_backPackList lbAdd (_backpackInfo select 1);
  			_backPackList lbSetPicture [(lbSize _backPackList)-1,(_backpackInfo select 2)];
  			_backPackList lbSetData [(lbSize _backPackList)-1,_className];
  			_backPackList lbSetValue [(lbSize _backPackList)-1,_ForEachIndex];
  			_backPackList lbSetCurSel -1;
  		};
  	} else {
  		diag_log format ["%1",_className];
  	};
  } forEach (_backPackArray);
};
