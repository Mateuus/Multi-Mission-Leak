#include "..\..\script_macros.hpp"
/*
    File: fn_p_openMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the players virtual inventory menu
*/
if (!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
if(life_action_inUse)exitWith{hint "Bitte warte kurz!"};
if(player getVariable "esg_bewusstlos")exitWith {};
createDialog "playerSettings";
disableSerialization;

switch (playerSide) do {
    case west: {
        ctrlShow[2011,false];
    };

    case civilian: {
        ctrlShow[9898,false];
		ctrlShow[9998,false];
		ctrlShow[8999,false];
    };

    case independent: {
        ctrlShow[8999,false];
        ctrlShow[2011,false];
		ctrlShow[9898,false];
    };
};

if (FETCH_CONST(life_adminlevel) < 1) then {
    ctrlShow[2021,false];
};

[] call life_fnc_p_updateMenu;
