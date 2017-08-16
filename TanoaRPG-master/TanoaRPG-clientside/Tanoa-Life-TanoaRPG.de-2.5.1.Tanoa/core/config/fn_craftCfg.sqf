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
				["srifle_DMR_05_blk_F", ["life_inv_edelmetall",2,"life_inv_edelholz",2,"life_inv_spezialfett",2]],	//Cyrus
				["10Rnd_93x64_DMR_05_Mag", ["life_inv_schwarzpulver",1,"life_inv_messing",1]],
				["srifle_LRR_F", ["life_inv_edelmetall",3,"life_inv_edelholz",2,"life_inv_spezialfett",2]],		//M320 LRR
				["7Rnd_408_Mag", ["life_inv_schwarzpulver",1,"life_inv_messing",1]],
				["hgun_Rook40_snds_F", ["life_inv_edelmetall",1,"life_inv_plastik",1]],		//Rook Schalldämpfer
				["30Rnd_9x21_Mag", ["life_inv_messing",1]],
				["arifle_MX_SW_Black_F", ["life_inv_edelmetall",2,"life_inv_edelholz",1,"life_inv_plastik",1]],		//MX-SW Schwarz
				["100Rnd_65x39_caseless_mag", ["life_inv_schwarzpulver",1,"life_inv_messing",5]],
				["muzzle_snds_H", ["life_inv_edelmetall",1,"life_inv_spezialfett",1,"life_inv_carbon",1]],//1 Mio
				["optic_LRPS", ["life_inv_spezialglas",2,"life_inv_plastik",1,"life_inv_farbe",1]],//500k
				["optic_SOS", ["life_inv_spezialglas",2,"life_inv_plastik",1]]//500k
			];
	};

	case "uniform":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["U_IG_Guerilla1_1", ["life_inv_stoff",1,"life_inv_farbe",1]],
				["U_I_FullGhillie_sard", ["life_inv_stoff",2,"life_inv_farbe",1,"life_inv_strohpuppe",1,"life_inv_carbon",1]],
				["U_I_GhillieSuit", ["life_inv_stoff",2,"life_inv_farbe",1,"life_inv_strohpuppe",1]]
			];
	};

	case "item":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["life_inv_edelmetall", ["life_inv_ironr",10,"life_inv_glass",20]],
				["life_inv_edelholz", ["life_inv_saltr",10,"life_inv_oilu",5,"life_inv_uran",2]],
				["life_inv_carbon", ["life_inv_plastik",5,"life_inv_edelmetall",2]],
				["life_inv_plastik", ["life_inv_sand",5,"life_inv_oilu",5]],
				["life_inv_spezialglas", ["life_inv_glass",40,"life_inv_cement",5]],
				["life_inv_stoff", ["life_inv_cannabis",10,"life_inv_scalpel",1,"life_inv_rye",10]],
				["life_inv_farbe", ["life_inv_whiskey",5,"life_inv_grapes",5,"life_inv_hops",5]],
				["life_inv_messing", ["life_inv_copperr",5,"life_inv_cokep",5,"life_inv_ironr",2]],
				["life_inv_strohpuppe", ["life_inv_rye",7,"life_inv_hops",5,"life_inv_marijuana",7]],
				["life_inv_schwarzpulver", ["life_inv_blastingcharge",1,"life_inv_oilu",2,"life_inv_copperr",2]],
				["life_inv_spezialfett", ["life_inv_tuna",7,"life_inv_turtle",5,"life_inv_heroinp",2]]
		];
	};
};

_return; 