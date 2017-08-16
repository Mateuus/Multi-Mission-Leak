/*

File: fitness.sqf
Author: Dexter, feel free to modify

Description:
simple fitness center

*/

_price = 1750;

if(life_cash < _price) exitWith {hint "Du hast nicht genug Geld dabei!";};
if(life_hunger < 85) exitWith {hint "Geh was essen bevor du die Liegestuetze machst!";};
if(life_thirst < 85) exitWith {hint "Geh was trinken bevor du die Liegestuetze machst!";};

life_cash = life_cash - _price;
life_thirst = life_thirst - 60;
life_hunger = life_hunger - 60;
[] call life_fnc_hudUpdate;
player setFatigue 0;
    [] spawn
        {
            life_redgull_effect = time;
            titleText["Trainiere...","PLAIN"];
            player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
            sleep 14;
            titleText["Du bist nun aufgepumpt. Denk daran, etwas zu essen und trinken!","PLAIN"];
            player enableFatigue false;
            waitUntil {!alive player OR ((time - life_redgull_effect) > (10 * 60))};
            player enableFatigue true;
        };