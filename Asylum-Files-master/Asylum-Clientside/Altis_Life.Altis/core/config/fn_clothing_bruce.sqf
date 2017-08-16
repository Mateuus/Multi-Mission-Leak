/*
	File: fn_clothing_bruce.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret = 
		[
			["U_C_Poloshirt_blue","Poloshirt Blue",25],
			["U_C_Poloshirt_burgundy","Poloshirt Burgundy",25],
			["U_C_Poloshirt_stripped","Poloshirt Stripped",25],
			["U_C_Poloshirt_tricolour","Poloshirt Tricolour",25],
			["U_C_Poloshirt_burgundy","Poloshirt Twitch",35,"images\c_poloshirt_twitch.jpg"],
			["U_C_Poloshirt_salmon","Poloshirt Salmon",25],
			["U_C_Poloshirt_redwhite","Poloshirt Red and White",25],
			["U_Marshal","Yellow Plaid",50,"images\marshal_yellow_plaid.jpg"],
			["U_C_Poloshirt_redwhite","Poloshirt Asylum Ent.",40,"images\c_poloshirt_asylum_red.jpg"],
			["U_C_Poor_1","Shirt Blue",25],
			["U_I_G_Story_Protagonist_F","Buttonup Black Camo",5],
			["U_I_G_resistanceLeader_F","Combat T Green",5],
			["U_NikosBody","Buttonup Red Dragon",5],
			["U_Marshal","White Shirt",5],
			["U_OrestesBody",nil,5],
			["U_C_HunterBody_grn","Hunter Cream",5],
			["U_OG_Guerilla1_1","Tan Guerilla",30],
			["U_OG_Guerilla1_1","Brown Guerilla",30,"\A3\characters_f_gamma\civil\data\c_cloth1_brown.paa"],
			["U_OG_Guerilla1_1","Metal Guerilla",30,"\A3\characters_f_gamma\civil\data\c_cloth1_black.paa"],
			["U_OG_Guerilla3_1","Hunter Tan",5],
			["U_OG_Guerilla3_2","Hunter Green",5],
			["U_IG_Guerilla2_1","Buttonup Black",5],
			["U_IG_Guerilla2_2","Buttonup Checked",5],
			["U_IG_Guerilla2_3","Buttonup Navy",50],
			["U_I_C_Soldier_Bandit_1_F",nil,30],
			["U_I_C_Soldier_Bandit_2_F",nil,30],
			["U_I_C_Soldier_Bandit_3_F",nil,30],
			["U_I_C_Soldier_Bandit_4_F",nil,30],
			["U_I_C_Soldier_Bandit_5_F",nil,30],
			["U_C_Man_casual_1_F",nil,30],
			["U_C_Man_casual_2_F",nil,30],
			["U_C_Man_casual_3_F",nil,30],
			["U_C_man_sport_1_F",nil,30],
			["U_C_man_sport_2_F",nil,30],
			["U_C_man_sport_3_F",nil,30],
			["U_C_Man_casual_4_F",nil,30],
			["U_C_Man_casual_5_F",nil,30],
			["U_C_Man_casual_6_F",nil,30]
		];
		if(1 in life_lootRewards) then
		{
			_ret set[count _ret,["U_C_Poloshirt_salmon","Troll Face Shirt",25,"images\c_poloshirt_troll.jpg"]];
		};
		if(2 in life_lootRewards) then
		{
			_ret set[count _ret,["U_C_Poloshirt_redwhite","Sorry Shirt",25,"images\c_poloshirt_officer.jpg"]];
		};
		if(3 in life_lootRewards) then
		{
			_ret pushBack ["U_C_Poloshirt_salmon","Bieber Feaver Shirt",25,"images\c_poloshirt_bieber.jpg"];
		};
		if(4 in life_lootRewards) then
		{
			_ret pushBack ["U_C_Poloshirt_redwhite","Unicorn Shirt",25,"images\c_poloshirt_unicorn.jpg"];
		};
		if(life_donator >= 1) then
		{
			_ret set[count _ret,["U_C_Poloshirt_blue","Donor Hawaiian",30,"images\c_poloshirt_flowers.jpg"]];
		};
		if(life_donator >= 5) then
		{
			_ret set[count _ret,["U_B_Protagonist_VR","Blue VR Suit",200]];
			_ret set[count _ret,["U_O_Protagonist_VR","Red VR Suit",200]];
			_ret set[count _ret,["U_I_Protagonist_VR","Green VR Suit",200]];
		};
		if (difficultyEnabledRTD) then
		{
			_ret pushBack ["U_B_HeliPilotCoveralls",nil,250];
			_ret pushBack ["U_I_HeliPilotCoveralls",nil,250];
		};
		if (life_adminlevel > 1) then 
		{
			_ret pushBack ["U_C_Poloshirt_salmon","Poloshirt ADMIN",0,"images\c_poloshirt_admin.jpg"];
		};
	};
	
	//Hats
	case 1:
	{
		_ret = 
		[
			["H_Cap_surfer",nil,5],
			["H_Cap_red",nil,5],
			["H_Cap_blu",nil,5],
			["H_Cap_oli",nil,5],
			["H_Cap_grn",nil,5],
			["H_Cap_grn_BI",nil,5],
			["H_Cap_tan",nil,5],
			["H_Cap_blk",nil,5],
			["H_Cap_headphones",nil,5],
			["H_Cap_blk_CMMG",nil,5],
			["H_Cap_blk_ION",nil,5],
			["H_Cap_oli_hs",nil,5],
			["H_Cap_press",nil,5],
			["H_Cap_usblack",nil,5],
			["H_Booniehat_grn",nil,5],
			["H_Booniehat_tan",nil,5],
			["H_Booniehat_dirty",nil,5],
			["H_Bandanna_surfer",nil,5],
			["H_Bandanna_surfer_blk",nil,5],
			["H_Bandanna_surfer_grn",nil,5],
			["H_Bandanna_khk",nil,5],
			["H_Bandanna_cbr",nil,5],
			["H_Bandanna_sgg",nil,5],
			["H_Bandanna_blu",nil,5],
			["H_Bandanna_sand",nil,5],
			["H_Bandanna_gry",nil,5],
			["H_StrawHat",nil,5],
			["H_StrawHat_dark",nil,5],
			["H_Hat_blue",nil,5],
			["H_Hat_brown",nil,5],
			["H_Hat_grey",nil,5],
			["H_Hat_tan",nil,5],
			["H_Watchcap_blk",nil,5],
			["H_Watchcap_khk",nil,5],
			["H_Watchcap_sgg",nil,5],
			["H_Watchcap_camo",nil,5],
			["H_Hat_checker",nil,5],
			["H_Helmet_Skate",nil,1500]
		];
		
		if(life_donator >= 2) then
		{
			_ret set[count _ret,["H_Beret_blk","Stylish Beret",50]];
		};	
		if(life_donator >= 4) then
		{
			_ret set[count _ret,["H_Beret_02","Executive Beret",50]];
		};
		if(life_donator >= 5) then
		{
			_ret set[count _ret,["H_Beret_Colonel","Master Beret",50]];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,2],
			["G_Shades_Blue",nil,2],
			["G_Spectacles",nil,2],
			["G_Spectacles_Tinted",nil,2],
			["G_Lady_Red",nil,10],
			["G_Lady_Blue",nil,10],
			["G_Lady_Mirror",nil,10],
			["G_Lady_Dark",nil,10],
			["G_Sport_Blackred",nil,2],
			["G_Sport_Checkered",nil,2],
			["G_Sport_Blackyellow",nil,2],
			["G_Sport_BlackWhite",nil,2],
			["G_Sport_Greenblack",nil,2],
			["G_Sport_Red",nil,2],
			["G_Squares",nil,5],
			["G_Lowprofile",nil,3],
			["G_Combat",nil,5],
			["G_Aviator",nil,15]
		];
		if(life_donator >= 5) then
		{
			_ret set[count _ret,["G_Goggles_VR",nil,50]];
		};
		if (worldName == "Australia") then
		{
			_ret = _ret + [
				["CUP_TK_NeckScarf",nil,5],
				["CUP_FR_NeckScarf",nil,5],
				["CUP_FR_NeckScarf2",nil,5]
			];
		};
	};
	
	//Vest
	case 3:
	{
		_ret = 
		[
			["V_Rangemaster_belt",nil,350],
			["V_BandollierB_cbr",nil,450],
			["V_BandollierB_khk",nil,450],
			["V_BandollierB_rgr",nil,450],
			["V_BandollierB_blk",nil,450],
			["V_BandollierB_oli",nil,450]
		];
		if (license_civ_bounty) then { _ret pushBack ["V_TacVest_blk",nil,2000] };
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_AssaultPack_blk",nil,60],
			["B_AssaultPack_cbr",nil,60],
			["B_AssaultPack_khk",nil,60],
			["B_AssaultPack_sgg",nil,60],
			["B_AssaultPack_rgr",nil,60],
			["B_FieldPack_cbr",nil,100],
			["B_FieldPack_blk",nil,100],
			["B_Kitbag_mcamo",nil,150],
			["B_Kitbag_sgg",nil,150],
			["B_Kitbag_cbr",nil,150],
			["B_Bergen_sgg",nil,150],
			["B_Carryall_oucamo",nil,250],
			["B_Carryall_khk",nil,250],
			["B_Carryall_cbr",nil,250]
		];
		if(5 in life_lootRewards) then
		{
			_ret pushBack ["B_Carryall_khk","Hiker's Backpack",250,"images\b_carryall_hiker.jpg"];
		};
		if (worldName == "Australia") then
		{
			_ret = _ret + [
				["CUP_B_SLA_Medicbag","Satchel",25],
				["CUP_B_ACRScout_m95",nil,40],
				["CUP_B_HikingPack_Civ",nil,250],
				["TRYK_B_Coyotebackpack",nil,200],
				["TRYK_B_Coyotebackpack_BLK",nil,200],
				["TRYK_B_Coyotebackpack_OD",nil,200],
				["TRYK_B_Coyotebackpack_WH",nil,200],
				["TRYK_B_Carryall_blk",nil,250],
				["TRYK_B_Carryall_wh",nil,250],
				["CUP_B_AssaultPack_Coyote",nil,60],
				["CUP_B_AssaultPack_Black",nil,60]
			];
		};
	};
};
_ret;