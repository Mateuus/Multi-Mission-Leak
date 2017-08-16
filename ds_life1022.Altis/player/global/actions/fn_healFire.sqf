/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Simply heals the player while near a camp fire
*/

private ["_fire"];

_fire = (nearestObjects [player, ["Land_Campfire_F"],  5] select 0);

if(inflamed _fire)then
	{
	titleText["Healing at the fire...","PLAIN"];
	sleep 5;
	titleText["You have been healed","PLAIN"];
	player setdamage 0;
	}
	else
	{
	titleText["You need to light the fire to heal at it...","PLAIN"];
	};