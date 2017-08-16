/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Simply heals the player while near a camp fire
*/

private ["_fire"];

_fire = (nearestobjects [getpos player, ["Land_Campfire_F"],  5] select 0);



if(inflamed _fire)then
	{
	titleText["Healing at the fire.....","PLAIN"];
	sleep 5;
	titleText["You have been healed","PLAIN"];
	player setdamage 0;
	if((DS_infoArray select 13) == 21)then
		{
		[0] call DS_fnc_questCompleted;
		};
	}
	else
	{
	titleText["You need to light the fire to heal at it.....","PLAIN"];
	};
