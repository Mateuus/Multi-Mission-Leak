/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Leaves your current gang
*/

disableSerialization;
private["_dialog","_playerlist","_index","_player","_gang","_action"];

_action = [
	"Are you sure you want to leave? You wont be able to re-enter unless the gang is unlocked by the leader",
	"Warning!",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;

if(!_action)exitwith{};
if((getPlayerUID player) == ((group player) getVariable "gangLeader"))exitwith{hint "The leader can not 'Leave' the gang, you must kick yourself to leave, this will leave the gang with no leader though"};
[[_gang,player],"Hunt_fnc_removePlayer",false,false] spawn DS_fnc_MP;
[player] joinSilent (createGroup civilian);

closeDialog 0;
hint "You have left your gang";























