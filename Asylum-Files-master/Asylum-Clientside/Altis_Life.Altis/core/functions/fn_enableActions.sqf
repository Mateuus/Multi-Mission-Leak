/*
	File: fn_enableActions.sqf
	
	Description:
	Enable actions for several seconds.
*/

if (player getVariable["restrained",false] || (isWeaponRested player) && (isWeaponDeployed player)) exitWith {};
if(life_show_actions) exitWith {};
//if (!life_show_actions) then
//{
	life_show_actions = true;
	[] spawn life_fnc_setupActions;
	life_action_time = time + 7;
//};
//if (time > life_action_time) exitWith { life_action_time = time + 7; };
//life_action_time = time + 7;

waitUntil { life_action_time < time };

removeAllActions player;
life_actions = [];
life_show_actions = false;