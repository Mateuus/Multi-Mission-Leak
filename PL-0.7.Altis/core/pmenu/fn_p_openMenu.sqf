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
	case west: {
		ctrlShow[2011,false];
		ctrlShow[2050,false];
		ctrlShow[20004,false];
		ctrlShow[20005,false];
		ctrlShow[2045,false];
	};

	case civilian: {
		ctrlShow[2012,false];
		ctrlShow[2012,false];
		ctrlShow[20003,false];
		ctrlShow[20004,false];
		if(life_job > 0 && life_adac_onDuty) then {ctrlShow[2045,true];} else {ctrlShow[2045,false];};
		if(life_job > 0 && life_adac_onDuty) then {ctrlShow[20005,true];} else {ctrlShow[20005,false];};
	};
	case independent: {
		ctrlShow[2011,false];
		ctrlShow[2012,false];
		ctrlShow[20003,false];
		ctrlShow[20005,false];
		ctrlShow[2045,false];
	};
};

if(FETCH_CONST(life_adminlevel) < 1) then {
	ctrlShow[2020,false];
	ctrlShow[2021,false];
	ctrlShow[2051,false]; //Menu Admin
};

[] call life_fnc_p_updateMenu;