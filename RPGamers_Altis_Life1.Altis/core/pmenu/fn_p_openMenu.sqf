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
        ctrlShow[1006,false];
        ctrlShow[9696,false];
        ctrlShow[1007,false];
        ctrlShow[3025,false];
        ctrlShow[1000,false];
        ctrlShow[40003,false]; //medic placeables
        ctrlShow[40004,false]; //medic placeables

    };

    case civilian: {
        ctrlShow[2012,false];
        ctrlShow[1008,false];
        ctrlShow[20003,false]; // COP Placeables
        ctrlShow[20004,false]; // COP Placeables
        ctrlShow[40003,false]; //medic placeables
        ctrlShow[40004,false]; //medic placeables
    };

    case independent: {
        ctrlShow[2012,false];
        ctrlShow[1008,false];
        ctrlShow[2011,false];
        ctrlShow[1006,false];
        ctrlShow[20003,false]; // COP Placeables
        ctrlShow[20004,false]; // COP Placeables
        ctrlShow[9696,false];
        ctrlShow[1007,false];
        ctrlShow[3025,false];
        ctrlShow[1000,false];
    };
};

if (FETCH_CONST(life_adminlevel) < 1) then {
    ctrlShow[2021,false];
    ctrlShow[2022,false];
};

[] call life_fnc_p_updateMenu;
