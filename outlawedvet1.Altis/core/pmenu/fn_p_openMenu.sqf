#include "..\..\script_macros.hpp"
/*
    File: fn_p_openMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the players virtual inventory menu
*/
if (!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

switch (playerSide) do {
    case west: {
        ctrlShow[2011,false];
		if((FETCH_CONST(life_coplevel) > 3) || (FETCH_CONST(life_swatlevel) > 0)) then {
		} else {
		ctrlShow[2030,false]; // COP Placeables
		};
    };

    case civilian: {
        ctrlShow[2012,false];
		ctrlShow[2030,false]; // COP Placeables
    };

    case independent: {
        ctrlShow[2012,false];
        ctrlShow[2011,false];
		ctrlShow[2030,false]; // COP Placeables
    };
};

if (FETCH_CONST(life_adminlevel) < 1) then {
    ctrlShow[2020,false];
    ctrlShow[2021,false];
};

if(FETCH_CONST(life_swatlevel) < 3) then
{
ctrlShow[2028,false];
};

[] call life_fnc_p_updateMenu;
