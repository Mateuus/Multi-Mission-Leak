class pInteraction_Menu {
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\inventory\back_inter.paa";
			idc = -1;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.605 * safezoneH;
		};
	};
	
	class controls
	{
		class ButtonClose : Life_RscButtonMenu 
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.556198 * safezoneW + safezoneX;
			y = 0.335926 * safezoneH + safezoneY;
			w = 0.0109892 * safezoneW;
			h = 0.0192221 * safezoneH;
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
			x = 0.43349 * safezoneW + safezoneX;
			y = 0.381778 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonTwo : Life_RscButtonMenu
		{
			idc = 37451;
			text = "";
			x = 0.43349 * safezoneW + safezoneX;
			y = 0.41837 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonThree : Life_RscButtonMenu
		{
			idc = 37452;
			text = "";
			x = 0.43349 * safezoneW + safezoneX;
			y = 0.456926 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonFour : Life_RscButtonMenu
		{
			idc = 37453;
			text = "";
			x = 0.43349 * safezoneW + safezoneX;
			y = 0.49363 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonFive : Life_RscButtonMenu
		{
			idc = 37454;
			text = "";
			x = 0.43349 * safezoneW + safezoneX;
			y = 0.530222 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonSix : Life_RscButtonMenu
		{
			idc = 37455;
			text = "";
			x = 0.43349 * safezoneW + safezoneX;
			y = 0.567852 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonSeven : Life_RscButtonMenu
		{
			idc = 37456;
			text = "";
			x = 0.433438 * safezoneW + safezoneX;
			y = 0.60537 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonEight : Life_RscButtonMenu
		{
			idc = 37457;
			text = "";
			x = 0.43349 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
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

class vInteraction_Menu {
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\inventory\back_inter.paa";
			idc = -1;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.605 * safezoneH;
		};
	};
	
	class controls {
		class ButtonClose : Life_RscButtonMenu 
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.556198 * safezoneW + safezoneX;
			y = 0.335926 * safezoneH + safezoneY;
			w = 0.0109892 * safezoneW;
			h = 0.0192221 * safezoneH;
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
			x = 0.43349 * safezoneW + safezoneX;
			y = 0.381778 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonTwo : Life_RscButtonMenu
		{
			idc = 37451;
			text = "";
			x = 0.43349 * safezoneW + safezoneX;
			y = 0.41837 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonThree : Life_RscButtonMenu
		{
			idc = 37452;
			text = "";
			x = 0.43349 * safezoneW + safezoneX;
			y = 0.456926 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonFour : Life_RscButtonMenu
		{
			idc = 37453;
			text = "";
			x = 0.43349 * safezoneW + safezoneX;
			y = 0.49363 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonFive : Life_RscButtonMenu
		{
			idc = 37454;
			text = "";
			x = 0.43349 * safezoneW + safezoneX;
			y = 0.530222 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonSix : Life_RscButtonMenu
		{
			idc = 37455;
			text = "";
			x = 0.43349 * safezoneW + safezoneX;
			y = 0.567852 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonSeven : Life_RscButtonMenu
		{
			idc = 37456;
			text = "";
			x = 0.433438 * safezoneW + safezoneX;
			y = 0.60537 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonEight : Life_RscButtonMenu
		{
			idc = 37457;
			text = "";
			x = 0.43349 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.133385 * safezoneW;
			h = 0.0238519 * safezoneH;
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