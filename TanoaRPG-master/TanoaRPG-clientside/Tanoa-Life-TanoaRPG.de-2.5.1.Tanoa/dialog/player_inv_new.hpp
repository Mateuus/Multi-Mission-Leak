#include "player_sys.sqf"
/*
	File: fn_adminSearch.sqf
	Author: CooliMC "Marc"
	
	Description:
	Search for Name/PID/GUID
	YOU ARE NOT ALLOWED TO STEEL IT !!!!
*/
class playerBackpack {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground {
	
		class Background_Picture:Life_RscPicture {
			idc = -1;
			text = "textures\RucksackCiv.paa";
			x = -0.3;
			y = -0.3;
			w = 1.6;
			h = 1.6;
		};
		
		class moneyStatusInfo : Life_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = -0.2;
			y = 0.18;
			w = 0.3;
			h = 0.6;
		};
	};
	
	class controls {
		
		class itemHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_cItems";
			sizeEx = 0.04;
			
			x = 0.27;
			y = 0.1;
			w = 0.16;
			h = 0.06;
		};
		
		class weightHeader : Life_RscText
		{
			idc = carry_weight;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.04;
			
			x = 0.43;
			y = 0.1;
			w = 0.19;
			h = 0.06;
		};
		
		class moneySHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_MoneyStats";
			sizeEx = 0.04;
			
			x = -0.2;
			y = 0.1;
			w = 0.3;
			h = 0.06;
		};
	
		class itemList : life_RscListBox 
		{
			idc = item_list;
			sizeEx = 0.030;
			
			x = 0.27;
			y = 0.17;
			w = 0.35;
			h = 0.27;
		};
		
		class moneyEdit : Life_RscEdit 
		{
			idc = 2018;
			
			text = "1";
			sizeEx = 0.030;
			x = -0.2;
			y = 0.3;
			w = 0.3;
			h = 0.05;
		};
		
		class NearPlayers : Life_RscCombo 
		{
			idc = 2022;
		
			x = -0.2;
			y = 0.37;
			w = 0.3;
			h = 0.05;
		};
		
		class moneyDrop : Life_RscButtonMenu
		{
			idc = 2001;
			text = "$STR_Global_Give";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call tanoarpg_fnc_giveMoney";
			sizeEx = 0.025;
			x = -0.2;
			y = 0.43;
			w = 0.3;
			h = 0.05;
		};
		
		class itemEdit : Life_RscEdit
		{
			idc = item_edit;
		
			text = "1";
			sizeEx = 0.030;
			x = 0.27;
			y = 0.45;
			w = 0.35;
			h = 0.05;
		};
		
		class iNearPlayers : Life_RscCombo
		{
			idc = 2023;
			
			x = 0.27;
			y = 0.51;
			w = 0.35;
			h = 0.05;
		};
		
		class DropButton : life_RscButtonMenu
		{
			idc = 2002;
			text = "$STR_Global_Give";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call tanoarpg_fnc_giveItem;";
			
			x = 0.39;
			y = 0.63;
			w = 0.23;
			h = 0.05;
			
		};
		
		class UseButton : life_RscButtonMenu {
			
			text = "$STR_Global_Use";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call tanoarpg_fnc_useItem;";
			
			x = 0.27;
			y = 0.57;
			w = 0.17;
			h = 0.05;
			
		};
		
		class RemoveButton : life_RscButtonMenu {
			
			text = "$STR_Global_Remove";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call tanoarpg_fnc_removeItem;";
			
			x = 0.45;
			y = 0.57;
			w = 0.17;
			h = 0.05;
			
		};
		
		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.33;
			y = 0.752;
			w = 0.15;
			h = 0.038;
		};
		
		class ButtonSettings : life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Settings";
			onButtonClick = "[] call tanoarpg_fnc_settingsMenu;";
			x = 1.105;
			y = 0.225;
			w = 0.15;
			h = 0.038;
		};
		
		class ButtonMyGang : Life_RscButtonMenu {
			idc = 2011;
			text = "$STR_PM_MyGang";
			onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn tanoarpg_fnc_gangMenu;};};";
			x = 0.362;
			y = 0.906;
			w = 0.15;
			h = 0.038;
		};
		
		class ButtonLicenses : Life_RscButtonMenu {
			idc = 2013;
			text = "$STR_PM_Licenses";
			onButtonClick = "createDialog ""life_licenses_menu""; [] spawn tanoarpg_fnc_p_updateLicenses;";
			x = 0.797;
			y = 0.17;
			w = 0.155;
			h = 0.037;
		};
		
		class ButtonKeys : Life_RscButtonMenu {
			idc = 2013;
			text = "$STR_PM_KeyChain";
			onButtonClick = "createDialog ""Life_key_management"";";
			x = 1.09;
			y = 0.557;
			w = 0.155;
			h = 0.037;
		};
		
		class ButtonCell : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_PM_CellPhone";
			onButtonClick = "[] call tanoarpg_fnc_callCellPhone";
			x = 0.777;
			y = 0.65;
			w = 0.125;
			h = 0.038;
		};
		
		class ButtonSyncData : life_RscButtonMenu {
			idc = -1;
			text = "$STR_PM_SyncData";
			onButtonClick = "[] call XAS_fnc_syncData;";
			x = -0.02;
			y = 0.781;
			w = 0.13;
			h = 0.038;
		};
		
		class ButtonAdminMenu : Life_RscButtonMenu {
			idc = 2021;
			text = "$STR_PM_AdminMenu";
			onButtonClick = "createDialog ""life_admin_menu"";";
			x = -0.2;
			y = 0.57;
			w = 0.3;
			h = 0.05;
		};
		
		class ButtonModMenu : Life_RscButtonMenu {
			idc = 2024;
			text = "$STR_PM_ModMenu";
			onButtonClick = "createDialog ""life_moderator_menu"";";
			x = -0.2;
			y = 0.57;
			w = 0.3;
			h = 0.05;
		};
		
		class ButtonSupportMenu : Life_RscButtonMenu {
			idc = 2020;
			text = "$STR_PM_SupportMenu";
			onButtonClick = "createDialog ""life_support_menu"";";
			x = -0.2;
			y = 0.57;
			w = 0.3;
			h = 0.05;
		};
		
		class ButtonCraft : Life_RscButtonMenu {
			idc = 2025;
			text = "$STR_PM_Craft";
			onButtonClick = "createDialog ""Life_craft"";";
			x = 1.078;
			y = 0.872;
			w = 0.13;
			h = 0.038;
		};
		
		class ButtonMarket : Life_RscButtonMenu {
            idc = -1;
            text = "Markt";
            onButtonClick = "[] spawn tanoarpg_fnc_openMarketView;";
            x = 0.97;
			y = 0.469;
            w = 0.115;
			h = 0.038;
        };
	};
};