#include <macro.h>
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.

if(playerSide == civilian) then {
	createDialog "playerBackpack";
} else {
	createDialog "playerSettings";
};

disableSerialization;

switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2011,false];
		ctrlShow[9800,true];
		ctrlShow[2025,false];
		ctrlShow[2020,false];
		ctrlShow[2024,false];
		ctrlShow[2021,false];
		ctrlShow[29002,false];
		ctrlShow[29001,false];
		ctrlShow[2900,false];
	};
	
	case civilian:
	{
		ctrlShow[2012,false];
		ctrlShow[9800,false];
		ctrlShow[2020,false];
		ctrlShow[2024,false];
		ctrlShow[2021,false];
		ctrlShow[29002,false];
		ctrlShow[29001,false];
		ctrlShow[2900,false];
	};
	
	case independent:
	{
		ctrlShow[2011,false];
		ctrlShow[2012,false];
		ctrlShow[9800,false];
		ctrlShow[2025,false];
		ctrlShow[2020,false];
		ctrlShow[2024,false];
		ctrlShow[2021,false];
		ctrlShow[29002,false];
		ctrlShow[29001,false];
		ctrlShow[2900,false];
	};
	
	case east:
	{
		ctrlShow[2012,false];
		ctrlShow[9800,false];
		ctrlShow[2020,false];
		ctrlShow[2024,false];
		ctrlShow[2021,false];
		ctrlShow[29002,false];
		ctrlShow[29001,false];
		ctrlShow[2900,false];
	};
};

if(__GETC__(life_adminlevel) == 1) then
{
	ctrlShow[2020,true];
	ctrlShow[2024,false];
	ctrlShow[2021,false];
	ctrlShow[29002,true];
	ctrlShow[29001,false];
	ctrlShow[2900,false];
};

if(__GETC__(life_adminlevel) == 2) then
{
	ctrlShow[2020,false];
	ctrlShow[2024,true];
	ctrlShow[2021,false];
	ctrlShow[29002,false];
	ctrlShow[29001,true];
	ctrlShow[2900,false];
};

if(__GETC__(life_adminlevel) == 3) then
{
	ctrlShow[2020,false];
	ctrlShow[2024,false];
	ctrlShow[2021,true];
	ctrlShow[29002,false];
	ctrlShow[29001,false];
	ctrlShow[2900,true];
};

[] call tanoarpg_fnc_p_updateMenu;