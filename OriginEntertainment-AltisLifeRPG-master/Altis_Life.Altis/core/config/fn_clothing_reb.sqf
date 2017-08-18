#include <macro.h>
/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Rebel Clothing Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret = 
		[
			["U_B_GhillieSuit","Ghillie Suit [NATO]",500 * life_donDis],
			["U_O_GhillieSuit","Ghillie Suit [CSAT]",500 * life_donDis],
			["U_I_GhillieSuit","Ghillie Suit [AAF]",500 * life_donDis],
			["U_O_PilotCoveralls","Pilot Coveralls [CSAT]",500 * life_donDis],
			["U_O_CombatUniform_ocamo","Fatigues (Hex) [CSAT]",500 * life_donDis],
			["U_O_CombatUniform_oucamo","Fatigues (Urban) [CSAT]",500 * life_donDis],
			["U_O_SpecopsUniform_ocamo","Recon Fatigues (Hex)",500 * life_donDis],
			["U_BG_leader","Guerilla Smocks 1",500 * life_donDis],
			["U_I_CombatUniform_tshirt","Combat Fatigues [AAF] (Tee)",500 * life_donDis],				
			["U_O_OfficerUniform_ocamo","Officer Fatigues (Hex)",500 * life_donDis],
			["U_I_OfficerUniform","Combat Fatigues [AAF] (Tee)",500 * life_donDis]

		];

		if((__GETC__(life_donator > 0))) then
		{
			_ret set[count _ret,["U_C_Driver_1_black","Black Racing Uniform",500 * life_donDis]];
			_ret set[count _ret,["U_C_Driver_1_blue","Blue Racing Uniform",500 * life_donDis]];
			_ret set[count _ret,["U_C_Driver_1_red","Red Racing Uniform",500 * life_donDis]];
			_ret set[count _ret,["U_C_Driver_1_orange","Orange Racing Uniform",500 * life_donDis]];
			_ret set[count _ret,["U_C_Driver_1_green","Green Racing Uniform",500 * life_donDis]];
			_ret set[count _ret,["U_C_Driver_1_white","White Racing Uniform",500 * life_donDis]];
			_ret set[count _ret,["U_C_Driver_1_yellow","White Racing Uniform",500 * life_donDis]];
			_ret set[count _ret,["U_C_Driver_2",nil,500 * life_donDis]];
			_ret set[count _ret,["U_C_Driver_1",nil,500 * life_donDis]];
			_ret set[count _ret,["U_C_Driver_3",nil,500 * life_donDis]];
			_ret set[count _ret,["U_C_Driver_4",nil,500 * life_donDis]];
		};
		if((__GETC__(life_donator > 1))) then
		{
			_ret set[count _ret,["U_C_Commoner1_2","FistShirt",1000 * life_donDis]];
		};
		if((__GETC__(life_donator > 4))) then
		{
			_ret set[count _ret,["U_B_Protagonist_VR","VR Suit Blue",1000 * life_donDis]];
			_ret set[count _ret,["U_O_Protagonist_VR","VR Suit Red",1000 * life_donDis]];
			_ret set[count _ret,["U_I_Protagonist_VR","VR Suit Green",1000 * life_donDis]];
		};
	};
	
	//Hats
	case 1:
	{
		_ret = 
		[
			["H_HelmetB_camo","ECH (Camo)",15000 * life_donDis],
			["H_Shemag_khk","Shemag mask (Khaki)",500 * life_donDis],
			["H_Shemag_tan","Shemag mask (Tan)",500 * life_donDis],
			["H_Shemag_olive","Shemag (Olive)",500 * life_donDis],
			["H_ShemagOpen_khk","Shemag (Khaki)",500 * life_donDis],
			["H_ShemagOpen_tan","Shemag (Tan)",500 * life_donDis],
			["H_Hat_camo","Hat (Camo)", 500 * life_donDis],
			["H_Shemag_olive_hs","Shemag (Olive,Headset)",500 * life_donDis],
			["H_Cap_red",nil,50 * life_donDis],
			["H_Cap_blu",nil,50 * life_donDis],
			["H_Cap_oli",nil,50 * life_donDis],
			["H_Cap_grn",nil,50 * life_donDis],
			["H_Cap_tan",nil,50 * life_donDis],
			["H_Cap_blk",nil,50 * life_donDis],
			["H_Cap_blk_CMMG",nil,50 * life_donDis],
			["H_Cap_blk_ION",nil,50 * life_donDis],
			["H_Booniehat_grn",nil,50 * life_donDis],
			["H_Booniehat_tan",nil,50 * life_donDis],
			["H_Booniehat_dirty",nil,50 * life_donDis],
			["H_Bandanna_surfer",nil,50 * life_donDis],
			["H_Bandanna_khk",nil,50 * life_donDis],
			["H_Bandanna_cbr",nil,50 * life_donDis],
			["H_Bandanna_sgg",nil,50 * life_donDis],
			["H_Bandanna_gry",nil,50 * life_donDis],
			["H_StrawHat",nil,50 * life_donDis],
			["H_StrawHat_dark",nil,50 * life_donDis],
			["H_Hat_blue",nil,50 * life_donDis],
			["H_Hat_brown",nil,50 * life_donDis],
			["H_Hat_grey",nil,50 * life_donDis],
			["H_Watchcap_blk",nil,50 * life_donDis],
			["H_Watchcap_khk",nil,50 * life_donDis],
			["H_Watchcap_sgg",nil,50 * life_donDis],
			["H_Watchcap_camo",nil,50 * life_donDis],
			["H_Hat_checker",nil,50]
		];

		if((__GETC__(life_donator > 0))) then
		{
			_ret set[count _ret,["H_RacingHelmet_1_black_F","Black Racing Helmet",500 * life_donDis]];
			_ret set[count _ret,["H_RacingHelmet_1_red_F","Red Racing Helmet",500 * life_donDis]];
			_ret set[count _ret,["H_RacingHelmet_1_white_F","White Racing Helmet",500 * life_donDis]];
			_ret set[count _ret,["H_RacingHelmet_1_blue_F","Blue Racing Helmet",500 * life_donDis]];
			_ret set[count _ret,["H_RacingHelmet_1_yellow_F","Yellow Racing Helmet",500 * life_donDis]];
			_ret set[count _ret,["H_RacingHelmet_1_green_F","Green Racing Helmet",500 * life_donDis]];
			_ret set[count _ret,["H_RacingHelmet_1_F",nil,500 * life_donDis]];
			_ret set[count _ret,["H_RacingHelmet_2_F",nil,500 * life_donDis]];
			_ret set[count _ret,["H_RacingHelmet_3_F",nil,500 * life_donDis]];
			_ret set[count _ret,["H_RacingHelmet_4_F",nil,500 * life_donDis]];
		};		
		if((__GETC__(life_donator > 1))) then
		{
			_ret set[count _ret,["H_Cap_headphones","Hat with Headphones",500 * life_donDis]];
			_ret set[count _ret,["H_Cap_marshal","Hat with Headphones2",500 * life_donDis]];
		};
		if((__GETC__(life_donator > 2))) then
		{
			_ret set[count _ret,["H_Beret_blk","Beret (Black)",500 * life_donDis]];
		};
		if((__GETC__(life_donator > 3))) then
		{
			_ret set[count _ret,["H_PilotHelmetFighter_O","Pilot Helmet [CSAT]",15000 * life_donDis]];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25 * life_donDis],
			["G_Shades_Blue",nil,20 * life_donDis],
			["G_Sport_Blackred",nil,20 * life_donDis],
			["G_Sport_Checkered",nil,20 * life_donDis],
			["G_Sport_Blackyellow",nil,20 * life_donDis],
			["G_Sport_BlackWhite",nil,20 * life_donDis],
			["G_Sport_Red",nil,20 * life_donDis],
			["G_Sport_Greenblack",nil,20 * life_donDis],
			["G_Squares",nil,10 * life_donDis],
			["G_Aviator",nil,100 * life_donDis],
			["G_Lady_Mirror",nil,150 * life_donDis],
			["G_Lady_Dark",nil,150 * life_donDis],
			["G_Lady_Blue",nil,150 * life_donDis],
			["G_Lowprofile",nil,30 * life_donDis],
			["G_Combat",nil,55 * life_donDis],
			["G_Spectacles_Tinted","Tinted Spectacles",55 * life_donDis],
			["G_Balaclava_blk",nil,500 * life_donDis],
			["G_Balaclava_combat",nil,500 * life_donDis],
			["G_Balaclava_lowprofile",nil,500 * life_donDis],
			["G_Balaclava_oli",nil,500 * life_donDis],
			["G_Bandanna_aviator",nil,500 * life_donDis],
			["G_Bandanna_beast",nil,500 * life_donDis],
			["G_Bandanna_blk",nil,500 * life_donDis],
			["G_Bandanna_khk",nil,500 * life_donDis],
			["G_Bandanna_oli",nil,500 * life_donDis],
			["G_Bandanna_shades",nil,500 * life_donDis],
			["G_Bandanna_sport",nil,500 * life_donDis],
			["G_Bandanna_tan",nil,500 * life_donDis]
		];
	};
	
	//Vest
	case 3:
	{
		_ret = 
		[
			["V_Chestrig_khk","Chest rig (Khaki)",25000 * life_donDis],
			["V_Chestrig_rgr","Chest rig (Green)",25000 * life_donDis],
			["V_Chestrig_oli","Chest rig (Olive)",25000 * life_donDis],
			["V_TacVest_khk","Tactical Vest (Khaki)",25000 * life_donDis],
			["V_TacVest_brn","Tactical Vest (Brown)",25000 * life_donDis],
			["V_TacVest_oli","Tactical Vest (Olive)",25000 * life_donDis],
			["V_TacVest_camo","Tactical Vest (Camo)",25000 * life_donDis],
			["V_HarnessO_brn","TLBV Harness",25000 * life_donDis],
			["V_TacVest_brn","Tactical Vest (Brown))",25000 * life_donDis]
			//["V_HarnessOGL_brn","Suicide Vest",600000 * life_donDis]

		];

		if((__GETC__(life_donator > 3))) then
		{
			_ret set[count _ret,["V_PlateCarrierIAGL_dgtl","GA Carrier GL Rig (Digi)",25000 * life_donDis]];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret = 
		[
			["B_AssaultPack_blk",nil,600 * life_donDis],
			["B_AssaultPack_cbr",nil,600 * life_donDis],
			["B_AssaultPack_khk",nil,600 * life_donDis],
			["B_AssaultPack_sgg",nil,600 * life_donDis],
			["B_AssaultPack_rgr",nil,600 * life_donDis],
			["B_FieldPack_cbr",nil,1000 * life_donDis],
			["B_FieldPack_blk",nil,1000 * life_donDis],
			["B_Kitbag_mcamo",nil,1500 * life_donDis],
			["B_Kitbag_sgg",nil,1500 * life_donDis],
			["B_Kitbag_cbr",nil,1500 * life_donDis],
			["B_Bergen_sgg",nil,1500 * life_donDis],
			["B_Carryall_oucamo",nil,2500 * life_donDis],
			["B_Carryall_ocamo",nil,2500 * life_donDis],
			["B_Carryall_oucamo",nil,2500 * life_donDis],
			["B_Carryall_mcamo",nil,2500 * life_donDis],
			["B_Carryall_khk",nil,2500 * life_donDis],
			["B_Carryall_cbr",nil,2500 * life_donDis],
			["B_Carryall_oli",nil,2500 * life_donDis]
		];
	};
};
_ret;