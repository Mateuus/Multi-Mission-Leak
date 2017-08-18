/*
		File: douevenliftjail.sqf
*/

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