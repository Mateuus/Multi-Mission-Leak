class houseInventory
{
	idd = 3500;
	name = "houseInventory";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_houseMenu_2.paa";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.474375 * safezoneW;
			h = 0.847 * safezoneH;
		};
		
		class VehicleWeight : EMonkeys_RscText
		{
			idc = 3504;
			style = 1;
			text = "x/y";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			//x = 0.650521 * safezoneW + safezoneX;
			x = 0.640521 * safezoneW + safezoneX;
			y = 0.243519 * safezoneH + safezoneY;
			//w = 0.0510417 * safezoneW;
			w = 0.0610417 * safezoneW;
			h = 0.0210741 * safezoneH;
		};
	};
	
	class Controls
	{
		class TrunkGear : EMonkeys_RscListBox
		{
			idc = 3502;
			text = "";
			sizeEx = 0.030;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.301042 * safezoneW + safezoneX;
			y = 0.314814 * safezoneH + safezoneY;
			w = 0.182917 * safezoneW;
			h = 0.357778 * safezoneH;
		};
		
		class PlayerGear : EMonkeys_RscListBox
		{
			idc = 3503;
			text = "";
			sizeEx = 0.030;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.516146 * safezoneW + safezoneX;
			y = 0.314815 * safezoneH + safezoneY;
			w = 0.183437 * safezoneW;
			h = 0.35963 * safezoneH;
		};
		
		class TrunkEdit : EMonkeys_RscEdit
		{
			idc = 3505;
			text = "1";
			sizeEx = 0.030;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.3 * safezoneW + safezoneX;
			y = 0.687037 * safezoneH + safezoneY;
			w = 0.0714583 * safezoneW;
			h = 0.0229259 * safezoneH;
		};
		
		class PlayerEdit : EMonkeys_RscEdit
		{
			idc = 3506;
			text = "1";
			sizeEx = 0.030;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.514062 * safezoneW + safezoneX;
			y = 0.687037 * safezoneH + safezoneY;
			w = 0.0708854 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class TakeItem : EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[] call EMonkeys_fnc_houseInventory_take;";
			x = 0.300521 * safezoneW + safezoneX;
			y = 0.717593 * safezoneH + safezoneY;
			w = 0.0698958 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		
		class StoreItem : EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[] call EMonkeys_fnc_houseInventory_store;";
			x = 0.514583 * safezoneW + safezoneX;
			y = 0.717592 * safezoneH + safezoneY;
			w = 0.0704166 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		
		class ButtonClose : EMonkeys_RscButtonMenu {
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "closeDialog 0;";
			x = 0.703125 * safezoneW + safezoneX;
			y = 0.243518 * safezoneH + safezoneY;
			w = 0.0157291 * safezoneW;
			h = 0.0216667 * safezoneH;
		};
	};
};