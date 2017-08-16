class bank_app {

	idd = 7124;
	name = "bank_app";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_bankMenu;";
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			idc = -1;
			text = "textures\handy\handy_bank.paa";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
		
		class moneyStatusInfo : Life_RscStructuredText {
			idc = 2015;
			size = "0.022 * safeZoneH";
			text = "";
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class moneyStatusBank : Life_RscStructuredText {
			idc = 2016;
			size = "0.022 * safeZoneH";
			text = "";
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.56875 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class moneyStatusCash : Life_RscStructuredText {
			idc = 2017;
			size = "0.022 * safeZoneH";
			text = "";
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.6155 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};
	
	class controls {
		class aktualisieren : Life_RscButtonMenu {
			idc = 2001;
			onButtonClick = "[] spawn life_fnc_bankMenu;";
			size = "0.022 * safeZoneH";
			x = 0.762969 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			tooltip = "AKTUALISIEREN";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class moneyEdit : Life_RscEdit {
			idc = 2018;
			
			text = "1";
			sizeEx = "0.022 * safeZoneH";
			x = 0.78875 * safezoneW + safezoneX;
			y = 0.71725 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class NearPlayers : Life_RscCombo {
			idc = 2022;
		
			x = 0.78875 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class moneyDrop : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call life_fnc_giveMoney";
			size = "0.022 * safeZoneH";
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.78875 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "TRANSFER";
			
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
			size = "0.022 * safeZoneH";
			x = 0.907344 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.033 * safezoneH;
			
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
			onButtonClick = "closeDialog 0;closeDialog 0;";
			x = 0.783594 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "$STR_Global_Close";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonHome : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.845468 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "HOME";
			size = "0.022 * safeZoneH";
			
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