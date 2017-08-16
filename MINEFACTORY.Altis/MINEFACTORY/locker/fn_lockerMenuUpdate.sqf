/*
    Filename:
        core\locker\fn_lockerMenuUpdate.sqf
        
    Author:
        Vincent H. || AGPHeaddikilla || Yoghurt/Yogurette
    
    Description:
        Updates the most parts of the Locker Menu...
        
    Parameters:
        -
        
    License:
        MIT License
        Copyright (c) 2016 Vincent Heins (http://www.allgameplay.de/)

        Permission is hereby granted, free of charge, to any person obtaining a copy
        of this software and associated documentation files (the "Software"), to deal
        in the Software without restriction, including without limitation the rights
        to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        copies of the Software, and to permit persons to whom the Software is
        furnished to do so, subject to the following conditions:

        The above copyright notice and this permission notice shall be included in all
        copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        SOFTWARE.
*/

#include "..\..\script_macros.hpp"
disableSerialization;

if (isNil "locker_inventory") then { locker_inventory = []; };
_index = -1;

_dialog = (findDisplay 4000);
_ListPlayerInventory = _dialog displayCtrl 4001;
_ListLockerInventory = _dialog displayCtrl 4002;
_ComboLockers = _dialog displayCtrl 4008;

if ((lbCurSel _ComboLockers) == -1) exitWith { hint "Es ist kein Schließfach ausgewählt."; }; 

{
    if ((_x select 0) == parseNumber (_ComboLockers lbData (lbCurSel _ComboLockers))) exitWith {
        _index = _forEachIndex;
    };
} forEach locker_inventory;

if (_index == -1) exitWith { hint "Dieses Schließfach gehört nicht zu dir?"; };

if (isNull _dialog) exitWith {};

lbClear _ListPlayerInventory;
lbClear _ListLockerInventory;

ctrlEnable [4003, false];
ctrlEnable [4004, false];

{
    _amount = ITEM_VALUE(configName _x);
    if(_amount > 0) then {
        _text = getText (_x >> "displayName");
        _text = if ((isLocalized _text)) then { localize _text; } else { _text; };
        _ListPlayerInventory lbAdd format["%1x %2", _amount, _text];
        _ListPlayerInventory lbSetData [((lbSize _ListPlayerInventory) - 1), format["%1", (configName _x)]];
    };
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

{
    _name = _x select 0;
    _amount = _x select 1;
    
    if (_amount > 0) then {
        _text = getText (missionConfigFile >> "VirtualItems" >> _name >> "displayName");
        _text = if (isLocalized _text) then { localize _text; } else { _text; };
        _ListLockerInventory lbAdd format["%1x %2", _amount, _text];
        _ListLockerInventory lbSetData [((lbSize _ListLockerInventory) - 1), format["%1", _name]];
    };
} forEach ((locker_inventory select _index) select 1);

ctrlEnable [4003, true];
ctrlEnable [4004, true];
