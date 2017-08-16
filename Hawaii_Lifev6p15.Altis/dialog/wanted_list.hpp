class life_wanted_menu {
	idd = 2400;
	name= "life_wanted_menu";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn life_fnc_wantedadd2;";

	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\inventory\back2.paa";
			idc = -1;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.582656 * safezoneW;
			h = 0.77 * safezoneH;
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.341 * safezoneH;
		};
	};
	
	class controls {
		class Title : Life_RscTitle {
			colorBackground[] = {1,0.537,0,0.7};
			idc = -1;
			text = "$STR_Wanted_Title";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class WantedConnection : Title {
			idc = 2404;
			style = 1;
			text = "";
		};

		class PlayerList : Life_RscListBox
		{
			idc = 2406;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "";

			x = 0.350469 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.297 * safezoneH;
		};

		class WantedList : Life_RscListBox
		{
			idc = 2401;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] spawn life_fnc_wantedGrab";

			x = 0.479373 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.297 * safezoneH;
		};

		class WantedDetails : Life_RscListBox
		{
			idc = 2402;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};

			x = 0.613437 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.187 * safezoneH;
		};
		
		class BountyPrice : Life_RscText
		{
			idc = 2403;
			text = "";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class WantedAddL : Life_RscCombo
		{
			idc = 2407;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class PardonButtonKey : Life_RscButtonMenu {
			idc = 2405;
			text = "$STR_Wanted_Pardon";
			onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.5};
		};

		class ButtonWantedAdd : life_RscButtonMenu {
			idc = 9800;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Wanted_Add";
			onButtonClick = "[] call life_fnc_wantedAddP;";
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.5};
		};
		
		class wantedText: Life_RscText
		{
			idc = 1000;
			text = "$STR_Wanted_People";
			x = 0.479373 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.5};
		};
		class citizensText: Life_RscText
		{
			idc = 1001;
			text = "$STR_Wanted_Citizens";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.5};
		};
		class crimesText: Life_RscText
		{
			idc = 1002;
			text = "$STR_Wanted_Crimes";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.5};
		};
		
		class ButtonHome : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.263 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "HOME";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonCell : Life_RscButtonMenu {
			idc = 2014;
			onButtonClick = "closeDialog 0;createDialog ""Life_cell_phone"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
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
			onButtonClick = "closeDialog 0;createDialog ""life_key_management"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
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
			onButtonClick = "closeDialog 0;if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
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
			onButtonClick = "closeDialog 0;[] call life_fnc_showEXP;";
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
            onButtonClick = "closeDialog 0;[] spawn life_fnc_InfoMenu;";
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
			onButtonClick = "closeDialog 0;createDialog ""life_dynmarket_prices"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
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
	};
}; 
