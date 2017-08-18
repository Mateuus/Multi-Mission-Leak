#include <macro.h>
/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Atlantis Apparel"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret = 
		[
			["U_C_Poloshirt_blue","Elmo",250 * life_donDis],
			["U_C_Poloshirt_burgundy","Kermit",250 * life_donDis],
			["U_C_Poloshirt_stripped","Mario",250 * life_donDis],
			["U_C_Poloshirt_tricolour","Meg",250 * life_donDis],
			["U_C_Commoner1_1","Zoidberg",250 * life_donDis],
			["U_I_G_Story_Protagonist_F","Buttonup Black Camo",500 * life_donDis],
			["U_I_G_resistanceLeader_F","Combat T Green",500 * life_donDis],
			["U_NikosBody","Buttonup Red Dragon",500 * life_donDis],
			["U_OrestesBody","Surfing On Land",500 * life_donDis],
			["U_C_HunterBody_grn","Hunter Cream",500 * life_donDis],
			["U_OG_Guerilla3_1","Hunter Tan",500 * life_donDis],
			["U_OG_Guerilla3_2","Hunter Green",500 * life_donDis],
			["U_IG_Guerilla2_1","Buttonup Black",500 * life_donDis],
			["U_IG_Guerilla2_2","Buttonup Checked",500 * life_donDis],
			["U_IG_Guerilla2_3","Buttonup Navy",500 * life_donDis]
		];

		if(__GETC__(life_donator > 0)) then
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
			["G_Spectacles_Tinted","Tinted Spectacles",55 * life_donDis]
		];
	};
	
	//Vest
	case 3:
	{
		_ret = 
		[
			["V_BandollierB_cbr",nil,4500 * life_donDis]
		];
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
			["B_Carryall_ocamo",nil,2500 * life_donDis],
			["B_Carryall_oucamo",nil,2500 * life_donDis],
			["B_Carryall_mcamo",nil,2500 * life_donDis],
			["B_Carryall_khk",nil,2500 * life_donDis],
			["B_Carryall_cbr",nil,2500 * life_donDis],
			["B_Carryall_oli","nil",4500 * life_donDis]
		];
		if((__GETC__(life_donator > 1))) then
		{
			_ret set[count _ret,["B_HuntingBackpack","Murica Bag",500 * life_donDis]];
		};
	};
};
_ret;