#include "..\script_macros.hpp"
/*
    File: fn_survival.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    All survival? things merged into one thread.
*/
private ["_fnc_food","_fnc_water","_foodTime","_waterTime","_bp","_walkDis","_lastPos","_curPos","_illegalmarkers"];
_fnc_food =  {
    if (life_hunger < 2) then {player setDamage 1; [localize "STR_NOTF_EatMSG_Death",true,"slow"] call life_fnc_notificationSystem;;}
    else
    {
        life_hunger = life_hunger - 10;
        [] call life_fnc_hudUpdate;
        if (life_hunger < 2) then {player setDamage 1; [localize "STR_NOTF_EatMSG_Death",true,"slow"] call life_fnc_notificationSystem;};
        switch (life_hunger) do {
            case 30: {[localize "STR_NOTF_EatMSG_1",true,"slow"] call life_fnc_notificationSystem;};
            case 20: {[localize "STR_NOTF_EatMSG_2",true,"slow"] call life_fnc_notificationSystem;};
            case 10: {
                [localize "STR_NOTF_EatMSG_3",true,"slow"] call life_fnc_notificationSystem;
                if (LIFE_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 1;};
            };
        };
    };
};

_fnc_water = {
    if (life_thirst < 2) then {player setDamage 1; [localize "STR_NOTF_DrinkMSG_Death",true,"slow"] call life_fnc_notificationSystem;}
    else
    {
        life_thirst = life_thirst - 10;
        [] call life_fnc_hudUpdate;
        if (life_thirst < 2) then {player setDamage 1; [localize "STR_NOTF_DrinkMSG_Death",true,"slow"] call life_fnc_notificationSystem;};
        switch (life_thirst) do  {
            case 30: {[localize "STR_NOTF_DrinkMSG_1",true,"slow"] call life_fnc_notificationSystem;};
            case 20: {
                [localize "STR_NOTF_DrinkMSG_2",true,"slow"] call life_fnc_notificationSystem;
                if (LIFE_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 1;};
            };
            case 10: {
                [localize "STR_NOTF_DrinkMSG_3",true,"slow"] call life_fnc_notificationSystem;
                if (LIFE_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 1;};
            };
        };
    };
};

_illegalmarkers = ["marker1","marker2","marker3"]; 

if (playerSide == west) then { 

{ deleteMarkerLocal _x; } forEach _illegalmarkers; 

};

//addiction
[] spawn {
	while {true} do
		{
			waitUntil {(life_drug > 0)};
			while{(life_drug > 0)} do {

			if(life_drug > 0.08) then
			{
				sleep 60;
				[] spawn life_fnc_addicted;
				["You should find a medical personell, you don't feel too good.",false,"slow"] call life_fnc_notificationSystem;
				sleep 240;
			};
		};
	};
};


// Regenerate health over time 
[] spawn {
	private["_fnc_regen"];
	_fnc_regen =
	{
		if((life_hunger >= 70) && (life_thirst >= 70)) then
		{
			player setDamage ((damage player) - 0.05);
		};
	};

	while{true} do
	{
			uiSleep(70);
			[] call _fnc_regen;
	};
};



//Setup the time-based variables.
_foodTime = time;
_waterTime = time;
_walkDis = 0;
_bp = "";
_lastPos = visiblePosition player;
_lastPos = (_lastPos select 0) + (_lastPos select 1);
_lastState = vehicle player;

for "_i" from 0 to 1 step 0 do {
    /* Thirst / Hunger adjustment that is time based */
    if ((time - _waterTime) > 600) then {[] call _fnc_water; _waterTime = time;};
    if ((time - _foodTime) > 850) then {[] call _fnc_food; _foodTime = time;};

    /* Adjustment of carrying capacity based on backpack changes */
    if (backpack player isEqualTo "") then {
        life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
        _bp = backpack player;
    } else {
        if (!(backpack player isEqualTo "") && {!(backpack player isEqualTo _bp)}) then {
            _bp = backpack player;
            life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight") + round(FETCH_CONFIG2(getNumber,"CfgVehicles",_bp,"maximumload") / 4);
        };
    };

    /* Check if the player's state changed? */
    if (!(vehicle player isEqualTo _lastState) || {!alive player}) then {
        [] call life_fnc_updateViewDistance;
        _lastState = vehicle player;
    };

    /* Check if the weight has changed and the player is carrying to much */
    if (life_carryWeight > life_maxWeight && {!isForcedWalk player}) then {
        player forceWalk true;
        if (LIFE_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 1;};
        [localize "STR_NOTF_MaxWeight",true,"slow"] call life_fnc_notificationSystem;
    } else {
        if (isForcedWalk player) then {
            player forceWalk false;
        };
    };

    /* Travelling distance to decrease thirst/hunger which is captured every second so the distance is actually greater then 650 */
    if (!alive player) then {_walkDis = 0;} else {
        _curPos = visiblePosition player;
        _curPos = (_curPos select 0) + (_curPos select 1);
        if (!(_curPos isEqualTo _lastPos) && {(isNull objectParent player)}) then {
            _walkDis = _walkDis + 1;
            if (_walkDis isEqualTo 650) then {
                _walkDis = 0;
                life_thirst = life_thirst - 5;
                life_hunger = life_hunger - 5;
                [] call life_fnc_hudUpdate;
            };
        };
        _lastPos = visiblePosition player;
        _lastPos = (_lastPos select 0) + (_lastPos select 1);
    };
    uiSleep 1;
};

