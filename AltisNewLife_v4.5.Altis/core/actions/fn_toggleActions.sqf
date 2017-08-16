life_show_actions = !life_show_actions;
{ player removeAction _x; } foreach life_actions;
life_actions = [];
if (life_show_actions) then
{
	[] spawn life_fnc_initActions;
};