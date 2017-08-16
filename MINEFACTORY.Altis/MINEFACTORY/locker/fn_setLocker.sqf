/*
    Filename:
        core\locker\fn_setLocker.sqf
        
    Author:
        Vincent H. || AGPHeaddikilla || Yoghurt/Yogurette
    
    Description:
        Sets the data for the ingame Locker.
        
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

_inventory = [_this, 0, [], [[]]] call BIS_fnc_param;
_state = [_this, 1, false, [false]] call BIS_fnc_param;

locker_haveLocker = _state;
locker_inventory = _inventory;
locker_dataIsReady = true; // insert in init.sqf -> "locker_dataIsReady = false;"
