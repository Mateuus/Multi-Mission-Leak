class infoMenu
{
	idd = 41500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class InventoryBack:Life_RscPicture {
			text = "textures\inventory\back2.paa";
			idc = -1;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.582656 * safezoneW;
			h = 0.77 * safezoneH;
		};
		class InventoryPfeil:Life_RscPicture {
			text = "textures\inventory\back_pfeil.paa";
			idc = -1;
			x = 0.315612 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.0275 * safezoneH;
		};
	};
	
	class controls {
		class Infoheader: Life_RscText
		{
			idc = -1;
			text = "Informationen:";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.7};
		};
		class InfoList: Life_RscListBox
		{
			idc = 2300;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.33 * safezoneH;
			sizeEx = 0.032;
			colorBackground[] = {0,0,0,0.4};
			onLBSelChanged = "[1] spawn life_fnc_InfoMenu;";
		};
		class headerInfoText: Life_RscText
		{
			idc = 2301;
			text = "empty";
			colorBackground[] = {1,0.537,0,0.6};
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class InfoTextControl: life_RscControlsGroup
		{
			idc = 2303;
			colorBackground[] = {0,0,0,0.3};
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.33 * safezoneH;
			
			class controls {
				class InfoText: life_RscStructuredText
				{
					idc = 2304;
					text = "empty";
					colorBackground[] = {0,0,0,0.3};
					x = 0;
					y = 0;
					w = 0.309375 * safezoneW;
					h = 1.5 * safezoneH;
				};
			};
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
			onButtonClick = "closeDialog 0;[] call life_fnc_settingsMenu;";
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