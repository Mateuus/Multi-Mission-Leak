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
//_playerID = getPlayerUID player;
/*
//-- Dev Admin for just a steam id - 76561198004899973
if ((_playerID) in ["76561198004899974"]) then {
    titleText ["Hello Respawn.  Welcome back. Loading Menu....", "PLAIN DOWN", 3];
    sleep 1;
        ctrlShow [99258,false]; //--Dev Menu
    } else {
        ctrlShow [99258,true]; //--Dev Menu
};
*/
switch (playerSide) do {
    case west: {
        ctrlShow[2011,false];//-- My Gang
		ctrlShow[3025,false];//-- Market Menu
        ctrlShow[9696,false];//-- Bounty Hunter Menu
		ctrlShow[9898,false];//-- Bounty Hunter Menu
      //ctrlShow[3025,false];//-- Market Menu
        ctrlShow [99258,false];
    };

    case civilian: {
        ctrlShow[2012,false];//-- WantedList
        ctrlShow[20003,false];//-- Placeables Menu
        ctrlShow[9696,false];//-- Bounty Hunter Menu
		ctrlShow[9898,false];//-- Bounty Hunter Menu
        ctrlShow [99258,false];
    };

    case independent: {
        ctrlShow[2012,false];//-- WantedList
        ctrlShow[2011,false];//-- My Gang
        ctrlShow[9696,false];//-- Bounty Hunter Menu
		ctrlShow[9898,false];//-- Bounty Hunter Menu
        //ctrlShow[3025,false];//-- Market Menu
        ctrlShow [99258,false];
    };
};
//-- Police Placeables Menu rank 4 +
if((FETCH_CONST(life_coplevel) < 4 ) ) then 
{
	ctrlShow[20003,false];
};

//-- Admin Menu from normal admins
if (FETCH_CONST(life_adminlevel) < 1) then 
{
    ctrlShow[2020,false];
    ctrlShow[2021,false];
};

/*
if ((getPlayerUID player) in ["76561198004899973"]) then {
    ctrlShow[2020,true];
    ctrlShow[2021,true]; //--Admin Menu  
};
*/


[] call life_fnc_p_updateMenu;
//Reloading Skins
[] call life_fnc_playerSkins;
