#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	onLoad = "[] spawn life_fnc_p_updateMenu; uiNamespace setVariable [""tabletmenu"", _this select 0]; [] spawn life_fnc_cellphone; smsmenuisopen = 1; [] call fnc_fadephone; ";
	enableSimulation = true;
	
	class controlsBackground {
	
	
	class RscPicture_1200: life_RscPicture
		{
			idc = 1200;
			text = "\CG_Client\textures\playerinfo.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.561 * safezoneH;
		};
		
		class CTRL_PHONE_BG: RscStructuredText
		{    
			idc = 7017;
			text = "";
			x = 0.320594 * safezoneW + safezoneX;
			y = 0.305 * safezoneH + safezoneY;
			w = 0.35585 * safezoneW;
			h = 0.3512 * safezoneH;
			ColorBackground[] = {1, 1, 1, 1};
		}; 
		
		class MainBackground:life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_PM_Title";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class moneybankInfo : Life_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = 0.356406 * safezoneW + safezoneX;
			y = 0.378074 * safezoneH + safezoneY;
			w = 0.071302 * safezoneW;
			h = 0.0339259 * safezoneH;
		};
		class moneyplayerInfo : Life_RscStructuredText
		{
			idc = 2030;
			sizeEx = 0.020;
			text = "";
			x = 0.357291 * safezoneW + safezoneX;
			y = 0.430556 * safezoneH + safezoneY;
			w = 0.071302 * safezoneW;
			h = 0.0339259 * safezoneH;
		};
		
		class PlayersName : Title {
			idc = carry_weight;
			style = 1;
			text = "";
		};
	};
	
	class controls {
		
		class itemHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_cItems";
			sizeEx = 0.04;
			
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class licenseHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_Licenses";
			sizeEx = 0.04;
			
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class moneySHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_MoneyStats";
			sizeEx = 0.04;
			
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
	
		class itemList : life_RscListBox 
		{
			idc = item_list;
			sizeEx = 0.030;
			
			x = 0.5625 * safezoneW + safezoneX;
			y = 0.368519 * safezoneH + safezoneY;
			w = 0.100625 * safezoneW;
			h = 0.129074 * safezoneH;
		};
		
		class moneyEdit : Life_RscEdit 
		{
			idc = 2018;
			
			text = "1";
			sizeEx = 0.030;
			x = 0.328645 * safezoneW + safezoneX;
			y = 0.478704 * safezoneH + safezoneY;
			w = 0.101667 * safezoneW;
			h = 0.0244444 * safezoneH;
		};
		
		class NearPlayers : Life_RscCombo 
		{
			idc = 2022;
		
			x = 0.329688 * safezoneW + safezoneX;
			y = 0.507407 * safezoneH + safezoneY;
			w = 0.0995833 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
		
		class moneyGive : Life_RscButtonSilent
		{
			idc = 2001;
			text = "$STR_Global_Give";
			onButtonClick = "[] call life_fnc_giveMoney";
			sizeEx = 0.025;
			x = 0.329687 * safezoneW + safezoneX;
			y = 0.533333 * safezoneH + safezoneY;
			w = 0.100104 * safezoneW;
			h = 0.0272223 * safezoneH;
		};

		class itemEdit : Life_RscEdit {
		
		idc = item_edit;
		
		text = "1";
		sizeEx = 0.030;
			x = 0.562499 * safezoneW + safezoneX;
			y = 0.502778 * safezoneH + safezoneY;
			w = 0.102188 * safezoneW;
			h = 0.0262963 * safezoneH;
		
		};
		class iNearPlayers : Life_RscCombo
		{
			idc = 2023;
			
			x = 0.56302 * safezoneW + safezoneX;
			y = 0.530556 * safezoneH + safezoneY;
			w = 0.102187 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
		/*
		Disabled till it can be redone
		class moneyInput: life_RscCombo {
			
			idc = money_value;
			
			x  = 0.02; y = 0.402;
			w = .1; h = .030;
		};
		*/
		
		class UseButton : Life_RscButtonSilent {
			idc = 6232;
			text = "$STR_Global_Use";
			onButtonClick = "[] call life_fnc_useItem;";
			
			x = 0.5625 * safezoneW + safezoneX;
			y = 0.555556 * safezoneH + safezoneY;
			w = 0.103229 * safezoneW;
			h = 0.0281482 * safezoneH;
			
		};
		
		class RemoveButton : Life_RscButtonSilent {
			idc = 6233;
			text = "$STR_Global_Remove";
			onButtonClick = "[] call life_fnc_removeItem2;";
			x = 0.5625 * safezoneW + safezoneX;
			y = 0.583333 * safezoneH + safezoneY;
			w = 0.103229 * safezoneW;
			h = 0.0281482 * safezoneH;		
		};

		class DropButton : Life_RscButtonSilent {
			idc = 2002;
			text = "$STR_Global_Give";
			onButtonClick = "[] call life_fnc_giveItem;";
			x = 0.562499 * safezoneW + safezoneX;
			y = 0.612037 * safezoneH + safezoneY;
			w = 0.103229 * safezoneW;
			h = 0.0281482 * safezoneH;	
		};
		

		/*
		Disabled till it can be redone
		class DropcButton : Life_RscButtonSilent {

			text = "Drop Money";
			onButtonClick = "[] execVM 'player_system\money_fnc.sqf'";
			
			x = 0.13; y = 0.4;
			w = 0.135; h = 0.05;
			
		};
		*/
		
		class ButtonClose : Life_RscButtonSilent {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class ButtonSettings : Life_RscButtonSilent {
			idc = -1;
			text = "$STR_Global_Settings";
			onButtonClick = "[] call life_fnc_settingsMenu;";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class ButtonMyGang : Life_RscButtonSilent {
			idc = 2011;
			text = "$STR_PM_MyGang";
			onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class Licenses_Menu : Life_RscControlsGroup
		{
			idc = -1;
			x = 0.44375 * safezoneW + safezoneX;
			y = 0.366667 * safezoneH + safezoneY;
			w = 0.10375 * safezoneW;
			h = 0.270741 * safezoneH;
			
			class Controls
			{
				class Life_Licenses : Life_RscStructuredText
				{
					idc = 2014;
					sizeEx = 0.020;
					text = "";
					x = 0.29500 * safezoneW + safezoneX;
					y = 0.225667 * safezoneH + safezoneY;
					w = 0.10375 * safezoneW;
					h = 0.411741 * safezoneH;
				};
			};
		};
		
		class ButtonGangList : Life_RscButtonSilent {
			idc = 2012;
			text = "$STR_PM_WantedList";
			onButtonClick = "[] call life_fnc_wantedMenu";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	
		class ButtonKeys : Life_RscButtonSilent {
			idc = 2013;
			text = "$STR_PM_KeyChain";
			onButtonClick = "createDialog ""Life_key_management"";";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class ButtonCell : Life_RscButtonSilent {
			idc = 2014;
			text = "$STR_PM_CellPhone";
			onButtonClick = "[] call life_fnc_callCellPhone";  
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class ButtonAdminMenu : Life_RscButtonSilent {
			idc = 2021;
			text = "$STR_PM_AdminMenu";
			onButtonClick = "createDialog ""life_admin_menu"";";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class ButtonSyncData : Life_RscButtonSilent {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_PM_SyncData";
			onButtonClick = "[] call SOCK_fnc_syncData;";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
	};
};