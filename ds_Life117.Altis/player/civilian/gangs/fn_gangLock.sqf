/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Locks or unlocks the players gang
*/

disableSerialization;
private["_gang","_action"];

_gang = (group player);
_action = false;

//if((getPlayerUID player) != ((group player) getVariable "gangLeader"))exitwith{hint "Only the gang leader can lock or unlock the gang"};

if((group player) getVariable ["gangLocked",false])then
	{
	_action = [
	"Unlocking your gang allows anybody to join, continue?",
	"Warning!",
	"Continue",
	"No Thanks"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{};
	(group player) setVariable["gangLocked",false,true];
	hint "Your gang has been unlocked";
	}
	else
	{
	(group player) setVariable["gangLocked",true,true];
	hint "Your gang has been locked";
	};

























