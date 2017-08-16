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

switch(playerSide) do
{
	case west:
	{
		ctrlShow[2011,false];
		ctrlShow[1202,false];
	};

	case civilian:
	{
		//ctrlShow[2012,false];
	};

	case independent: // LHM
	{
		//ctrlShow[2012,false];
		ctrlShow[2011,false];
		ctrlShow[1202,false];
	};

	case east: // LHM
	{
		//ctrlShow[2012,false];
		ctrlShow[2011,false];
		ctrlShow[1202,false];
	};

};

if(__GETC__(lhm_adminlevel) < 1) then
{
	ctrlShow[1208,false];
	ctrlShow[2021,false];
};

[] call lhm_fnc_p_updateMenu;

if(__GETC__(lhm_adminlevel) < 1) then
{
	ctrlShow[1208,false];
	ctrlShow[2021,false];
};