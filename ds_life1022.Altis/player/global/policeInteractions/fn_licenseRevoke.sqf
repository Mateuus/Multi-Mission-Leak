/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Removes a license from a player
*/

if((player distance (_this select 1)) > 20)exitwith{};

if((_this select 0) == 0)then
	{
	hint "Your driving licenses was removed by the police";
	systemchat "Your driving licenses was removed by the police";
	DSL_car = false;
	DSL_Truck = false;
	}
	else
	{
	if((_this select 0) == 2)then
		{
		hint "Your Weapons license was removed by the police";
		systemChat "Your Weapons license was removed by the police";
		DSL_weapons = false;
		DSL_weaponsAdv = false;
		}
		else
		{
		if((_this select 0) == 3)then
			{
			hint "Your Pilots license was removed by the police";
			systemChat "Your Pilots license was removed by the police";
			DSL_air = false;
			}
			else
			{
			hint "Your Boating license was removed by the police";
			systemChat "Your Boating license was removed by the police";
			DSL_boat = false;
			};
		};
	};
[] call DS_fnc_compileData;