/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private [];
disableSerialization;
if(isNull (findDisplay 42125)) then {createDialog "generalshop";};
[0] call life_fnc_wrietriugledro;
_shopFlag = life_shopInfo_array select 0;
_shopType = life_shopInfo_array select 1;
_dialog = findDisplay 42125;
_weaponList = (_dialog displayCtrl 1501);
_cartAmount = (_dialog displayCtrl 1004);
_cashOnHand = (_display displayCtrl 1007);
_cartTotal = (_dialog displayCtrl 1010);
_shopFlagD = (_dialog displayCtrl 1001);
_weaponBtn = (_dialog displayCtrl 2402);
_itemsBtn = (_dialog displayCtrl 2404);
_clothingBtn = (_dialog displayCtrl 2401);
_accBtn = (_dialog displayCtrl 2403);
_weaponBtn ctrlEnable false;
if((life_shopInfo_array select 2) isEqualTo "") then {_clothingBtn ctrlEnable false;} else {_clothingBtn ctrlEnable true;_clothingBtn buttonSetAction "call life_fnc_spluwrluchoaph";};
if((life_shopInfo_array select 3) isEqualTo "") then {_itemsBtn ctrlEnable false;} else {_itemsBtn ctrlEnable true;_itemsBtn buttonSetAction "call life_fnc_flacoestlugieg";};
if((life_shopInfo_array select 4) isEqualTo "") then {_accBtn ctrlEnable false;} else {_accBtn ctrlEnable true;};
lbClear _weaponList;
if(!isClass (missionConfigFile >> "CfgShops" >> "weapons" >> _shopType)) exitWith { diag_log format ["Shop %1 has no config entry!",_shopType]; closeDialog 0;};
_weaponArray = getArray (missionConfigFile >> "CfgShops" >> "weapons" >> _shopType >> "weapons");
{
	_className = _x;
	if(isClass (configFile >> "CfgWeapons" >> _className)) then {
		private ["_requirement"];
		_requirement = getText(missionConfigFile >> "CfgShop" >> _className >> "requirement" >> str (playerSide));
		if(_requirement isEqualTo "") then {
			_requirement = compile "true";
		} else {
			_requirement = compile _requirement;
		};
		if(call _requirement) then {
			_weaponInfo = [_className] call life_fnc_thagawrepru;
			_weaponList lbAdd "";
			_weaponList lbSetPicture [(lbSize _weaponList)-1,(_weaponInfo select 2)];
			_weaponList lbSetData [(lbSize _weaponList)-1,_className];
			_weaponList lbSetValue [(lbSize _weaponList)-1,_ForEachIndex];
			_weaponList lbSetCurSel 0;
		};
	} else {
		diag_log format ["%1",_className];
	};
} forEach (_weaponArray);
_cartAmount ctrlSetText format ["%1/20",[(count life_shop_cart)] call life_fnc_rupadudejat];
_cartTotal ctrlSetText format ["Total Price: $%1",[life_shop_cartTotal] call life_fnc_rupadudejat];
_shopFlagD ctrlSetText format ["%1 - Weapon Shop",_shopFlag];
if(an_cash >= life_shop_cartTotal) then {
	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#1CD300'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
} else {
	_cashOnHand ctrlSetStructuredText parseText format ["Cash on Hand: <t color='#C20900'>$%1</t>",[an_cash] call life_fnc_rupadudejat];
};
