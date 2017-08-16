class pInteraction_Menu {
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\inventory\back_inter.paa";
			idc = -1;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.324844 * safezoneW;
			h = 0.44 * safezoneH;
		};
	};
	
	class controls
	{
		class ButtonClose : Life_RscButtonMenu 
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.388625 * safezoneW + safezoneX;
			y = 0.2415 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.020625 * safezoneH;
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
		
		class ButtonOne : Life_RscButtonMenu
		{
			idc = 37450;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
		
		class ButtonTwo : Life_RscButtonMenu
		{
			idc = 37451;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
		
		class ButtonThree : Life_RscButtonMenu
		{
			idc = 37452;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
		
		class ButtonFour : Life_RscButtonMenu
		{
			idc = 37453;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
		
		class ButtonFive : Life_RscButtonMenu
		{
			idc = 37454;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
		
		class ButtonSix : Life_RscButtonMenu
		{
			idc = 37455;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
		
		class ButtonSeven : Life_RscButtonMenu
		{
			idc = 37456;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
		
		class ButtonEight : Life_RscButtonMenu
		{
			idc = 37457;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
	};
};

class vInteraction_Menu {
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\inventory\back_inter.paa";
			idc = -1;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.324844 * safezoneW;
			h = 0.44 * safezoneH;
		};
	};
	
	class controls {
		class ButtonClose : Life_RscButtonMenu 
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.388625 * safezoneW + safezoneX;
			y = 0.2415 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.020625 * safezoneH;
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
		
		class ButtonOne : Life_RscButtonMenu
		{
			idc = 37450;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
		
		class ButtonTwo : Life_RscButtonMenu
		{
			idc = 37451;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
		
		class ButtonThree : Life_RscButtonMenu
		{
			idc = 37452;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
		
		class ButtonFour : Life_RscButtonMenu
		{
			idc = 37453;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
		
		class ButtonFive : Life_RscButtonMenu
		{
			idc = 37454;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
		
		class ButtonSix : Life_RscButtonMenu
		{
			idc = 37455;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
		
		class ButtonSeven : Life_RscButtonMenu
		{
			idc = 37456;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
		
		class ButtonEight : Life_RscButtonMenu
		{
			idc = 37457;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.9};
		};
	};
};