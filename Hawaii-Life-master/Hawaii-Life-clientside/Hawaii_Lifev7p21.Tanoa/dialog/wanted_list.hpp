class life_wanted_menu {
	idd = 2400;
	name= "life_wanted_menu";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn life_fnc_wantedadd2;";

	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\handy\handy_crime.paa";
			idc = -1;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};

	class controls {

		class PlayerList : Life_RscListBox
		{
			idc = 2406;
			text = "";
			sizeEx = "0.022 * safeZoneH";
			onLBSelChanged = "";
			colorBackground[] = {0, 0, 0, 0};

			x = 0.754512 * safezoneW + safezoneX;
			y = 0.458778 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.103148 * safezoneH;
		};

		class WantedList : Life_RscListBox
		{
			idc = 2401;
			text = "";
			sizeEx = "0.022 * safeZoneH";
			onLBSelChanged = "[] spawn life_fnc_wantedGrab";
			colorBackground[] = {0, 0, 0, 0};

			x = 0.754512 * safezoneW + safezoneX;
			y = 0.665815 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.0949259 * safezoneH;
		};

		class WantedDetails : Life_RscListBox
		{
			idc = 2402;
			text = "";
			sizeEx = "0.022 * safeZoneH";
			colorBackground[] = {0, 0, 0, 0};

			x = 0.754512 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.0935 * safezoneH;
		};
		
		class BountyPrice : Life_RscText
		{
			idc = 2403;
			text = "";
			sizeEx = "0.022 * safeZoneH";
			x = 0.797 * safezoneW + safezoneX;
			y = 0.8685 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class WantedAddL : Life_RscCombo
		{
			idc = 2407;
			x = 0.754219 * safezoneW + safezoneX;
			y = 0.583481 * safezoneH + safezoneY;
			w = 0.20375 * safezoneW;
			h = 0.022926 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class PardonButtonKey : Life_RscButtonMenu {
			idc = 2405;
			tooltip = "$STR_Wanted_Pardon";
			size = "0.022 * safeZoneH";
			onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";
			x = 0.866094 * safezoneW + safezoneX;
			y = 0.61463 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};

		class ButtonWantedAdd : life_RscButtonMenu {
			idc = 9800;
			//shortcuts[] = {0x00050000 + 2};
			tooltip = "$STR_Wanted_Add";
			size = "0.022 * safeZoneH";
			onButtonClick = "[] call life_fnc_wantedAddP;";
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.61463 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			
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
