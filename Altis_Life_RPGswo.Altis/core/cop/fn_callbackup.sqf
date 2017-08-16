#include "..\..\macros.hpp"
/*
	Script file made by: Maximum
	Idea based off: Liemans script - did way to much to achieve the same thing.
	Description: Lets a officer request backup VIA z menu, made for AltisLifeRPG.com
*/
private["_backupTime"];

_backupTime = 60;

if((side player) == civilian || (side player) == independent) exitWith {};
if(!DWEV_callBackup) exitWith {hint "So schnell kannst du nicht erneut nach Hilfe rufen!"};


	if ((side player) IN [west,east]) then
	{
		[player,_backupTime] remoteExec ["DWEV_fnc_backupCall",(side player)];
	};
	
DWEV_callBackup = false;
[] spawn
{
	uiSleep 300;
	DWEV_callBackup = true;
};
hint format ["%1 du kannst nun erneut backup rufen.",getMyName];