#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopFilter.sqf
    Author: Bryan "Tonic" Boardwine
    Edit: Added level checks - BoGuu

    Description:
    Applies the filter selected and changes the list.
*/

private _index = (lbCurSel 38402);
private _shop = uiNamespace getVariable ["Weapon_Shop",""];

if (_index isEqualTo -1 || {_shop isEqualTo ""}) exitWith {systemChat "Bad Data Filter"; closeDialog 0;}; //Bad data passing.

uiNamespace setVariable ["Weapon_Shop_Filter",_index];
//Setup List Control & Purge it.

private _priceTag = ((findDisplay 38400) displayCtrl 38404);
_priceTag ctrlSetStructuredText parseText "";

private _itemList = ((findDisplay 38400) displayCtrl 38403);
lbClear _itemList;

private "_config";
switch (_index) do {
    case 0:
		{
            _config = M_CONFIG(getArray, "WeaponShops", _shop, "items"); {
                _bool = [_x] call life_fnc_levelCheck;
                if (_bool) then {
                    _itemInfo = [_x select 0] call life_fnc_fetchCfgDetails;
                    _itemList lbAdd format["%1",
                        if (!((_x select 1) isEqualTo "")) then {
                            _x select 1
                        } else {
                            _itemInfo select 1
                        }];
                    _itemList lbSetData[(lbSize _itemList) - 1, _itemInfo select 0];
                    _itemList lbSetPicture[(lbSize _itemList) - 1, _itemInfo select 2];
                    _itemList lbSetValue[(lbSize _itemList) - 1, _x select 2];
                };
                true
            }
            count _config;

            ((findDisplay 38400) displayCtrl 38405) ctrlSetText localize "STR_Global_Buy";
        };

    case 1:
		{
            private["_listedItems"];
            _config = [];
            _listedItems = [];
            //Go through weapons
            if (primaryWeapon player != "") then {
                _config pushBack primaryWeapon player;
            };
            if (secondaryWeapon player != "") then {
                _config pushBack secondaryWeapon player;
            };
            if (handgunWeapon player != "") then {
                _config pushBack handgunWeapon player;
            };

            //Go through items
            _config = _config + primaryWeaponItems player;
            _config = _config + (assignedItems player);
            _config = _config + (uniformItems player);
            _config = _config + (vestItems player);
            _config = _config + (backPackItems player);

            ((findDisplay 38400) displayCtrl 38405) ctrlSetText localize "STR_Global_Sell"; {
                if (!(_x in _listedItems) && _x != "") then {
                    _itemInfo = [_x] call life_fnc_fetchCfgDetails;
                    _listedItems pushBack _x;

                    _itemCount = {
                        _x isEqualTo (_itemInfo select 0)
                    }
                    count _config;
                    if (_itemCount > 1) then {
                        _itemList lbAdd format["[%2] %1", _itemInfo select 1, _itemCount];
                    }
                    else {
                        _itemList lbAdd format["%1", _itemInfo select 1];
                    };
                    _itemList lbSetData[(lbSize _itemList) - 1, _itemInfo select 0];
                    _itemList lbSetPicture[(lbSize _itemList) - 1, _itemInfo select 2];
                };
            }
            foreach _config;
        };
};

((findDisplay 38400) displayCtrl 38403) lbSetCurSel 0;