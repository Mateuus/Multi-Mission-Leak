/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Removes a license from a player
*/

if((_this select 0) == 0)then
	{
	hint "Your car license was removed by the police";
	systemchat "Your car license was removed by the police";
	DSL_car = false;
	}
	else
	{
	if((_this select 0) == 2)then
		{
		hint "You Weapons license was removed by the police";
		systemChat "Your Weapons license was removed by the police";
		DSL_weapons = false;
		}
		else
		{
		hint "You Pilots license was removed by the police";
		systemChat "Your Pilots license was removed by the police";
		DSL_air = false;
		};
	};
[] call DS_fnc_compileData;