class license_app {

	idd = 7123;
	name = "license_app";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_licMenu;";
	
	class controlsBackground {
			class InventoryBack:Life_RscPicture {
			idc = -1;
			text = "textures\handy\handy_license.paa";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};
	
	class controls {
		class Licenses_Menu : Life_RscControlsGroup
		{
			idc = -1;
			x = 0.753275 * safezoneW + safezoneX;
			y = 0.5451 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.1826 * safezoneH;
			
			class Controls
			{
				class life_licenses : Life_RscStructuredText
				{
					idc = 2014;
					text = "";
					size = "0.022 * safeZoneH";
					x = 0;
					y = 0;
					w = 0.20625 * safezoneW;
					h = 0.656 * safezoneH;
				};
			};
		};
		
		class Licenses_Price : Life_RscControlsGroup
		{
			idc = -1;
			x = 0.753275 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.143 * safezoneH;
			
			class Controls
			{
				class life_licensePrice : Life_RscStructuredText
				{
					idc = 2015;
					text = "";
					size = "0.022 * safeZoneH";
					x = 0;
					y = 0;
					w = 0.20625 * safezoneW;
					h = 0.638 * safezoneH;
				};
			};
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