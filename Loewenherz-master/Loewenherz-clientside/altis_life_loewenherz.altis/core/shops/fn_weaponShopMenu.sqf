/*
	File: fn_weaponShopMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Something
*/
private["_config","_itemInfo","_itemList","_shop"];
uiNamespace setVariable ["Weapon_Shop",_this select 3];
_shop = _this select 3;

disableSerialization;
if(!(createDialog "lhm_weapon_shop")) exitwith {};

switch (_shop) do
{
	case "cop":
	{
		_config = [_shop] call lhm_fnc_copweaponShopCfg;
	};
	case "secstore":
	{
		_config = [_shop] call lhm_fnc_secweaponShopCfg;
	};
	default
	{
		_config = [_shop] call lhm_fnc_weaponShopCfg;
	};
};

if(typeName _config == "STRING") exitWith {hint _config; closeDialog 0;};

ctrlSetText[38401,_config select 0];

_filters = ((findDisplay 38400) displayCtrl 38402);
lbClear _filters;

_filters lbAdd localize "STR_Shop_Weapon_ShopInv";
_filters lbAdd localize "STR_Shop_Weapon_YourInv";

_filters lbSetCurSel 0;