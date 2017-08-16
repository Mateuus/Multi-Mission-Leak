#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground {
			class InventoryBack:Life_RscPicture {
			text = "textures\inventory\back.paa";
			idc = -1;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.582656 * safezoneW;
			h = 0.77 * safezoneH;
		};
		
		class moneyStatusInfo : Life_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.31 * safezoneH + safezoneY;
			w = 0.1505 * safezoneW;
			h = 0.019 * safezoneH;
		};
		
		class PlayersName : Title {
			idc = carry_weight;
			style = 1;
			text = "";
		};
	};
	
	class controls {
	
		class itemList : Life_RscListBox
		{
			idc = item_list;
			sizeEx = 0.030;
			
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.282 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
		};
		
		class moneyEdit : Life_RscEdit 
		{
			idc = 2018;
			
			text = "1";
			sizeEx = 0.030;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.71725 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.0165 * safezoneH;
		};
		
		class NearPlayers : Life_RscCombo 
		{
			idc = 2022;
		
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.73815 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.0165 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		
		class moneyDrop : Life_RscButtonMenu
		{
			idc = 2001;
			onButtonClick = "[] call life_fnc_giveMoney";
			sizeEx = 0.025;
			x = 0.671 * safezoneW + safezoneX;
			y = 0.701 * safezoneH + safezoneY;
			w = 0.0754 * safezoneW;
			h = 0.024 * safezoneH;
			tooltip = "GEBEN";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class aktualisieren : Life_RscButtonMenu
		{
			idc = 2001;
			onButtonClick = "[] spawn life_fnc_p_updateMenu;";
			sizeEx = 0.025;
			x = 0.671 * safezoneW + safezoneX;
			y = 0.729 * safezoneH + safezoneY;
			w = 0.0754 * safezoneW;
			h = 0.024 * safezoneH;
			tooltip = "AKTUALISIEREN";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class itemEdit : Life_RscEdit {
		
			idc = item_edit;
			
			text = "1";
			sizeEx = 0.030;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.0165 * safezoneH;
		
		};
		class iNearPlayers : Life_RscCombo
		{
			idc = 2023;
			
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.0165 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		/*
		Disabled till it can be redone
		class moneyInput: Life_RscCombo {
			
			idc = money_value;
			
			x  = 0.02; y = 0.402;
			w = .1; h = .030;
		};
		*/
		
		class DropButton : Life_RscButtonMenu {
			
			idc = 2002;
			onButtonClick = "[] call life_fnc_giveItem;";
			
			x = 0.502 * safezoneW + safezoneX;
			y = 0.33 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "GEBEN";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			
		};
		
		class UseButton : Life_RscButtonMenu {
			onButtonClick = "[] call life_fnc_useItem;";
			
			x = 0.502 * safezoneW + safezoneX;
			y = 0.37 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.028 * safezoneH;
			tooltip = "VERWENDEN";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			
		};
		
		class RemoveButton : Life_RscButtonMenu {
			onButtonClick = "[] call life_fnc_removeItem;";
			
			x = 0.502 * safezoneW + safezoneX;
			y = 0.411 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.028 * safezoneH;
			
			tooltip = "ENTFERNEN";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class Licenses_Menu : Life_RscControlsGroup
		{
			idc = -1;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.23 * safezoneW;
			h = 0.127 * safezoneH;
			
			class Controls
			{
				class life_licenses : Life_RscStructuredText
				{
					idc = 2014;
					sizeEx = 0.030;
					text = "";
					x = 0;
					y = 0;
					w = 0.23 * safezoneW;
					h = 0.656 * safezoneH;
				};
			};
		};
		
		class ButtonCell : Life_RscButtonMenu {
			idc = 2014;
			onButtonClick = "createDialog ""Life_cell_phone"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "$STR_PM_CellPhone";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonKeys : Life_RscButtonMenu {
			idc = 2013;
			onButtonClick = "createDialog ""life_key_management"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.366 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "$STR_PM_KeyChain";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonSettings : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call life_fnc_settingsMenu;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.418 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "$STR_Global_Settings";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonMyGang : Life_RscButtonMenu {
			idc = 2011;
			onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "$STR_PM_MyGang";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
        class ButtonShowExp : Life_RscButtonMenu {
            idc = 2016;
			onButtonClick = "[] call life_fnc_showEXP;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "Erfahrung";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
        };
		
		class ButtonInfo: Life_RscButtonMenu {
			idc = 99630;
            onButtonClick = "[] spawn life_fnc_InfoMenu;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.5745 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "Info";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonMarket : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "createDialog ""life_dynmarket_prices"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.627 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "Markt";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonSyncData : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call SOCK_fnc_syncData;";
			x = 0.253 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.035 * safezoneH;
			
			tooltip = "$STR_PM_SyncData";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.244 * safezoneW + safezoneX;
			y = 0.242 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.014 * safezoneH;
			
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		//Cop Stuff
		class ButtonAdminMenu : Life_RscButtonMenu {
			idc = 2021;
			text = "$STR_PM_AdminMenu";
			onButtonClick = "createDialog ""life_admin_menu"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonGangList : Life_RscButtonMenu {
			idc = 2012;
			text = "$STR_PM_WantedList";
			onButtonClick = "[] call life_fnc_wantedMenu;";
			x = 0.680469 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
		};
		/*
			class ButtonCraft : Life_RscButtonMenu {
			idc = 2025;
			text = "$STR_PM_Craft";
			colorBackground[] = {1,0.537,0,0.5};
			onButtonClick = "createDialog ""life_craft"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
			x = 0.11 + (5.75 / 40) + 0.01;
			y = 0.70;
			w = (5.75 / 40);
			h = (1 / 25);
		};*/
	};
};