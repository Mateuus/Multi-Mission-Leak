class life_DYNMARKET_prices {
	idd = 7100;
	name= "life_DYNMARKET_prices";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {[] call life_fnc_LoadIntoListbox;};";
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\handy\handy_stock.paa";
			idc = -1;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};
	
	class controls {
		class RscListbox_1500: Life_RscListBox
		{
			idc = 7055;
			onLBSelChanged = "[] spawn {[] call life_fnc_DisplayPrices;};";

			x = 0.766062 * safezoneW + safezoneX;
			y = 0.66775 * safezoneH + safezoneY;
			w = 0.177375 * safezoneW;
			h = 0.23375 * safezoneH;
			sizeEx = "0.022 * safeZoneH";
		};
		class RscText_1000: Life_RscText
		{
			idc = -1;

			text = "Aktueller Verkaufspreis"; //--- ToDo: Localize;
			x = 0.768125 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = "0.022 * safeZoneH";
			colorBackground[] = {0,0,0,0};
		};
		class RscText_1001: Life_RscText
		{
			idc = 7056;

			text = ""; //--- ToDo: Localize;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = "0.022 * safeZoneH";
		};
		class RscText_1007: Life_RscStructuredText
		{
			idc = 7058;

			text = ""; //--- ToDo: Localize;
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.33,0.33,0.33,1};
			size = "0.022 * safeZoneH";
		};
		class RscText_1002: Life_RscText
		{
			idc = -1;

			text = "Verkaufte Items"; //--- ToDo: Localize;
			x = 0.768125 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = "0.022 * safeZoneH";
		};
		class RscText_1003: Life_RscText
		{
			idc = 7057;
			
			text = "";
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = "0.022 * safeZoneH";
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