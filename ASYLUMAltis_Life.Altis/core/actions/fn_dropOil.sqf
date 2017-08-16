/*
	File: fn_dropOil.sqf
	Author: Alan

	Description:
	Drop oil barrel.
*/

if (isNull life_holding_barrel) exitWith { hint "You are not holding a barrel!" };

life_holding_barrel attachTo [player,[0,1,0.5]];
detach life_holding_barrel;
life_holding_barrel = objNull;
player forceWalk false;
