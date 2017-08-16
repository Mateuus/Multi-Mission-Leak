#include <macro.h>
/*
	File: fn_weaponShopMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Something
*/
private["_shopSide","_shopSide","_license","_itemInfo","_itemList","_license","_flag","_exit","_level","_message","_exit2","_args"];
_exit = false;
_exit2 = false;

_args = SEL(_this, 3);

switch (playerSide) do {
	case west: {
		if (EQUAL(_args, "")) then {
			switch(FETCH_CONST(life_coplevel)) do {
				case 1: {_args = "cop_anwaerter";};
				case 2: {_args = "cop_wachtmeister";};
				case 3: {_args = "cop_kommisar";};
				case 4: {_args = "cop_oberkommisar";};
				case 5: {_args = "cop_hauptkommisar";};
				case 6: {_args = "cop_bundespolizist";};
				case 7; case 8: {_args = "cop_polizeichef";};
			};
		};
	};

	case east: {
		if (EQUAL(_args, "")) then {
			switch(FETCH_CONST(life_ASFlevel)) do {
				case 1: {_args = "asf_private";};
				case 2: {_args = "asf_corporel";};
				case 3; case 4; case 5; case 6: {_args = "asf_leutnant";};
			};
		};
	};
};

_shopTitle = M_CONFIG(getText,"WeaponShops",_args,"name");
_shopSide = M_CONFIG(getText,"WeaponShops",_args,"side");
_license = M_CONFIG(getText,"WeaponShops",_args,"license");
_level = M_CONFIG(getNumber,"WeaponShops",_args,"level");
_message = M_CONFIG(getText,"WeaponShops",_args,"msg");

if(!(EQUAL(_license,""))) then {
	_flag = M_CONFIG(getText,"Licenses",_license,"side");
	if(!(LICENSE_VALUE(_license,_flag))) exitWith {hint localize "STR_Shop_Veh_NoLicense"; _exit = true;};
};
if(_exit) exitWith {};

_flag = switch(playerSide) do {case west: {"cop"}; case independent: {"med"}; case east: {"asf"}; default {"civ"};};
if(!(EQUAL(_flag,_shopSide))) exitWith {};
if(!(EQUAL(_level,-1))) then {
    _flag = switch(playerSide) do {case west: {(_level <= (FETCH_CONST(life_copLevel)))}; case independent: {(_level <= (FETCH_CONST(life_medicLevel)))}; default {true};};
    if(!_flag) then {_exit2 = true;};
};
if(_exit2) exitWith {hint _message;};

uiNamespace setVariable ["Weapon_Shop",_args];

if(!(createDialog "life_weapon_shop")) exitWith {};
if(!isClass(missionConfigFile >> "WeaponShops" >> _args)) exitWith {}; //Bad config entry.

disableSerialization;

ctrlSetText[38401,_shopTitle];

_filters = ((findDisplay 38400) displayCtrl 38402);
lbClear _filters;

_filters lbAdd localize "STR_Shop_Weapon_ShopInv";
_filters lbAdd localize "STR_Shop_Weapon_YourInv";

_filters lbSetCurSel 0;