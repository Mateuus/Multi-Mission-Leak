#include <macro.h>

/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft","_return","_craftSites"];
if(!((player distance (getMarkerPos "CraftingArea1") < 10) OR  (player distance (getMarkerPos "CraftingArea2") < 10) OR  (player distance (getMarkerPos "CraftingArea3") < 10))) then  {
	closeDialog 0;
	_return = false;
	hint "How can I do this without the right tools? Go to a crafting zone";
	} else {
		
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

_craftSites = ["CraftingArea1","CraftingArea2","CraftingArea3"];

switch(_craft) do
{
	case "weapon":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["hgun_Rook40_F", ["iron_refined",7]],
				["hgun_Pistol_heavy_02_F", ["iron_refined",12]],
				["CUP_hgun_MicroUzi", ["iron_refined",22]],
				["arifle_TRG21_F", ["iron_refined",17,"copper_refined",7]],
                ["rhs_weap_akm", ["iron_refined",13,"copper_refined",16]]
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
				["MEC_dishda_black",["fabric",10]],
				["MEC_dishdaw_des_jacket",["fabric",11]],
				["U_IG_Guerilla2_3",["fabric",9]],
				["U_C_WorkerCoveralls",["fabric",13]],
				["U_OrestesBody",["fabric",8]],
				["U_C_Poloshirt_tricolour",["fabric",4]],
				["U_I_GhillieSuit",["fabric",25,"wood",2]]
            ];
	};

	case "backpack":
	{
        _return = [
				["B_AssaultPack_cbr",["fabric",10]],
                ["B_Kitbag_mcamo",["fabric",12]],
                ["B_TacticalPack_oli",["fabric",9]],
                ["B_FieldPack_ocamo",["fabric",9]],
                ["B_Bergen_sgg",["fabric",16]],
                ["B_Kitbag_cbr",["fabric",9]],
                ["B_Carryall_oli",["fabric",16]],
                ["B_Carryall_khk",["fabric",16]]
			];
	};

	case "item":
	{
        _return = [
                ["lockpick",["iron_refined",1]],
                ["pickaxe",["iron_refined",2,"wood",1]],
				["fuelFull",["iron_refined",2,"gas_processed",6]],
				["blastingcharge",["iron_refined",2,"oil_heavy",1]],
				["chainsaw",["iron_refined",3,"gas_processed",6]],
				["storagesmall",["lumber",13,"iron_refined",6]]
            ];
	};
    
    case "vest":
    {
        _return = [
				["V_Rangemaster_belt",["fabric",5]],
                ["V_BandollierB_khk",["fabric",10,"iron_refined",2]],
                ["V_HarnessO_gry",["fabric",12,"iron_refined",2]],
                ["v_tacvest_brn",["fabric",9,"iron_refined",1]],
                ["V_HarnessO_brn",["fabric",9,"iron_refined",1]],        
                ["V_PlateCarrierL_CTRG",["fabric",16,"iron_refined",9]],
				["SuicideVest",["fabric",8,"gas_processed",9,"iron_refined",6,"blastingCharge",1]]  
            ];
    };
    
    case "ammo":
    {
        _return = [
                ["CUP_30Rnd_9x19_UZI",["iron_refined",2]],
                ["6Rnd_45ACP_Cylinder",["iron_refined",1]],
                ["30Rnd_556x45_Stanag_Tracer_Yellow",["iron_refined",3]],
                ["16Rnd_9x21_Mag",["iron_refined",2]],
                ["rhs_30Rnd_762x39mm",["iron_refined",4]]
            ];
    };
    
    case "attach":
    {
        _return = [
                ["optic_Aco",["iron_refined",1,"glass",1]],
                ["optic_Aco_grn",["iron_refined",1,"glass",1]],
                ["optic_MRCO",["iron_refined",2,"glass",3]],
                ["optic_MRD",["iron_refined",1,"glass",1]],
                ["FirstAidKit",["fabric",3]],
				["ToolKit",["fabric",3,"iron_refined",4]]
			];
		};
	};
	_return; 
};