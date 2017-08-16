class life_prof_dialog {
	idd = 7730;	name = "life_prof_dialog";	movingEnabled = false;	enableSimulation = true;
	
	class controlsBackground 
	{
		class InventoryBack:Life_RscPicture {
			idc = -1;
			text = "textures\handy\handy_home.paa";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};
	class controls {
		class Prof_Text : Life_RscStructuredText {
			idc = 7731;
			x = 0.783594 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.29 * safezoneW;
			h = 0.29 * safezoneW;
		};
		class Prof2_Text : Life_RscStructuredText {
			idc = 7732;
			x = 0.845468 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.29 * safezoneW;
			h = 0.29 * safezoneW;
		};
		class Prof3_Text : Life_RscStructuredText {
			idc = 7733;
			x = 0.907344 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.29 * safezoneW;
			h = 0.29 * safezoneW;
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
	};};