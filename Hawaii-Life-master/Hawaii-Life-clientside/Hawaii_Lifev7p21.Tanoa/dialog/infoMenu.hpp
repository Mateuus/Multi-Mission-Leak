class infoMenu
{
	idd = 41500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class InventoryBack:Life_RscPicture {
			text = "textures\handy\handy_info.paa";
			idc = -1;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};
	
	class controls {
		class InfoList: Life_RscListBox
		{
			idc = 2300;
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.45985 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.132 * safezoneH;
			sizeEx = 0.032;
			colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[1] spawn life_fnc_InfoMenu;";
		};
		
		class InfoTextControl: life_RscControlsGroup
		{
			idc = 2303;
			colorBackground[] = {0,0,0,0};
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.206662 * safezoneW;
			h = 0.29425 * safezoneH;
			
			class controls {
				class InfoText: life_RscStructuredText
				{
					idc = 2304;
					text = "empty";
					sizeEx = "0.022 * safeZoneH";
					colorBackground[] = {0,0,0,0};
					x = 0;
					y = 0;
					w = 0.206662 * safezoneW;
					h = 1.5 * safezoneH;
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