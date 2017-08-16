#include <macro.h>
/*
	File: fn_clothingFilter.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Functionality for filtering clothing types in the menu.
*/
disableSerialization;
private ["_control", "_selection", "_list", "_filter", "_priceMultiply", "_itemText"];
_control = _this select 0;
_selection = _this select 1;
life_clothing_filter = _selection;

if(_selection == 4) then
{
	life_shop_cam camSetTarget (player modelToWorld [0,-.15,1.3]);
	life_shop_cam camSetPos (player modelToWorld [1,-4,2]);
	life_shop_cam camCommit 1;
}
	else
{
	life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
	life_shop_cam camSetPos (player modelToWorld [1,4,2]);
	life_shop_cam camCommit 1;
};

if(isNull (findDisplay 3100)) exitWith {};
_list = (findDisplay 3100) displayCtrl 3101;
lbClear _filter;
lbClear _list;

//Temp code, subjected to become one master config in future
_clothes = switch (life_clothing_store) do
{
	case "bruce": {[_selection] call life_fnc_clothing_bruce;};
	case "cop": {[_selection] call life_fnc_clothing_cop;};
  case "sru": {[_selection] call life_fnc_clothing_sru;};
	case "cop_safe": {[_selection] call life_fnc_clothing_cop_safe;};
	case "cop_training": {[_selection] call life_fnc_clothing_cop_training;};
	case "cop_air": {[_selection] call life_fnc_clothing_cop_air;};
	case "reb": {[_selection] call life_fnc_clothing_reb;};
	case "advreb": {[_selection] call life_fnc_clothing_advreb;};
	case "dive": {[_selection] call life_fnc_clothing_dive;};
	case "kart": {[_selection] call life_fnc_clothing_kart;};
	case "bounty": {[_selection] call life_fnc_clothing_bounty;};
	case "jet": {[_selection] call life_fnc_clothing_jet;};
	case "heli": {[_selection] call life_fnc_clothing_heli;};
	case "mil": {[_selection] call life_fnc_clothing_mil;};
	case "mil_air": {[_selection] call life_fnc_clothing_mil_air;};
	case "hato": {[_selection] call life_fnc_clothing_hato;};
	case "medic": {[_selection] call life_fnc_clothing_medic;};
	case "press": {[_selection] call life_fnc_clothing_press;};
	case "taxi": {[_selection] call life_fnc_clothing_taxi;};
};

if(count _clothes == 0) exitWith {};

_priceMultiply = 1;

if(__GETC__(GTA_donatorLevel) > 0) then
{
	_priceMultiply = 0.5;
};

{
	_details = [_x select 0] call life_fnc_fetchCfgDetails;

	if (isNil {_x select 1}) then {
		_itemText = getText (configFile >> (_details select 6) >> (_x select 0) >> "DisplayName");
	} else {
		_itemText = format ["%1", _x select 1];
	};

	//--- Add uniform, vest and backpack virtual inventory container max weight to name
	if (([_x select 0] call BIS_fnc_itemType) select 1 in ["Uniform", "Vest", "Backpack"]) then {
		_itemText = _itemText + format [" (%1)", [_x select 0] call GTA_fnc_virtualInventoryContainerMaxLoad];
	};

	_list lbAdd _itemText;

	_pic = getText(configFile >> (_details select 6) >> (_x select 0) >> "picture");
	_list lbSetData [(lbSize _list)-1,_x select 0];
	_list lbSetValue [(lbSize _list)-1,((_x select 2) * _priceMultiply)];
	_list lbSetPicture [(lbSize _list)-1,_pic];
} foreach _clothes;
