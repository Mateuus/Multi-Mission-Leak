/*
	File: fn_cocaine.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Say hello to my little friend!
*/

if (!([false,"cocainep",1] call life_fnc_handleInv)) exitWith {};

life_drug_level = life_drug_level + 0.15;
if (life_drug_level > 1) then { life_drug_level = 1; };

[] spawn
{
	life_cocaine_effect = time;
	systemChat "You feel unstoppable!";
	player setFatigue 0;
	player enableFatigue false;
	player setAnimSpeedCoef 1.1;
	waitUntil {!alive player OR ((time - life_cocaine_effect) > (4 * 60))};
	life_cocaine_effect = 0;
	player setAnimSpeedCoef 1;
	player enableFatigue true;
};

[] call life_fnc_hudUpdate;
["cocainep"] call life_fnc_drugUsed;