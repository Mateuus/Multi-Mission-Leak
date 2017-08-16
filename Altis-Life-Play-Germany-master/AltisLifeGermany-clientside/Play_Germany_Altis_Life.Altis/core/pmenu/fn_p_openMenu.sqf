#include <macro.h>
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

if("ItemRadio" in (assignedItems  player)) then {
	ctrlSetText[2016,"icons\phone\padfone_1024_hz.paa"];
	ctrlEnable[20144,true];
} else {
	ctrlSetText[2016,"icons\phone\tafel_1024_hz.paa"];
	ctrlEnable[20144,false];
};

switch(playerSide) do {
	case west: 
	{
		ctrlShow[2011,false]; // Meine Gang
		ctrlShow[20111,false]; // Meine Gang Icon	
		ctrlShow[2025,false];
		ctrlShow[20251,false];
	};
	
	case civilian:
	{
		ctrlShow[2012,false]; // Fahndungsliste
		ctrlShow[20121,false]; // Fahndungsliste Icon
		ctrlShow[20003,false]; // Placeables
	};
	
	case independent:
	{
		ctrlShow[2012,false]; // Fahndungsliste
		ctrlShow[20121,false]; // Fahndungsliste Icon
		ctrlShow[2011,false]; // Meine Gang
		ctrlShow[20111,false]; // Meine Gang Icon	
		ctrlShow[2025,false];
		ctrlShow[20251,false];
	};
	
	case east:
	{
		ctrlShow[2012,false]; // Fahndungsliste
		ctrlShow[20121,false]; // Fahndungsliste Icon
		ctrlShow[2011,false]; // Meine Gang
		ctrlShow[20111,false]; // Meine Gang Icon		
		ctrlShow[2025,false];
		ctrlShow[20251,false];
		ctrlShow[20003,false]; // Placeables
	};
};

if(FETCH_CONST(life_adminlevel) < 1 && FETCH_CONST(life_eventlevel) < 1) then {
	ctrlShow[2020,false]; // Admin
	ctrlShow[2021,false]; // Admin
	ctrlShow[20211,false]; // Admin ICON
};

[] call life_fnc_p_updateMenu;