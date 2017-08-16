/*
    Filename:
        core\locker\fn_lockerInsertItem.sqf
        
    Author:
        Vincent H. || AGPHeaddikilla || Yoghurt/Yogurette
    
    Description:
        Inserts a item into the Locker. Removes the item from player Inventory.
        
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

_dialog = (findDisplay 4000);
_ListPlayerInventory = _dialog displayCtrl 4001;
_ComboLockers = _dialog displayCtrl 4008;

_lockIndex = -1;
if ((lbCurSel _ComboLockers) == -1) exitWith { hint "Es ist kein Schließfach ausgewählt."; }; 

{
    if ((_x select 0) == parseNumber (_ComboLockers lbData (lbCurSel _ComboLockers))) exitWith {
        _lockIndex = _forEachIndex;
    };
} forEach locker_inventory;

if (_lockIndex == -1) exitWith { hint "Dieses Schließfach gehört nicht zu dir?"; };


_index = lbCurSel _ListPlayerInventory;
if (_index == -1) exitWith { hint "Du hast kein Item ausgewählt!"; };

_variable = _ListPlayerInventory lbData _index;
if (isNil "_variable") exitWith {};

ctrlEnable [4003, false];
ctrlEnable [4004, false];

if (ITEM_VALUE(_variable) <= 0) exitWith { hint "Du besitzt dieses Item überhaupt nicht..."; ctrlEnable [4003, true]; };

_currentWeight = 0;
{
    _currentWeight = _currentWeight + (_x select 1);
} forEach ((locker_inventory select _lockIndex) select 1);

if ((_currentWeight + 1) > locker_maxWeight) exitWith { hint "Du hast nicht genügend Platz in deinem Schließfach!"; ctrlEnable [4003, true]; };

_finished = false;
{
    if ((_x select 0) == _variable) exitWith {
        ((locker_inventory select _lockIndex) select 1) set [_forEachIndex, [_variable, ((((locker_inventory select _lockIndex) select 1) select _forEachIndex) select 1) + 1]];
        _finished = true;
    };
} forEach ((locker_inventory select _lockIndex) select 1);

if (!_finished) then {
    ((locker_inventory select _lockIndex) select 1) pushBack [_variable, 1];
};

if (!([false, _variable, 1] call life_fnc_handleInv)) exitWith { ctrlEnable [4003, true]; };

_id = ((locker_inventory select _lockIndex) select 0);

[_id, ((locker_inventory select _lockIndex) select 1)] remoteExec ["slocker_fnc_lockerUpdateInventory", 2];

[] call locker_fnc_lockerMenuUpdate;

ctrlEnable [4003, true];
ctrlEnable [4004, true];
