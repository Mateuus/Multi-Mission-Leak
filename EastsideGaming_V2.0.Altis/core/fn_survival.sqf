#include "..\script_macros.hpp"
/*
    File: fn_survival.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    All survival? things merged into one thread.
*/
private ["_fnc_food","_fnc_water","_foodTime","_waterTime","_bp","_walkDis","_lastPos","_curPos"];
_fnc_setinjure = {
	player setVariable ["esg_bewusstlos", true, true];
	_time = ["survive"]call ESG_fnc_skilltime;
	if(_time isEqualTo 0) then{_time = 600;};
	_delay = time + _time;										// invulnerable for time x after fall in agony
	player setVariable ["esg_bewusstlos_delay", _delay,true];
	[player getVariable ["realname", name vehicle player]]spawn life_fnc_injured;
};

_fnc_food =  {
    if (life_hunger < 2) then {[]spawn _fnc_setinjure; hint localize "STR_NOTF_EatMSG_Death";}
    else
    {
        life_hunger = life_hunger - 10;
        [] call life_fnc_hudUpdate;
        if (life_hunger < 2) then {[]spawn _fnc_setinjure; hint localize "STR_NOTF_EatMSG_Death";};
        switch (life_hunger) do {
            case 30: {hint localize "STR_NOTF_EatMSG_1";};
            case 20: {hint localize "STR_NOTF_EatMSG_2";};
            case 10: {
                hint localize "STR_NOTF_EatMSG_3";
            };
        };
    };
};

_fnc_water = {
    if (life_thirst < 2) then {[]spawn _fnc_setinjure; hint localize "STR_NOTF_DrinkMSG_Death";}
    else
    {
        life_thirst = life_thirst - 10;
        [] call life_fnc_hudUpdate;
        if (life_thirst < 2) then {[]spawn _fnc_setinjure; hint localize "STR_NOTF_DrinkMSG_Death";};
        switch (life_thirst) do  {
            case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
            case 20: {
                hint localize "STR_NOTF_DrinkMSG_2";
            };
            case 10: {
                hint localize "STR_NOTF_DrinkMSG_3";
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
_lastPos = (_lastPos select 0) + (_lastPos select 1);
_lastState = vehicle player;

for "_i" from 0 to 1 step 0 do {
    if ((time - _waterTime) > 600) then {[] call _fnc_water; _waterTime = time;};
    if ((time - _foodTime) > 850) then {[] call _fnc_food; _foodTime = time;};

    if (backpack player isEqualTo "") then {
        life_maxWeight = 74;
        _bp = backpack player;
    } else {
        if (!(backpack player isEqualTo "") && {!(backpack player isEqualTo _bp)}) then {
            _bp = backpack player;
            life_maxWeight = 74 + round(FETCH_CONFIG2(getNumber,"CfgVehicles",_bp,"maximumload") / 4);
        };
    };

    if (vehicle player != _lastState || {!alive player}) then {
        [] call life_fnc_updateViewDistance;
        _lastState = vehicle player;
    };

    if (life_carryWeight > life_maxWeight && {!isForcedWalk player}) then {
        player forceWalk true;
        hint localize "STR_NOTF_MaxWeight";
    } else {
        if (isForcedWalk player) then {
            player forceWalk false;
        };
    };

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
	
	{
		if(agent _x isKindOf "Snake_random_F" || agent _x isKindOf "Rabbit_F" || agent _x isKindOf "Bird") then {agent _x setpos [0,0,0];};
	} forEach agents;
	
    uiSleep 10;
};