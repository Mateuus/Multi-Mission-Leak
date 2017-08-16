class Life_jackpot {
	idd = 9200;
	name= "life_jackpot";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_RefreshPot;";
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\handy\handy_jackpot.paa";
			idc = -1;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};
	
	class controls {
		class PotInfo: Life_RscStructuredText
		{
			idc = 8209;
			text = "";
			x = 0.783073 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.146958 * safezoneW;
			h = 0.0394259 * safezoneH;
			size = "0.022 * safeZoneH";
		};
		class chanceInfo: Life_RscStructuredText
		{
			idc = 8210;
			text = "";
			x = 0.783073 * safezoneW + safezoneX;
			y = 0.6111 * safezoneH + safezoneY;
			w = 0.146958 * safezoneW;
			h = 0.039426 * safezoneH;
			size = "0.022 * safeZoneH";
		};
		class teilnehmerInfo: Life_RscStructuredText
		{
			idc = 8211;
			text = "";
			x = 0.783073 * safezoneW + safezoneX;
			y = 0.65675 * safezoneH + safezoneY;
			w = 0.146958 * safezoneW;
			h = 0.0385 * safezoneH;
			size = "0.022 * safeZoneH";
		};
		class betragedit: Life_RscEdit
		{
			idc = 8203;
			onMouseEnter = "";
			style = 0x00 + 0x200;
			text = "1";
			sizeEX = "0.022 * safeZoneH";
			x = 0.782562 * safezoneW + safezoneX;
			y = 0.7343 * safezoneH + safezoneY;
			w = 0.1485 * safezoneW;
			h = 0.0242 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class time_progress: Life_RscProgress
		{
			idc = 8205;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.765 * safezoneW + safezoneX;
			y = 0.501852 * safezoneH + safezoneY;
			w = 0.182656 * safezoneW;
			h = 0.0248888 * safezoneH;
			colorFrame[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			colorBar[] = {0.11,0.412,0.408,1};
		};
		class time_text: Life_RscStructuredText
		{
			idc = 8206;
			text = "";
			x = 0.765 * safezoneW + safezoneX;
			y = 0.501852 * safezoneH + safezoneY;
			w = 0.182656 * safezoneW;
			h = 0.0248888 * safezoneH;
			size = "0.022 * safeZoneH";
		};
		class lastwinner: Life_RscStructuredText
		{
			idc = 8208;
			text = "Larry"; //--- ToDo: Localize;
			x = 0.761927 * safezoneW + safezoneX;
			y = 0.875448 * safezoneH + safezoneY;
			w = 0.188642 * safezoneW;
			h = 0.0277296 * safezoneH;
			size = "0.022 * safeZoneH";
		};
		class bet: Life_RscButtonMenu
		{
			idc = -1;
			x = 0.80525 * safezoneW + safezoneX;
			y = 0.7695 * safezoneH + safezoneY;
			w = 0.099825 * safezoneW;
			h = 0.033 * safezoneH;
			size = "0.022 * safeZoneH";
			
			onButtonClick = "[parseNumber(ctrlText 8203)] spawn life_fnc_bet";
			
			tooltip = "WETTEN";
			
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