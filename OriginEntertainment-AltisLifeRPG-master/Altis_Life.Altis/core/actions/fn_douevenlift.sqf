/*
		File: douevenlift.sqf
*/

_price = 5000;

if(life_cash < _price) exitWith {hint "You dont have enough money!";};
if(life_hunger < 50) exitWith {hint "You should eat something before you start to train!";};
if(life_thirst < 50) exitWith {hint "You should drink something before you start to train!";};

life_cash = life_cash - _price;
life_thirst = life_thirst - 30;
life_hunger = life_hunger - 30;
[] call life_fnc_hudUpdate;
player setFatigue 0;
	[] spawn
		{
			life_redgull_effect = time;
			titleCut ["", "BLACK FADED", 999];
			titleText["Training...","PLAIN"];
			sleep 3;
			titlecut [" ","BLACK IN",3];
			titleText["After your training you feel energized, a bit hungry and thirsty though.","PLAIN"];
			player enableFatigue false;
			waitUntil {!alive player OR ((time - life_redgull_effect) > (10 * 60))};
			player enableFatigue true;
		};