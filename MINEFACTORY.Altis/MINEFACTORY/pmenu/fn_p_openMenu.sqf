#include "..\..\script_macros.hpp"
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

switch(playerSide) do {

	case civilian: {
		ctrlShow[2417,false];
		ctrlShow[9445,false];
		ctrlShow[2413,false];
		ctrlShow[2420,false];
		ctrlShow[1217,false];
	};
	
	case independent: {
		ctrlShow[9445,false];
		ctrlShow[2413,false];
		ctrlShow[2417,false];
	};
	
	case west: {
		ctrlShow[2420,false];
		ctrlShow[1217,false];
	};
};

if(FETCH_CONST(life_adminlevel) < 1) then {
	ctrlShow[2410,false];
};

[] call life_fnc_p_updateMenu;
