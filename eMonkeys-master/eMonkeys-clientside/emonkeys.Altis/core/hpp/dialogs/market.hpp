/*
	File: market.hpp
	Edit: DerOnkel / Cifon | e-monkeys.com / avanix-gaming.de
	
	Description: Gui for Market
*/

//Grid macros
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class marketView
{
	idd = 39500;
	movingEnabled = false;
	enableSimulation = true;
	// onLoad = "[] spawn EMonkeys_fnc_boerse;";
	onLoad = "[] spawn EMonkeys_fnc_boerse;ctrlShow [1003,false];ctrlShow [1004,false];ctrlShow [1005,false];ctrlShow [1200,false];ctrlShow [1201,false];";
	class controlsBackground
	{
		class Background: EMonkeys_RscPicture
		{
			idc = 1100;
			text = "core\textures\menu_background\bg_marketMenu.paa";
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.438281 * safezoneW;
			h = 0.836 * safezoneH;
		};
	};
	
	class controls
	{
		class lblResourceName: EMonkeys_RscStructuredText
		{
			idc = 1000;
			text = "";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.397 * safezoneH + safezoneY;
			w = 0.136062 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,0.4};
			sizeEx = 0.03;
		};
		
		class lblResourcePrice: EMonkeys_RscStructuredText
		{
			idc = 1001;
			text = "";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.4434 * safezoneH + safezoneY;
			w = 0.136062 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,1,0,1};
			colorDisabled[] = {0,0,0,0.4};
			sizeEx = 0.03;
		};
		
		class picTrendGlobal: EMonkeys_RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class picTrendLocal: EMonkeys_RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};
		
		class RscText_1002: EMonkeys_RscText
		{
			idc = 1002;
			text = "Preisänderung in Euro";
			x = 0.490844 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0936563 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0,0,0,1};
			sizeEx = 0.03;
		};
		
		class RscText_1003: EMonkeys_RscText
		{
			idc = 1003;

			text = "Preisänderung in Prozent";
			x = 0.490844 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0936563 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0,0,0,1};
			sizeEx = 0.03;
		};
		
		class lblTrendGlobal: EMonkeys_RscStructuredText
		{
			idc = 1004;
			x = 0.490844 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0936563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class lblTrendLocal: EMonkeys_RscStructuredText
		{
			idc = 1005;
			x = 0.490844 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0936563 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class eventliste: EMonkeys_RscStructuredText
		{
			idc = 1007;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0999687 * safezoneW;
			h = 0.209 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,0.4};
			sizeEx = 0.03;
		};
		
		class eventtext: EMonkeys_RscStructuredText
		{
			idc = 1008;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0999687 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,0.4};
			sizeEx = 0.03;
		};
		
		class bClose: EMonkeys_RscButtonMenu
		{
			idc = 2400;
			onButtonClick = "closeDialog 0;";
			text = "";
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		
		class listResources: EMonkeys_RscListBox
		{
			idc = 1500;
			onLBSelChanged = "_this call EMonkeys_fnc_boerseLBChange";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.130906 * safezoneW;
			h = 0.319 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {0,0,0,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {0,0,0,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,0.4};
			colorSelect[] = {0,0,0,1};
			sizeEx = 0.03;
		};
	};
};