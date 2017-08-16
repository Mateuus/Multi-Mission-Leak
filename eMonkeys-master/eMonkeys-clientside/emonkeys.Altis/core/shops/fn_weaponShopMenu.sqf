/*
	File: fn_weaponShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something
*/
private["_config","_itemInfo","_itemList"];
uiNamespace setVariable ["Weapon_Shop",_this select 3];

disableSerialization;
if(!(createDialog "EMonkeys_weapon_shop")) exitwith {};

_config = [_this select 3] call EMonkeys_fnc_weaponShopCfg;
if(typeName _config == "STRING") exitWith 
{
	closeDialog 0;
	if (_config == "gruppen_fail") then 
	{
		["Nicht Freigeschaltet",["Deine Gruppierung hat diesen Shop","noch nicht freigeschaltet"],"#FF0000"] call EMonkeys_fnc_specialText;
	}else{
		["Händler Information",["Du kannst hier nichts kaufen.",_config],"#0090ff"] call EMonkeys_fnc_specialText;
	};
};

ctrlSetText[38401,_config select 0];

_filters = ((findDisplay 38400) displayCtrl 38402);
lbClear _filters;

_filters lbAdd "Shop Inventar";
_filters lbAdd "Dein Inventar";

_filters lbSetCurSel 0;