/*
	File: fn_toggleActions.sqf
	
	Description:
	Clears or reloads action menu options for performance testing.
*/

life_show_actions = !life_show_actions;

removeAllActions player;
life_actions = [];

if (life_show_actions && !(isWeaponRested player) && !(isWeaponDeployed player)) then
{
	[] spawn life_fnc_setupActions;
};