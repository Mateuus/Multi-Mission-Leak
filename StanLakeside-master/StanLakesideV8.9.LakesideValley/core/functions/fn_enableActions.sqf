/*
	File: fn_enableActions.sqf
	
	Description:
	Enable actions for several seconds.
*/

if (!life_show_actions && time > life_action_time) then
{
	[] spawn life_fnc_setupActions;
};
if (time > life_action_time) exitWith { life_action_time = time + 9; };
life_action_time = time + 9;
if(life_show_actions) exitWith {};
life_show_actions = true;

waitUntil { uiSleep 1; (life_action_time < time )};

{ player removeAction _x; } forEach life_actions;
life_actions = [];
life_show_actions = false;