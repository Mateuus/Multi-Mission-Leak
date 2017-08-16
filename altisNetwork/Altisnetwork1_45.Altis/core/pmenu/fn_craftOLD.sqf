#include "..\..\script_macros.hpp"
/*
 File: fn_craftCfg.sqf
 Author: EdgeKiller
 Description:
 Master configuration file for the crafting menu.
*/
private["_craft","_return"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.
switch(_craft) do {
	case "weapon": {
	_return = [
		["srifle_EBR_ACO_F", ["gunmetal",20,"glass",10,"woodplanks",10,"spring",5]],
		["20Rnd_762x51_Mag", ["spring",1,"gunmetal",2]]
	];
	if(FETCH_CONST(life_adminlevel) > 0) then {
	_return pushBack
		["SMG_01_F", ["silverp",3,"glass",3,"iron_refined",1]];
	};
 };
 
	case "uniform": {
	_return = [
		["U_I_GhillieSuit", ["hemp",20,"gunmetal",5]],
		["U_B_GhillieSuit", ["hemp",20,"gunmetal",5]]
	];
	};
	case "backpack": {
	_return = [
		["B_Carryall_oli", ["hemp",25,"iron_refined",2]],
		["B_Bergen_dgtl_F", ["hemp",30,"iron_refined",10,"gunmetal",10]]
	];
	};
	case "item": {
	_return = [
		["iron_refined", ["copper_refined",2]],
		["diamond_cut", ["copper_refined",1,"iron_refined",1]],
		["spring", ["gunmetal",2]]
		];
	};
};
_return;