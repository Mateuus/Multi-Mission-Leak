/*
    Filename:
        core\locker\fn_lockerMenu.sqf
        
    Author:
        Vincent H. || AGPHeaddikilla || Yoghurt/Yogurette
    
    Description:
        This file process the possible dialogs of the locker.
        
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

locker_price = 10000; // SCHLIEßFACH PREIS
locker_maxWeight = 50;

if (isNil "locker_haveLocker") then { locker_haveLocker = false; };

if (locker_haveLocker) then {
    if (!dialog) then { createDialog "lockerMenu"; };
    _dialog = findDisplay 4000;
    _ComboLockers = _dialog displayCtrl 4008;
    
    lbClear _ComboLockers;
    
    {
        _ComboLockers lbAdd format["Schließfach %1", (_x select 0)];
        _ComboLockers lbSetData [((lbSize _ComboLockers) - 1), format["%1", (_x select 0)]];
    } forEach locker_inventory;
    
    _ComboLockers lbSetCurSel 0;
    [] call locker_fnc_lockerMenuUpdate;
} else {
    if (!dialog) then { createDialog "lockerCreate"; };
};
