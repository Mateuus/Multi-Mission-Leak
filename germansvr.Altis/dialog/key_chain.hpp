class Life_key_management {
	idd = 2700;
	name= "life_key_chain";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_keyMenu;";
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\handy\handy_keys.paa";
			idc = -1;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};
	
	class controls {
		
		class KeyChainList : Life_RscListBox 
		{
			idc = 2701;
			text = "";
			sizeEx = "0.022 * safeZoneH";
			
			x = 0.768125 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.319 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class NearPlayers : Life_RscCombo
		{
			idc = 2702;
		
			x = 0.768125 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		
		};
		
		class DropKey : Life_RscButtonMenu
		{
			idc = -1;
			tooltip = "$STR_Keys_DropKey";
			onButtonClick = "[] call life_fnc_keyDrop";
			x = 0.768125 * safezoneW + safezoneX;
			y = 0.8157 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class GiveKey : Life_RscButtonMenu {
			idc = 2703;
			tooltip = "$STR_Keys_GiveKey";
			onButtonClick = "[] call life_fnc_keyGive";
			x = 0.860937 * safezoneW + safezoneX;
			y = 0.8157 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
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