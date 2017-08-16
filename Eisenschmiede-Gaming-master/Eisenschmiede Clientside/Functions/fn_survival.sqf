#include "script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	All survival? things merged into one thread.
*/
private["_fnc_food","_fnc_water","_foodTime","_waterTime","_bp","_walkDis","_lastPos","_curPos"];
_fnc_food =  {
	if(ES_hunger < 2) then {[player,"Durch Verhungern in Ohnmacht gefallen."] call ES_fnc_medilogSubmit; player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
	else
	{
		ES_hunger = ES_hunger - 10;
		[] call ES_fnc_hudUpdate;
		if(ES_hunger < 2) then {[player,"Durch Verhungern in Ohnmacht gefallen."] call ES_fnc_medilogSubmit; player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		switch(ES_hunger) do {
			case 30: {hint localize "STR_NOTF_EatMSG_1"; [player,"eat"] call ES_fnc_globalSound; };
			case 20: {hint localize "STR_NOTF_EatMSG_2"; [player,"eat"] call ES_fnc_globalSound; };
			case 10: {hint localize "STR_NOTF_EatMSG_3"; [player,"eat"] call ES_fnc_globalSound; if(EQUAL(ES_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};};
		};
	};
};
	
[] spawn  {
	while{true} do
	{
		waitUntil {(player getVariable "missingOrgan")};
		ES_max_health = .50;
		while{(player getVariable "missingOrgan")} do {
			ES_thirst =  50;
			ES_hunger =  50;
			if(damage player < (1 - ES_max_health)) then {player setDamage (1 - ES_max_health);};
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [2];
			"dynamicBlur" ppEffectCommit 1;
			sleep 5;
		};
		"dynamicBlur" ppEffectEnable false;
		ES_max_health = 1;
	};
};	

[] spawn
{
    while {true} do
    {
        sleep 1.5;
        if(ES_inv_uranUnrefined != 0) then {
            player forceWalk true;
            player setFatigue 1;
            hint "Du transportierst Uranium das sehr schwer ist, deswegen bewegst du dich langsamer!";
        } else {
            if(isForcedWalk player) then {
                player forceWalk false;
            };
        };
    };
};

[] spawn
{
    while {true} do
    {
        private["_damage"];
        sleep 1;
        while {((player distance (getMarkerPos "uran_1") < 150) && (player getVariable["Revive",TRUE]))} do
        {
            if(uniform player == "U_C_Scientist") then
            {
                hint "!!! Du betrittst die Radioaktive Sperrzone !!! Aber dein Schutzanzug schützt dich";
                sleep 5;
            }else
            {
                hint "!!! ACHTUNG RADIOAKTIVE ZONE !!! DU KANNST STERBEN, WENN DU KEINEN SCHUTZANZUG AN HAST";
                _damage = damage player;
                _damage = _damage + 0.1;
                player setDamage (_damage);
                [] call ES_fnc_hudUpdate;
				[player,"uran"] call ES_fnc_globalSound;
                sleep 5;
            };
        };
    };
};
	
_fnc_water = {
	if(ES_thirst < 2) then {[player,"Durch Austrocknung ohnmächtig."] call ES_fnc_medilogSubmit; player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
	else
	{
		ES_thirst = ES_thirst - 10;
		[] call ES_fnc_hudUpdate;
		if(ES_thirst < 2) then {[player,"Durch Austrocknung ohnmächtig."] call ES_fnc_medilogSubmit; player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
		switch(ES_thirst) do  {
			case 30: {hint localize "STR_NOTF_DrinkMSG_1"; playSound "durst1"; };
			case 20: {hint localize "STR_NOTF_DrinkMSG_2"; playSound "durst1"; if(EQUAL(ES_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};};
			case 10: {hint localize "STR_NOTF_DrinkMSG_3"; playSound "durst1"; if(EQUAL(ES_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};};
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
		ES_maxWeight = ES_maxWeightT;
		_bp = backpack player;
	} else {
		if(!(EQUAL(backpack player,"")) && {!(EQUAL(backpack player,_bp))}) then {
			_bp = backpack player;
			ES_maxWeight = ES_maxWeightT + (round(getNumber(configFile >> "CfgVehicles" >> _bp >> "maximumload") / 4));
			if(FETCH_CONST(ES_adminlevel) >= 5) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
			if(playerSide == independent) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
		};
	};
	
	/* Check if the player's state changed? */
	if(vehicle player != _lastState OR {!alive player}) then {
		[] call ES_fnc_updateViewDistance;
		_lastState = vehicle player;
	};
	
	/* Check if the weight has changed and the player is carrying to much */
	if(ES_carryWeight > ES_maxWeight && {!isForcedWalk player}) then {
		player forceWalk true;
		if(EQUAL(ES_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
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
			_walkDis = _walkDis + 1;

			if(EQUAL(_walkDis,650)) then {
				_walkDis = 0;
				ES_thirst = ES_thirst - 5;
				ES_hunger = ES_hunger - 5;
				[] call ES_fnc_hudUpdate;
			};
		};
		_lastPos = visiblePosition player;
		_lastPos = (SEL(_lastPos,0)) + (SEL(_lastPos,1));
	};
	if (serverTime >= 14100) then { if (isNil "ES_ServerTime") then { ES_ServerTime = true; }; if (ES_ServerTime) then { hintSilent "AutoSave, dein Spielstand wurde gespeichert!"; [] call SOCK_fnc_updateRequest; ES_ServerTime = false; }; };
	uiSleep 1;
};
