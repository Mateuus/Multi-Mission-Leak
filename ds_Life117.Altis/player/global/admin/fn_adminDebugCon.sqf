/*
	File: fn_adminDebugCon.sqf
	Author: ColinM9991
	
	Description:
	Opens the Debug Console.
*/
if(DS_adminlevel < 4) exitWith {closeDialog 0};
if((getPlayerUID player) in DS_adminlist4)then
	{
	createDialog "RscDisplayDebugPublic";
	};