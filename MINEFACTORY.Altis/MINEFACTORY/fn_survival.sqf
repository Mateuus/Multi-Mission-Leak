#include "..\script_macros.hpp"
/*
	File: fn_survival.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	All survival? things merged into one thread.
*/
private["_fnc_food","_fnc_water","_foodTime","_waterTime","_bp","_walkDis","_lastPos","_curPos"];
_fnc_food =  {
	if(life_hunger < 2) then {player setDamage 1; hint  "Du bist verhungert.";}
	else
	{
		SUB(life_hunger,10);
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint  "Du bist verhungert.";};
		switch(life_hunger) do {
			case 30: {hint  "Du hast schon eine Weile nichts mehr gegessen, du solltest schnell etwas zum Essen suchen!";};
			case 20: {hint  "Du hast Hunger, du solltest schnell etwas essen oder du wirst verhungern.";};
			case 10: {
				hint  "Du bist am Verhungern, du wirst sterben, wenn du nichts zum Essen findest";
				if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
			};
		};
	};
};
	
_fnc_water = {
	if(life_thirst < 2) then {player setDamage 1; hint  "Du bist verdurstet.";}
	else
	{
		SUB(life_thirst,10);
		[] call life_fnc_hudUpdate;
		if(life_thirst < 2) then {player setDamage 1; hint  "Du bist verdurstet.";};
		switch(life_thirst) do  {
			case 30: {hint  "Du hast schon eine Weile nichts mehr getrunken! Du solltest schnell etwas zum Trinken suchen.";};
			case 20: {
				hint  "Du hast Durst! Du solltest schnell etwas trinken oder du wirst verdursten.";
				if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
			};
			case 10: {
				hint  "Du bist am Verdursten. Du wirst sterben, wenn du nichts zum Trinken findest";
				if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
			};
		};
	};
};

//Setup the time-based variables.
_foodTime = time;
_waterTime = time;
_walkDis = 0;
_bp = "";
_lastPos = visiblePosition player;
_lastPos = (SEL(_lastPos,0)) + (SEL(_lastPos,1));
_lastState = vehicle player;

while {true} do {
	/* Thirst / Hunger adjustment that is time based */
	if((time - _waterTime) > 600) then {[] call _fnc_water; _waterTime = time;};
	if((time - _foodTime) > 850) then {[] call _fnc_food; _foodTime = time;};
	
	/* Adjustment of carrying capacity based on backpack changes */
	if(EQUAL(backpack player,"")) then {
		life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
		_bp = backpack player;
	} else {
		if(!(EQUAL(backpack player,"")) && {!(EQUAL(backpack player,_bp))}) then {
			_bp = backpack player;
			life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight") + round(FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_bp,"maximumload") / 4);
		};
	};
	
	/* Check if the player's state changed? */
	if(vehicle player != _lastState OR {!alive player}) then {
		[] call life_fnc_updateViewDistance;
		_lastState = vehicle player;
	};
	
	/* Check if the weight has changed and the player is carrying to much */
	if(life_carryWeight > life_maxWeight && {!isForcedWalk player}) then {
		player forceWalk true;
		if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
		hint  "Du trägst zu viel bei dir! Du bist nicht in der Lage, zu rennen oder dich schnell zu bewegen, bis du Gegenstände abgelegt hast!";
	} else {
		if(isForcedWalk player) then {
			player forceWalk false;
		};
	};
	
	/* Travelling distance to decrease thirst/hunger which is captured every second so the distance is actually greater then 650 */
	if(!alive player) then {_walkDis = 0;} else {
		_curPos = visiblePosition player;
		_curPos = (SEL(_curPos,0)) + (SEL(_curPos,1));
		if(!(EQUAL(_curPos,_lastPos)) && {(vehicle player == player)}) then {
			ADD(_walkDis,1);
			if(EQUAL(_walkDis,650)) then {
				_walkDis = 0;
				SUB(life_thirst,5);
				SUB(life_hunger,5);
				[] call life_fnc_hudUpdate;
			};
		};
		_lastPos = visiblePosition player;
		_lastPos = (SEL(_lastPos,0)) + (SEL(_lastPos,1));
	};
	uiSleep 1;
};
	
	
	
