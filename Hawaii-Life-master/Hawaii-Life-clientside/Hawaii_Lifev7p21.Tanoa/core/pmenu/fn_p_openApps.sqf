#include "..\..\script_macros.hpp"
/*
	File: fn_p_openApps.sqf
	Author: Larry

	Description:
	Opens the players virtual inventory menu
*/
disableSerialization;

switch(playerSide) do
{
	case west: 
	{
		ctrlEnable[2011,false];
		ctrlEnable[2016,false];
	};
	
	case civilian:
	{
		ctrlEnable[2012,false];
	};
	
	case independent:
	{
		ctrlEnable[2011,false];
		ctrlEnable[2016,false];
		ctrlEnable[2012,false];
	};
};