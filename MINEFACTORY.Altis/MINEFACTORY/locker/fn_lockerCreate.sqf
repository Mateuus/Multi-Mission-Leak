/*
    Filename:
        core\locker\fn_lockerCreate.sqf
        
    Author:
        Vincent H. || AGPHeaddikilla || Yoghurt/Yogurette
    
    Description:
        Hmmmmm... Maybe to create somthi... Watch the filename!
        
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

if (life_cash < locker_price) exitWith { hint "Du hast nicht genügend Geld dabei!"; closeDialog 0; sleep 0.01; [] call locker_fnc_lockerMenu; };

[(getPlayerUID player)] remoteExec ["slocker_fnc_lockerInsertPlayer", 2];
life_cash = life_cash - locker_price;
hint "Du hast nun ein Schließfach!";

locker_dataIsReady = false;
[player] remoteExec ["slocker_fnc_lockerReturnData", 2];

locker_haveLocker = true;
closeDialog 0;
sleep 0.01;
[] call locker_fnc_lockerMenu;
