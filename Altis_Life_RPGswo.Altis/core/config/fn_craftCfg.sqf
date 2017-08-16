#include "..\..\macros.hpp"
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft"];
_craft = param [0,"",[""]];
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	case "weapon":
	{
		switch(true) do
		{
			if((side player) != civilian) exitWith {hint "Du bist kein Zivilist"};
			if((side player) == civilian && !lc_gun && !lc_rebel) exitWith {hint "Du brauchst die Rebellen oder Schusswaffenlizenz"};
			
		// legal + illegal
		if((side player) == civilian && lc_gun && lc_rebel) then {
			default
			{
				["Weapons",
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
						["hgun_Pistol_Signal_F", ["iron_r",5,"oilp",5,"goldberuf",5]],
						["arifle_Mk20C_F", ["iron_r",1,"uranium5",1,"diamondc",1,"goldberuf",1,"zimtp",5,"perlenk",5]],
						["arifle_MX_khk_F", ["chemikalie",4,"kevlar",1,"iron_r",7,"uranium4",2,"gussform",2,"ozelotpelz",2,"schwarzmarktoel",3]],
						["arifle_MXC_khk_F", ["chemikalie",4,"kevlar",1,"iron_r",7,"uranium4",2,"gussform",2,"ozelotpelz",2,"schwarzmarktoel",3]],
						["arifle_MXM_F", ["titan",4,"kevlar",1,"iron_r",5,"uranium4",2,"gussform",2,"stoff",2,"schwarzmarktoel",3]],
						["arifle_MXM_khk_F", ["titan",4,"kevlar",1,"iron_r",5,"uranium4",2,"gussform",2,"ozelotpelz",2,"schwarzmarktoel",3]],
						["hgun_P07_khk_F", ["titan",1,"iron_r",10,"gussform",1,"schwarzmarktoel",1]],
						["muzzle_snds_H_khk_F", ["gussform",3,"titan",6,"kevlar",1,"kraftriegel",1,"chemikalie",2,"schwarzmarktoel",2]],
						["muzzle_snds_H_snd_F", ["gussform",3,"titan",6,"kevlar",1,"kraftriegel",1,"chemikalie",2,"schwarzmarktoel",2]],
						["muzzle_snds_65_TI_ghex_F", ["gussform",3,"titan",6,"kevlar",1,"kraftriegel",1,"chemikalie",2,"schwarzmarktoel",2]],
						["muzzle_snds_65_TI_hex_F", ["gussform",3,"titan",6,"kevlar",1,"kraftriegel",1,"chemikalie",2,"schwarzmarktoel",2]],
						["muzzle_snds_58_hex_F", ["gussform",3,"titan",6,"kevlar",1,"kraftriegel",1,"chemikalie",2,"schwarzmarktoel",2]],
						["muzzle_snds_58_ghex_F", ["gussform",3,"titan",6,"kevlar",1,"kraftriegel",1,"chemikalie",2,"schwarzmarktoel",2]],
						["SmokeShellBlue", ["farbeblau",5,"chemikalie",4,"titan",3,"gussform",3,"redshot",2]],
						["optic_AMS_khk", ["titan",4,"gussform",2,"ozelotpelz",2,"iron_r",7,"glass",15]],
						["optic_AMS_snd", ["titan",4,"gussform",2,"ozelotpelz",2,"iron_r",7,"glass",15]]
					]
				];
			};
		};
		
		// legal
		if((side player) == civilian && lc_gun && !lc_rebel) then { 
			default
			{
				["Weapons",
					[
						["hgun_Pistol_Signal_F", ["iron_r",5,"oilp",5,"goldberuf",5]]
					]
				];
			};
		};
		
		// illegal
		if((side player) == civilian && !lc_gun && lc_rebel) then { 
			default
			{
				["Weapons",
					[
						["arifle_Mk20C_F", ["iron_r",1,"uranium5",1,"diamondc",1,"goldberuf",1,"zimtp",5,"perlenk",5]],
						["arifle_MX_khk_F", ["chemikalie",4,"kevlar",1,"iron_r",7,"uranium4",2,"gussform",2,"ozelotpelz",2,"schwarzmarktoel",3]],
						["arifle_MXC_khk_F", ["chemikalie",4,"kevlar",1,"iron_r",7,"uranium4",2,"gussform",2,"ozelotpelz",2,"schwarzmarktoel",3]],
						["arifle_MXM_F", ["titan",4,"kevlar",1,"iron_r",5,"uranium4",2,"gussform",2,"stoff",2,"schwarzmarktoel",3]],
						["arifle_MXM_khk_F", ["titan",4,"kevlar",1,"iron_r",5,"uranium4",2,"gussform",2,"ozelotpelz",2,"schwarzmarktoel",3]],
						["hgun_P07_khk_F", ["titan",1,"iron_r",10,"gussform",1,"schwarzmarktoel",1]],
						["muzzle_snds_H_khk_F", ["gussform",3,"titan",6,"kevlar",1,"kraftriegel",1,"chemikalie",2,"schwarzmarktoel",2]],
						["muzzle_snds_H_snd_F", ["gussform",3,"titan",6,"kevlar",1,"kraftriegel",1,"chemikalie",2,"schwarzmarktoel",2]],
						["muzzle_snds_65_TI_ghex_F", ["gussform",3,"titan",6,"kevlar",1,"kraftriegel",1,"chemikalie",2,"schwarzmarktoel",2]],
						["muzzle_snds_65_TI_hex_F", ["gussform",3,"titan",6,"kevlar",1,"kraftriegel",1,"chemikalie",2,"schwarzmarktoel",2]],
						["muzzle_snds_58_hex_F", ["gussform",3,"titan",6,"kevlar",1,"kraftriegel",1,"chemikalie",2,"schwarzmarktoel",2]],
						["muzzle_snds_58_ghex_F", ["gussform",3,"titan",6,"kevlar",1,"kraftriegel",1,"chemikalie",2,"schwarzmarktoel",2]],
						["SmokeShellBlue", ["farbeblau",5,"chemikalie",4,"titan",3,"gussform",3,"redshot",2]],
						["optic_AMS_khk", ["titan",4,"gussform",2,"ozelotpelz",2,"iron_r",7,"glass",15]],
						["optic_AMS_snd", ["titan",4,"gussform",2,"ozelotpelz",2,"iron_r",7,"glass",15]]
					]
				];
			};
		};		
		};
	};

	case "uniform":
	{
		switch(true) do
		{
			default
			{
				["Clothes",
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
						//["U_IG_Guerilla1_1", ["goldbar",1]]
					]
				];
			};
		};
	};

	case "backpack":
	{
		switch(true) do
		{
			default
			{
				["Backpacks",
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
						//["B_Carryall_oli", ["goldbar",1]] //rucksack ist aufblacklist, standard hacker rucksack
						["B_Bergen_mcamo_F", 	["goldbar",2,"uranium5",3,"stoff",4,"ring",2,"kartoffelp",1,"ozelotpelz",2,"verband",2]], // APEX RIESEN RUCKSACK 104 PLATZ
						["B_Bergen_tna_F",  	["goldbar",2,"uranium5",3,"stoff",4,"ring",2,"kartoffelp",1,"ozelotpelz",2,"verband",2]], // APEX RIESEN RUCKSACK 104 PLATZ
						["B_Bergen_hex_F",  	["goldbar",2,"uranium5",3,"stoff",4,"ring",2,"kartoffelp",1,"ozelotpelz",2,"verband",2]] // APEX RIESEN RUCKSACK 104 PLATZ
					]
				];
			};
		};
	};

	case "item":
	{
		switch(true) do
		{
			default
			{
				["Items",
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
						["storagesmall", 	["copper_r",3,"iron_r",6,"cement",2,"goldberuf",3,"silberbar",3,"stoff",1]],
						["storagebig", 	["copper_r",3,"iron_r",6,"cement",2,"goldberuf",3,"silberbar",3,"stoff",2]]
					]
				];
			};
		};
	};
};