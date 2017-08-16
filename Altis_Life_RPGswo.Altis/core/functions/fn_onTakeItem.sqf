#include "..\..\macros.hpp"
/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blocks the unit from taking something they should not have.
*/
private["_unit","_item"];

_unit = param [0,ObjNull,[ObjNull]];
_container = param [1,ObjNull,[ObjNull]];
_item = param [2,"",[""]];

//systemChat format ["DEBUG: onTakeItem _this : %1",_this];
//systemChat format ["DEBUG: onTakeItem _item: %1",_item];

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?

//systemChat format ["%1 take Item %2 from Container %3",_unit,_item,_container];

	if(!DWEV_OwnedApexDLC) then //Apex Sachen nur nutzbar wenn man Apex hat
		{
			private _ApexItemList = DWEV_SETTINGS(getArray,"ApexItemList");
			if
			(_item in _ApexItemList) then
			{
				[_item,false,false,false,false] call DWEV_fnc_handleItem;
				hint "Da du das Arma 3 APEX DLC nicht hast, kannst du dieses Item nicht nutzen und es wurde entfernt.";
			};
		};
	
	if (_item in
		[
			// Militärbug
			"acc_pointer_IR","arifle_MX_pointer_F"
		]
	) then
	{
		[_item,false,false,false,false] call DWEV_fnc_handleItem;
		hint "Dies ist kein Spielinhalt von unserem Server!";
	};
		
		
		

switch((side player)) do
{
	case west:
	{
		if (_item in ["U_BG_Guerilla2_1","U_B_CombatUniform_mcam","U_BG_Guerilla2_2","U_IG_Guerilla2_2"]) then
			{
				[player, uniform player] call DWEV_fnc_equipTextures;
			};
	
		if 
			!(_item in
				[
					// kaufbare sachen kleidung uniform
					"U_BG_Guerilla2_1","U_B_survival_uniform","U_BG_Guerilla2_2","U_B_CombatUniform_mcam","U_NikosAgedBody","U_C_Poloshirt_stripped","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poor_2","U_C_Poloshirt_burgundy","U_C_Poloshirt_tricolour","U_IG_Guerilla3_1","U_I_C_Soldier_Bandit_1_F","U_C_man_sport_3_F","U_C_Man_casual_1_F","U_C_Man_casual_2_F","U_C_Man_casual_3_F","U_C_Man_casual_4_F",
					// kaufbare sachen kleidung Kopfbedeckung
					"H_Cap_police","H_Watchcap_camo","H_HelmetSpecB_blk","H_Beret_Colonel","G_Balaclava_combat","H_Booniehat_tna_F","H_Cap_red","H_Cap_blu","H_Cap_oli","H_Cap_tan","H_Hat_brown","H_Bandanna_gry","H_Bandanna_cbr","H_Bandanna_sgg","H_BandMask_blk","H_Beret_blk_POLICE","H_MilCap_gen_F","H_HelmetLeaderO_oucamo","H_Cap_tan_Syndikat_F",
					// kaufbare sachen kleidung Brillen
					"G_Combat","G_Shades_Black","G_Diving","G_Sport_Blackred","G_Squares","G_Aviator",
					// kaufbare sachen kleidung Westen
					"V_TacVest_blk_POLICE","V_RebreatherB","V_PlateCarrier1_blk","V_PlateCarrierSpec_blk",
					// kaufbare sachen kleidung Rucksäcke
					"B_Carryall_cbr",
					// kaufbare sachen kleidung Waffenshop
					"Binocular","ItemGPS","ItemCompass","ItemRadio","Medikit","FirstAidKit","ToolKit","Rangefinder","NVGoggles_OPFOR","O_NVGoggles_urb_F","SmokeShellGreen","SmokeShellRed",
					"hgun_Pistol_heavy_01_snds_F","SMG_05_F","SMG_02_F","arifle_Mk20C_plain_F","arifle_SDAR_F","arifle_MXC_Black_F","arifle_CTAR_blk_F","arifle_SPAR_01_blk_F","arifle_MX_Black_F","arifle_Katiba_C_F","arifle_ARX_blk_F","hgun_Pistol_Signal_F","arifle_MXM_Black_F","srifle_EBR_F","srifle_DMR_03_F","arifle_SPAR_03_blk_F","SMG_01_F",
					"11Rnd_45ACP_Mag","30Rnd_9x21_Mag","30Rnd_556x45_Stanag","30Rnd_9x21_Mag_SMG_02","20Rnd_556x45_UW_mag","30Rnd_580x42_Mag_F","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_green","6Rnd_GreenSignal_F","6Rnd_RedSignal_F","30Rnd_65x39_caseless_mag_Tracer","20Rnd_762x51_Mag","30Rnd_45ACP_Mag_SMG_01",
					"optic_MRD","optic_Aco","optic_MRCO","optic_Holosight","optic_Arco_blk_F","acc_flashlight","optic_Hamr","optic_ERCO_blk_F","muzzle_snds_H","muzzle_snds_65_TI_blk_F","muzzle_snds_58_blk_F","optic_DMS","optic_SOS","optic_AMS","muzzle_snds_acp","optic_Aco_smg"
				]
			) then
			{
				[_item,false,false,false,false] call DWEV_fnc_handleItem;
				hint "Als Polizist kannst du nur das aufheben, was du auch kaufen kannst.";
			};
	};
	
	case civilian:
	{
		if (_item in ["U_C_Scientist","U_IG_Guerilla2_1","U_BG_Guerilla2_2","U_IG_Guerilla2_2"]) then
			{
				[player, uniform player] call DWEV_fnc_equipTextures;
			};
		
		if (_item in ["U_C_Poloshirt_blue","U_BG_Guerilla2_1"]) then
		{
			if (lc_girl) then
			{
				[player, uniform player] call DWEV_fnc_equipTextures;
			};
		};
		
		if (_item in ["B_Kitbag_cbr"]) then
		{	
			if (lc_girl) then
			{
			[player, backpack player] call DWEV_fnc_equipTextures;	
			};
		};

		if
			(_item in
				[
					// Polizei Euip
					"H_Cap_police","V_TacVest_blk_POLICE","V_PlateCarrierSpec_blk","Medikit","G_Balaclava_combat","U_B_CombatUniform_mcam","U_B_survival_uniform","U_BG_Guerilla2_2","H_Beret_Colonel","muzzle_snds_H","arifle_MX_Black_F","arifle_MXM_Black_F","arifle_MXC_Black_F","arifle_Mk20C_plain_F","arifle_SPAR_01_blk_F","arifle_SPAR_03_blk_F","arifle_Katiba_C_F","srifle_DMR_03_F","optic_AMS","optic_ERCO_blk_F","SmokeShellRed","hgun_Pistol_heavy_01_snds_F","arifle_ARX_blk_F","muzzle_snds_65_TI_blk_F","arifle_CTAR_blk_F","muzzle_snds_58_blk_F","H_HelmetLeaderO_oucamo","H_MilCap_gen_F","H_Beret_blk_POLICE"
				]
			) then
			{
				[_item,false,false,false,false] call DWEV_fnc_handleItem;
				hint "Ausrüstung von unseren Staatlichen Mitarbeitern darfst du als Zivilist nicht besitzen.";
			};
		
		if(__GETC__(DWEV_viplevel) < 1) then
		{
			if (_item in _VIPItemList_LvL_1) then
			{
				private _VIPItemList_LvL_1 = DWEV_SETTINGS(getArray,"VIPItemList_LvL_1");
				[_item,false,false,false,false] call DWEV_fnc_handleItem;
				hint "Da du nicht VIP Level 1 hast, darfst du dieses Item nicht nutzen und es wurde entfernt.";
			};
		};
		
		if(__GETC__(DWEV_viplevel) < 2) then
		{
			private _VIPItemList_LvL_2 = DWEV_SETTINGS(getArray,"VIPItemList_LvL_2");
			if (_item in _VIPItemList_LvL_2) then
			{
				[_item,false,false,false,false] call DWEV_fnc_handleItem;
				hint "Da du nicht VIP Level 2 hast, darfst du dieses Item nicht nutzen und es wurde entfernt.";
			};
		};
		
		if(__GETC__(DWEV_viplevel) < 3) then
		{
			private _VIPItemList_LvL_3 = DWEV_SETTINGS(getArray,"VIPItemList_LvL_3");
			if (_item in _VIPItemList_LvL_3) then
			{
				[_item,false,false,false,false] call DWEV_fnc_handleItem;
				hint "Da du nicht VIP Level 3 hast, darfst du dieses Item nicht nutzen und es wurde entfernt.";
			};
		};
		
		if(__GETC__(DWEV_viplevel) < 4) then
		{
			private _VIPItemList_LvL_4 = DWEV_SETTINGS(getArray,"VIPItemList_LvL_4");
			if (_item in _VIPItemList_LvL_4) then
			{
				[_item,false,false,false,false] call DWEV_fnc_handleItem;
				hint "Da du nicht VIP Level 4 hast, darfst du dieses Item nicht nutzen und es wurde entfernt.";
			};
		};
		
		if(__GETC__(DWEV_viplevel) < 5) then
		{
			private _VIPItemList_LvL_5 = DWEV_SETTINGS(getArray,"VIPItemList_LvL_5");
			if (_item in _VIPItemList_LvL_5) then
			{
				[_item,false,false,false,false] call DWEV_fnc_handleItem;
				hint "Da du nicht VIP Level 5 hast, darfst du dieses Item nicht nutzen und es wurde entfernt.";
			};
		};
	};
	case independent:
	{
		if (_item in ["U_IG_Guerilla2_1","U_I_Wetsuit","U_IG_Guerilla2_2"]) then
			{
				[player, uniform player] call DWEV_fnc_equipTextures;
			};
		if (_item in ["B_Kitbag_cbr"]) then
			{
				[player, backpack player] call DWEV_fnc_equipTextures;
			};
		if
			!(_item in
				[
					// kaufbare sachen kleidung uniform
					"U_IG_Guerilla2_1","U_I_Wetsuit",
					// kaufbare sachen kleidung Kopfbedeckung
					"H_Cap_red",
					// kaufbare sachen kleidung Brillen
					"G_Diving","G_Squares","G_Aviator",
					// kaufbare sachen kleidung Westen
					"V_RebreatherB",
					// kaufbare sachen kleidung Rucksäcke
					"B_Kitbag_cbr",
					// kaufbare sachen kleidung Waffenshop
					"ItemGPS","ItemCompass","ItemRadio","Binocular","ToolKit","FirstAidKit","Medikit","NVGoggles_OPFOR","O_NVGoggles_urb_F","hgun_Pistol_Signal_F","6Rnd_GreenSignal_F","6Rnd_RedSignal_F"
				]
			) then
			{
				[_item,false,false,false,false] call DWEV_fnc_handleItem;
				hint "Als Feuerwehrmann kannst du nur das aufheben, was du auch kaufen kannst.";
			};
	};
	
	case east:
	{
		if (_item in ["U_BG_Guerilla2_1","U_IG_Guerilla2_2"]) then
			{
				[player, uniform player] call DWEV_fnc_equipTextures;
			};
			
		if
			!(_item in
				[
					// kaufbare sachen kleidung uniform
					"U_BG_Guerilla2_1",
					// kaufbare sachen kleidung Kopfbedeckung
					"H_MilCap_mcamo",
					// kaufbare sachen kleidung Brillen
					"G_Combat","G_Squares","G_Aviator",
					// kaufbare sachen kleidung Westen
					"V_PlateCarrier1_blk",
					// kaufbare sachen kleidung Rucksäcke
					"B_Kitbag_cbr",
					// kaufbare sachen kleidung Waffenshop
					"Binocular","ItemGPS","ItemCompass","ItemRadio","FirstAidKit","ToolKit","NVGoggles_OPFOR","O_NVGoggles_urb_F","Rangefinder","SmokeShellGreen","hgun_Pistol_heavy_01_snds_F","SMG_02_F","arifle_Mk20C_plain_F","arifle_SDAR_F","arifle_MX_Black_F","arifle_MXC_Black_F","arifle_MXM_Black_F","srifle_EBR_F","srifle_DMR_03_F","11Rnd_45ACP_Mag",
					"30Rnd_9x21_Mag","30Rnd_556x45_Stanag","20Rnd_556x45_UW_mag","30Rnd_65x39_caseless_mag","20Rnd_762x51_Mag","optic_MRD","optic_Aco","optic_Holosight","optic_Arco","optic_Hamr","optic_MRCO","optic_DMS","optic_SOS","acc_flashlight"
				]
			) then
			{
				[_item,false,false,false,false] call DWEV_fnc_handleItem;
				hint "Als Sicherheitsmann kannst du nur das aufheben, was du auch kaufen kannst.";
			};
	};
};