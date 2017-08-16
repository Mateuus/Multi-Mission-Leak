/*
	File: fn_doRespawn.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Force respawn when at death screen.
*/

private ["_unit"];

_unit = player;
if (!(isNull life_corpse)) then { _unit = life_corpse };

if (playerSide in [civilian,west]) then
{
	[_unit,true] spawn life_fnc_dropItems;
};

closeDialog 0;
life_respawned = true;
[] call life_fnc_spawnMenu;