#include <macro.h>
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft","_return"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	case "weapon":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["hgun_Rook40_F", ["life_inv_handgrip",1,"life_inv_trigger",1,"life_inv_chamber",1,"life_inv_ironr",2]],
				["16Rnd_9x21_Mag", ["life_inv_9mmCase",1,"life_inv_9mmBullet",1,"life_inv_primer",1,"life_inv_gunpowder",1]]

			];
		if(__GETC__(life_adminlevel) > 0) then
		{
				_return pushBack
				["SMG_01_F", ["life_inv_goldbar",6,"life_inv_copperr",3,"life_inv_ironr",3,"life_inv_diamondr",1]];
		};
	};

	case "uniform":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["U_IG_Guerilla1_1", ["life_inv_goldbar",1]]
			];
	};
	
	case "headgear":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["H_Hat_blue", ["life_inv_goldbar",1]]
			];
	};
	
	case "goggles":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["G_Aviator", ["life_inv_goldbar",1]]
			];
	};

	case "backpack":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["B_Carryall_oli", ["life_inv_goldbar",1]]
			];
	};

	case "item":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["life_inv_pickaxe", ["life_inv_goldbar",1]],
				["life_inv_goldbar", ["life_inv_goldbarp",4]]
		];
	};
};

_return; 