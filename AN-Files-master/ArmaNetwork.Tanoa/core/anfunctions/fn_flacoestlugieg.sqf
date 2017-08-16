/*
  ArmA.Network
  Rathbone
  Opens Accessories Menu
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private [];
disableSerialization;
if(isNull (findDisplay 42125)) then {createDialog "generalshop";};
[2] call life_fnc_wrietriugledro;
_shopFlag = life_shopInfo_array select 0;
_shopType = life_shopInfo_array select 3;
_dialog = findDisplay 42125;
_cartAmount = (_dialog displayCtrl 1004);
_cartTotal = (_dialog displayCtrl 1010);
_shopFlagD = (_dialog displayCtrl 1001);
_cashOnHand = (_display displayCtrl 1007);
_magazineList = _dialog displayCtrl 4001;
_explosiveList = _dialog displayCtrl 4004;
_attachmentList = _dialog displayCtrl 4007;
_itemList = _dialog displayCtrl 4010;
_weaponBtn = (_dialog displayCtrl 2402);
_itemsBtn = (_dialog displayCtrl 2404);
_clothingBtn = (_dialog displayCtrl 2401);
_accBtn = (_dialog displayCtrl 2403);
_itemsBtn ctrlEnable false;
if((life_shopInfo_array select 1) isEqualTo "") then {_weaponBtn ctrlEnable false;} else {_weaponBtn ctrlEnable true;_weaponBtn buttonSetAction "call life_fnc_priegoukouchlu";};
if((life_shopInfo_array select 2) isEqualTo "") then {_clothingBtn ctrlEnable false;} else {_clothingBtn ctrlEnable true;_clothingBtn buttonSetAction "call life_fnc_spluwrluchoaph";};
if((life_shopInfo_array select 4) isEqualTo "") then {_accBtn ctrlEnable false;} else {_accBtn ctrlEnable true;};
_cartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
_cartTotal ctrlSetText format ["Total Price: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
_shopFlagD ctrlSetText format ["%1 - Accessories Shop",_shopFlag];
if(an_cash >= life_shop_cartTotal) then {
  _cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
} else {
  _cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
};
if(!isClass (missionConfigFile >> "CfgShops" >> "accessories" >> _shopType)) exitWith { diag_log format ["Shop %1 has no config entry!",_shopType]; closeDialog 0;};
_magazinesArray = getArray (missionConfigFile >> "CfgShops" >> "accessories" >> _shopType >> "magazines");
_explosivesArray = getArray (missionConfigFile >> "CfgShops" >> "accessories" >> _shopType >> "explosives");
_attachmentsArray = getArray (missionConfigFile >> "CfgShops" >> "accessories" >> _shopType >> "attachments");
_itemsArray = getArray (missionConfigFile >> "CfgShops" >> "accessories" >> _shopType >> "items");
lbClear _magazineList;
lbClear _explosiveList;
lbClear _attachmentList;
lbClear _itemList;
if(count _magazinesArray isEqualTo 0) then {
  _magazineList lbAdd "No Magazines Found";
  _magazineList lbSetCurSel -1;
  _magazineList ctrlEnable false;
} else {
  _magazineList ctrlEnable true;
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
  			_magazineInfo = [_className] call life_fnc_thagawrepru;
  			_magazineList lbAdd (_magazineInfo select 1);
  			_magazineList lbSetPicture [(lbSize _magazineList)-1,(_magazineInfo select 2)];
  			_magazineList lbSetData [(lbSize _magazineList)-1,_className];
  			_magazineList lbSetValue [(lbSize _magazineList)-1,_ForEachIndex];
  			_magazineList lbSetCurSel -1;
  		};
  	} else {
  		diag_log format ["%1",_className];
  	};
  } forEach (_magazinesArray);
};
if(count _explosivesArray isEqualTo 0) then {
  _explosiveList lbAdd "No Explosives Found";
  _explosiveList lbSetCurSel -1;
  _explosiveList ctrlEnable false;
} else {
  _explosiveList ctrlEnable true;
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
  			_explosiveInfo = [_className] call life_fnc_thagawrepru;
  			_explosiveList lbAdd (_explosiveInfo select 1);
  			_explosiveList lbSetPicture [(lbSize _explosiveList)-1,(_explosiveInfo select 2)];
  			_explosiveList lbSetData [(lbSize _explosiveList)-1,_className];
  			_explosiveList lbSetValue [(lbSize _explosiveList)-1,_ForEachIndex];
  			_explosiveList lbSetCurSel -1;
  		};
  	} else {
  		diag_log format ["%1",_className];
  	};
  } forEach (_explosivesArray);
};
if(count _attachmentsArray isEqualTo 0) then {
  _attachmentList lbAdd "No Attachments Found";
  _attachmentList lbSetCurSel -1;
  _attachmentList ctrlEnable false;
} else {
  _attachmentList ctrlEnable true;
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
  			_attachmentInfo = [_className] call life_fnc_thagawrepru;
  			_attachmentList lbAdd (_attachmentInfo select 1);
  			_attachmentList lbSetPicture [(lbSize _attachmentList)-1,(_attachmentInfo select 2)];
  			_attachmentList lbSetData [(lbSize _attachmentList)-1,_className];
  			_attachmentList lbSetValue [(lbSize _attachmentList)-1,_ForEachIndex];
  			_attachmentList lbSetCurSel -1;
  		};
  	} else {
  		diag_log format ["%1",_className];
  	};
  } forEach (_attachmentsArray);
};
if(count _itemsArray isEqualTo 0) then {
  _itemList lbAdd "No Items Found";
  _itemList lbSetCurSel -1;
  _itemList ctrlEnable false;
} else {
  _itemList ctrlEnable true;
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
  			_itemInfo = [_className] call life_fnc_thagawrepru;
  			_itemList lbAdd (_itemInfo select 1);
  			_itemList lbSetPicture [(lbSize _itemList)-1,(_itemInfo select 2)];
  			_itemList lbSetData [(lbSize _itemList)-1,_className];
  			_itemList lbSetValue [(lbSize _itemList)-1,_ForEachIndex];
  			_itemList lbSetCurSel -1;
  		};
  	} else {
  		diag_log format ["%1",_className];
  	};
  } forEach (_itemsArray);
};
