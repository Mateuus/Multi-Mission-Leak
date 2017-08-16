/*
    Filename:
        core\locker\fn_lockerTakeItem.sqf
        
    Author:
        Vincent H. || AGPHeaddikilla || Yoghurt/Yogurette
    
    Description:
        Use to be to take the Item out of the Locker Inventory.
        
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

disableSerialization;

_dialog = (findDisplay 4000);
_ListLockerInventory = _dialog displayCtrl 4002;
_ComboLockers = _dialog displayCtrl 4008;

_lockIndex = -1;
if ((lbCurSel _ComboLockers) == -1) exitWith { hint "Es ist kein Schließfach ausgewählt."; }; 

{
    if ((_x select 0) == parseNumber (_ComboLockers lbData (lbCurSel _ComboLockers))) exitWith {
        _lockIndex = _forEachIndex;
    };
} forEach locker_inventory;

if (_lockIndex == -1) exitWith { hint "Dieses Schließfach gehört nicht zu dir?"; };

_index = lbCurSel _ListLockerInventory;
if (_index == -1) exitWith { hint "Du hast kein Item ausgewählt!"; };

_variable = _ListLockerInventory lbData _index;
if (isNil "_variable") exitWith {};

ctrlEnable [4003, false];
ctrlEnable [4004, false];

_finished = false;

{
    if ((_x select 0) == _variable) exitWith {
        if ((_x select 1) > 0) then {
            ((locker_inventory select _lockIndex) select 1) set [_forEachIndex, [_variable, ((((locker_inventory select _lockIndex) select 1) select _forEachIndex) select 1) - 1]];
            _finished = true;
        };
    };
} forEach ((locker_inventory select _lockIndex) select 1);

if (_finished) then {
    if (!([true, _variable, 1] call life_fnc_handleInv)) exitWith {
        {
            if ((_x select 0) == _variable) exitWith {
                if ((_X select 1) > 0) then {
                    ((locker_inventory select _lockIndex) select 1) set [_forEachIndex, [_variable, ((((locker_inventory select _lockIndex) select 1) select _forEachIndex) select 1) + 1]];
                };
            };
        } forEach ((locker_inventory select _lockIndex) select 1);
    };
};

_id = ((locker_inventory select _lockIndex) select 0);
[_id, ((locker_inventory select _lockIndex) select 1)] remoteExec ["slocker_fnc_lockerUpdateInventory", 2];
[] call locker_fnc_lockerMenuUpdate;

ctrlEnable [4003, true];
ctrlEnable [4004, true];
