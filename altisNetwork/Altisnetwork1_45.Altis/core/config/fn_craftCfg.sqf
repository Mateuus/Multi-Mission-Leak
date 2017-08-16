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
		["srifle_EBR_ACO_F", ["riflebody",1,"riflebarrel",1,"spring",5,"riflestock",1]],
		["20Rnd_762x51_Mag", ["spring",1,"gunmetal",2]],
		["hgun_Pistol_heavy_01_F", ["pistolbody",1,"pistolbarrel",1,"spring",1]],
		["11Rnd_45ACP_Mag", ["spring",1,"gunmetal",1]]
	];
	if(FETCH_CONST(life_adminlevel) > 0) then {
	_return pushBack
		["SMG_05_F", ["silverp",3,"glass",3,"copper_refined",33]];
	};
 };
 case "Rifle parts": {
	_return = [
		["riflebody", ["gunmetal",20,"woodplanks",10]],
		["riflebarrel", ["gunmetal",10,"iron_refined",10,"copper_refined",2]],
		["riflestock", ["gunmetal",10,"iron_refined",5]]
	];
	};
	case "Pistol parts": {
	_return = [
		["pistolbody", ["gunmetal",5,"woodplanks",4]],
		["pistolbarrel", ["gunmetal",5,"woodplanks",4,"copper_refined",2]]
	];
	};
 	case "uniform": {
	_return = [
		["U_I_GhillieSuit", ["hemp",50,"gunmetal",10]],
		["U_B_GhillieSuit", ["hemp",50,"gunmetal",10]]
	];
	};
	case "backpack": {
	_return = [
		["B_Carryall_oli", ["hemp",50,"iron_refined",10]],
		["B_Bergen_dgtl_F", ["hemp",60,"iron_refined",10,"gunmetal",10]]
	];
	};
	case "item": {
	_return = [
		["iron_refined", ["copper_refined",2]],
		["diamond_cut", ["copper_refined",1,"iron_refined",1]],
		["gunmetal", ["copper_refined",2,"iron_refined",2]],
		["riflebody", ["gunmetal",20,"woodplanks",10]],
		["riflebarrel", ["gunmetal",10,"iron_refined",10]],
		["riflestock", ["woodplanks",10,"iron_refined",2]],
		["pistolbody", ["gunmetal",5,"woodplanks",4]],
		["pistolbarrel", ["gunmetal",2,"iron_refined",2]],
		["spring", ["iron_refined",2]]
		];
	};
};
_return;