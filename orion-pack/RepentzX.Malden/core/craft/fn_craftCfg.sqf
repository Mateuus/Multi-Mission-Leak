#include "..\..\script_macros.hpp"

/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft","_return"];
if (!alive player) then  {
	closeDialog 0;
	_return = false;
	["You're dead",false,"slow"] call life_fnc_notificationSystem;
	} else {

_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft isEqualTo "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	case "weapon":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["hgun_Rook40_F", ["steel",2,"barrel",1,"trigger",1]],
				["hgun_Pistol_heavy_02_F", ["steel",4,"barrel",1,"trigger",1]],
				["arifle_TRG21_F", ["steel",13,"barrel",2,"trigger",1,"butt",2,"sight",1]],
				["arifle_SPAR_01_snd_F", ["steel",14,"barrel",4,"trigger",1,"butt",5,"sight",5]],
				["arifle_MXM_F", ["steel",9,"barrel",4,"trigger",1,"butt",7,"sight",5]],
				["srifle_DMR_07_ghex_F", ["steel",17,"barrel",4,"trigger",1,"butt",3,"sight",2]],
				["arifle_SPAR_02_snd_F", ["steel",14,"barrel",4,"trigger",1,"butt",3,"sight",5]]
        ];
	};

    case "vehicle":
    {
		_return = [
			];
    };

	case "uniform":
	{
         _return = [
				["U_O_Wetsuit",["cloth",5,"rubber",3]],
				["U_O_CombatUniform_oucamo",["cloth",11]]
        ];
	};

	case "backpack":
	{
        _return = [
				["B_AssaultPack_cbr",["cloth",10]],
				["B_Kitbag_mcamo",["cloth",12]],
				["B_TacticalPack_oli",["cloth",9]],
				["B_FieldPack_ocamo",["cloth",9]],
				["B_Bergen_sgg",["cloth",10]],
				["B_Kitbag_cbr",["cloth",9]],
				["B_Carryall_oli",["cloth",16]],
				["B_Carryall_khk",["cloth",16]]
			];
	};

	case "item":
	{
        _return = [
				["lockpick",["iron_refined",2]],
				["pickaxe",["iron_refined",2,"rubber",1]],
				["morphine",["rubber",1,"monsterEnergy",1]],
				["pdrill",["steel",5,"iron_refined",3]],
				["codeCracker",["rubber",5,"iron_refined",7,"trigger",1,"sight",1]],
				["butt",["iron_refined",2,"rubber",2]],
				["sight",["iron_refined",2,"steel",1]],
				["barrel",["iron_refined",2,"steel",3]],
				["trigger",["iron_refined",2]],
				["fuelFull",["iron_refined",1,"oil_processed",3]],
				["blastingcharge",["cloth",4,"C4",5,"trigger",1]],
				["goldenbarz3",["goldcoin",63,"waterBottle",7,"pliers",1,"salt_refined",13]],
				["storagesmall",["steel",10,"iron_refined",8]]
      ];
	};

    case "vest":
    {
        _return = [
				["V_PlateCarrier2_rgr",["cloth",13,"steelplate",2]],
				["V_PlateCarrierIAGL_dgtl",["cloth",16,"steelplate",3]],
				["V_HarnessOGL_gry",["cloth",28,"sulfur",21,"C4",12,"trigger",1]]
        ];
    };
    case "ammo":
    {
        _return = [
				["30Rnd_556x45_Stanag",["steel",2,"gunpowder",2]],
				["30Rnd_65x39_caseless_mag",["steel",3,"gunpowder",2]],
				["150Rnd_556x45_Drum_Mag_F",["steel",5,"gunpowder",6]],
				["20Rnd_650x39_Cased_Mag_F",["steel",4,"gunpowder",2]],
				["APERSTripMine_Wire_Mag",["steel",3,"gunpowder",8,"sulfur",8,"C4",3]]
      	];
    };

    case "attach":
    {
        _return = [
				["optic_Aco",["sight",1,"iron_refined",1]],
				["optic_Aco_grn",["sight",1,"iron_refined",1]],
				["optic_MRCO",["sight",1,"iron_refined",3]],
				["optic_MRD",["sight",1,"iron_refined",1]]
			];
		};
	};
	_return;
};
