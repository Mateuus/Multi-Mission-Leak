#include "..\..\macros.hpp"
/*
	Script file made by: Maximum
	Idea based off: Liemans script - did way to much to achieve the same thing.
	Description: Lets a officer request backup VIA z menu button
*/
_player = param [0,ObjNull,[ObjNull]];
_deleteTime = param [1,60,[0]];
if(isNull _player) exitWith {};
if((side player) == civilian || (side player) == independent) exitWith {};
hint format ["%1 braucht Unterstützung", getPlayerName(_player)];
_backupmsg = createMarkerLocal [("_backupmsg" + (getPlayerName(_player))), getPos _player];
_backupmsg setMarkerTypeLocal "mil_warning";
_backupmsg setMarkerColorLocal "colorRed";
_backupmsg setMarkerTextLocal format ["%1 braucht hier Backup!",getPlayerDName(_player)];

[_deleteTime,_backupmsg] spawn
{
	uiSleep (_this select 0);
	deleteMarkerLocal (_this select 1);
};
