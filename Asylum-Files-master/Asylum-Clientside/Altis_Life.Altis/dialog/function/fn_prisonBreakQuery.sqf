/*
	File: fn_prisonBreakQuery.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Displays UI for breaking out of prison if a prisoner after a successful break.
*/

_unit = [_this,0,"Unknown",[""]] call BIS_fnc_param;
_jail = [_this,1,1,[1]] call BIS_fnc_param;

if (!life_is_arrested || (player distance (getMarkerPos "jail_marker2")) > 100) exitWith {};

if (life_trial_inprogress && life_requested_trial) exitWith {hint "A prison break has occurred but you cannot escape when you're waiting on a trial."};

if(!createDialog "life_prisonbreak_dialog") exitWith {"Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;

