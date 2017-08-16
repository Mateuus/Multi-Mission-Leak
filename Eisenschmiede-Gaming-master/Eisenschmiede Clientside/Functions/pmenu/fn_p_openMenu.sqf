#include "..\script_macros.hpp"
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the players virtual inventory menu
*/
if(ES_firstDia) exitWith {};
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
if(player getVariable ["restrained", false] && (FETCH_CONST(ES_adminlevel) < 2)) exitWith {hint "Sie können nicht auf Ihr Tablet zugreifen, weil Ihre Hände gefesselt sind"};
createDialog "playerSettings";
disableSerialization;

switch(playerSide) do {
	case west: {
		ctrlShow[2011,false];
		ctrlShow[1207,false];
		ctrlShow[1209,false];
		ctrlShow[1245754,false];
		ctrlShow[1245755,false];		
		ctrlShow[5987,false];
		ctrlShow[5986,false];
		ctrlShow[13458,false];
		ctrlShow[13459,false];
		ctrlShow[556734,false];
	};
	
	case civilian: {
		ctrlShow[2012,false];
		ctrlShow[1210,false];
		ctrlShow[2008,false];
		ctrlShow[9800,false];
		ctrlShow[1245756,false];
		ctrlShow[1245757,false];
		ctrlShow[5987,false];
		ctrlShow[5986,false];
		ctrlShow[13456,false];
		ctrlShow[13457,false];
		ctrlShow[13458,false];
		ctrlShow[13459,false];
	};

	case independent: {
		ctrlShow[2012,false];
		ctrlShow[1210,false];
		ctrlShow[2008,false];
		ctrlShow[1207,false];
		ctrlShow[1209,false];
		ctrlShow[9800,false];
		ctrlShow[1245754,false];
		ctrlShow[1245755,false];
		ctrlShow[5987,false];
		ctrlShow[5986,false];
		ctrlShow[13456,false];
		ctrlShow[13457,false];
		ctrlShow[13458,false];
		ctrlShow[13459,false];
	};

	default {
		ctrlShow[2012,false];
		ctrlShow[1210,false];
		ctrlShow[2008,false];
		ctrlShow[20210,false];
		ctrlShow[2021,false];
		ctrlShow[9800,false];
		ctrlShow[1245756,false];
		ctrlShow[1245757,false];
		ctrlShow[13456,false];
		ctrlShow[13457,false];
		ctrlShow[13458,false];
		ctrlShow[13459,false];
	};
	
};

if(FETCH_CONST(ES_adminlevel) < 1) then {
	ctrlShow[20210,false];
	ctrlShow[2020,false];
};

if(FETCH_CONST(ES_coplevel) == 12) then {
	ctrlShow[13458,true];
	ctrlShow[13459,true];
};

[] call ES_fnc_p_updateMenu;

if(FETCH_CONST(ES_coplevel) == 12) then {
	ctrlShow[13458,true];
	ctrlShow[13459,true];
};

if(FETCH_CONST(ES_adminlevel) < 1) then {
	ctrlShow[20210,false];
	ctrlShow[2020,false];
};