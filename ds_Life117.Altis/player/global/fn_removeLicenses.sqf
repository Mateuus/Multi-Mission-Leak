/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Removes players licenses based on different circumstances
*/

private ["_type"];

_type = _this select 0;

switch(_type)do
	{
	case 0://Released from jail
		{
		DSL_weapons = false;
		DSL_rebel = false;
		DSL_rebelVeh = false;
		DSL_rebelAdv = false;
		DSL_heroin = false;
		DSL_marijuana = false;
		DSL_coke = false;
		DSL_relic = false;
		DSL_weaponAdv = false;
		};
	};