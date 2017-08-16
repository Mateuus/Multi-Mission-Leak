#include "..\script_macros.hpp"
/*
	File: fn_survival.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	All survival? things merged into one thread.
*/
private["_fnc_food","_fnc_water","_foodTime","_waterTime","_bp","_walkDis","_lastPos","_curPos"];
_fnc_food =  {
	if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
	else
	{
		SUB(life_hunger,10);
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		switch(life_hunger) do {
			case 30: {hint localize "STR_NOTF_EatMSG_1";};
			case 20: {hint localize "STR_NOTF_EatMSG_2";};
			case 10: {
				hint localize "STR_NOTF_EatMSG_3";
				if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
			};
		};
	};
};
	
_fnc_water = {
	if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
	else
	{
		SUB(life_thirst,10);
		[] call life_fnc_hudUpdate;
		if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
		switch(life_thirst) do  {
			case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
			case 20: {
				hint localize "STR_NOTF_DrinkMSG_2";
				if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
			};
			case 10: {
				hint localize "STR_NOTF_DrinkMSG_3";
				if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
			};
		};
	};
};

[] spawn {
	while {true} do
		{
			waitUntil {(life_drug > 0)};
			while{(life_drug > 0)} do {

			if(life_drug > 0.08) then 
			{
				sleep 60;
				[] spawn life_fnc_suechtig;
				hint "Sie sollten bei einen Notarzt vorbei schauen! Sie sind stark Drogensuechtig!";
				sleep 240;
			};
		};
	};
};

//uranium_damage
[] spawn {
    while {true} do {
        private["_damage"];
        sleep 1;
		if ((player distance (getMarkerPos "Radioactive_Marker")) < 250) then {
			if(uniform player == "U_C_Scientist" || (playerSide == west) || (playerSide == independent)) then {
				 hint "!!! Du betrittst die Radioaktive Sperrzone !!! Aber dein Schutzanzug schützt dich";
			} else {
				 hint "!!! ACHTUNG RADIOAKTIVE ZONE !!! DU WIRST STERBEN, WENN DU KEINEN SCHUTZANZUG AN HAST";
			};
			
			while {(player distance (getMarkerPos "Radioactive_Marker")) < 250} do {
				if (!life_radioPlaying) then {[0] spawn life_fnc_radio;};
				if(uniform player == "U_C_Scientist" || (playerSide == west) || (playerSide == independent)) then {
					sleep 5;
				} else {
					_damage = damage player;
					_damage = _damage + 0.05;
					player setDamage (_damage);
					[] call life_fnc_hudUpdate;
					sleep 5;
				};
			};
		};


        if(life_inv_uranium_ore != 0) then {
            player forceWalk true;
            player setFatigue 1;
            hint "Du transportierst Uran, welches sehr schwer ist, deswegen bewegst du dich langsamer!";
        } else {
            if(isForcedWalk player) then {
                player forceWalk false;
            };
        };
		player enableStamina false;
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
	if((time - _waterTime) > 1000) then {[] call _fnc_water; _waterTime = time;};
	if((time - _foodTime) > 1200) then {[] call _fnc_food; _foodTime = time;};
	
	
/* Adjustment of carrying capacity based on backpack changes */
	if(EQUAL(backpack player,"")) then {
		life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
		_bp = backpack player;
	} else {
		if(!(EQUAL(backpack player,"")) && {!(EQUAL(backpack player,_bp))}) then {
			_bp = backpack player;
			life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight") + round(FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_bp,"maximumload") / 4);
			if(playerSide == west) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
			if(playerSide == independent) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
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
		hint localize "STR_NOTF_MaxWeight";
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
	
	
	
