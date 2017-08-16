#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopSelection.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Checks the weapon & adds the Preis tag.
*/
private ["_control","_index","_shop","_PreisTag","_Preis","_item","_itemArray","_bool"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_shop = uiNamespace getVariable ["Weapon_Shop",""];
if (isNull _control) exitWith {closeDialog 0;}; //Bad data
if (_index isEqualTo -1) exitWith {}; //Nothing selected

_PreisTag = CONTROL(38400,38404);

if ((uiNamespace getVariable ["Weapon_Shop_Filter",0]) isEqualTo 1) then {
    _item = CONTROL_DATAI(_control,_index);
    _itemArray = M_CONFIG(getArray,"WeaponShops",_shop,"items");
    _item = [_item,_itemArray] call TON_fnc_index;
    _Preis = ((_itemArray select _item) select 3);
    _PreisTag ctrlSetStructuredText parseText format ["<t size='0.8'>Preis: <t color='#8cff9b'>$%1</t></t>",[(_Preis)] call life_fnc_numberText];
    _control lbSetValue[_index,_Preis];
} else {
    _Preis = _control lbValue _index;
    _item = CONTROL_DATAI(_control,_index);
    if (_Preis > CASH) then {
        _PreisTag ctrlSetStructuredText parseText format ["<t size='0.8'>Preis: <t color='#ff0000'>$%1</t><br/>Dir fehlen: <t color='#8cff9b'>$%2</t></t>",[(_Preis)] call life_fnc_numberText,[(_Preis - CASH)] call life_fnc_numberText];
    } else {
        _PreisTag ctrlSetStructuredText parseText format ["<t size='0.8'>Preis: <t color='#8cff9b'>$%1</t></t>",[(_Preis)] call life_fnc_numberText];
    };
};
