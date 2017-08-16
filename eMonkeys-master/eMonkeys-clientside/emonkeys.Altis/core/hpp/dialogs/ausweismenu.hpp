class EMonkeys_ausweiser
{
	idd = 26500;
	name = "EMonkeys_ausweiser";
	movingEnabled = true;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class background: EMonkeys_RscPicture
		{
			idc = 2200;
			text = "core\textures\menu_background\bg_ausweisMenu.paa";
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.479531 * safezoneW;
			h = 0.847 * safezoneH;
		};
		class button_erstellen: EMonkeys_RscPicture
		{
			idc = 2201;
			text = "core\textures\menu_icons\icon_ausweisMenu.paa";
			x = 0.288625 * safezoneW + safezoneX;
			y = 0.5726 * safezoneH + safezoneY;
			w = 0.238229 * safezoneW;
			h = 0.430852 * safezoneH;
		};
		class EMonkeys_Passfoto1: EMonkeys_RscPicture
		{
			idc = 1200;
			text = "core\textures\misc\ausweis\0.jpg";
			x = 0.380684 * safezoneW + safezoneX;
			y = 0.36734 * safezoneH + safezoneY;
			w = 0.0792708 * safezoneW;
			h = 0.158704 * safezoneH;
		};
		class EMonkeys_stadt: EMonkeys_RscCombo
		{
			idc = 1500;
			colorBackground[] = {1,1,1,0.8};
			colorSelectBackground[] = {0.4,0.4,0.4,0.1};
			colorText[] = {0,0,0,1};
			shadow = 0;
			x = 0.46427 * safezoneW + safezoneX;
			y = 0.730074 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class RscListbox_1501: EMonkeys_RscListbox
		{
			idc = 1501;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {0,0,0,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			shadow = 0;
			colorDisabled[] = {0,0,0,0.4};
			colorSelect[] = {0,0,0,1};
			colorSelect2[] = {0,0,0,1};
			x = 0.469583 * safezoneW + safezoneX;
			y = 0.378074 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.154 * safezoneH;
			onLBSelChanged = "_this call EMonkeys_fnc_ausweischangepass;";
			sizeEx = 1 * GUI_GRID_H;
		};
		class EMonkeys_vorname: EMonkeys_RscEdit
		{
			idc = 1400;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			shadow = 0;
			colorDisabled[] = {0,0,0,0.4};
			text = "Max";
			x = 0.463958 * safezoneW + safezoneX;
			y = 0.546667 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class EMonkeys_name: EMonkeys_RscEdit
		{
			idc = 1401;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			shadow = 0;
			colorDisabled[] = {0,0,0,0.4};
			text = "Musterman";
			x = 0.463905 * safezoneW + safezoneX;
			y = 0.583482 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class EMonkeys_stadtsa: EMonkeys_RscEdit
		{
			idc = 1403;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			shadow = 0;
			colorDisabled[] = {0,0,0,0.4};
			text = "Deutsch";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.656778 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class erstellen : EMonkeys_RscButtonMenu
		{
			idc = 2400;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			shadow = 0;
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick="[] Spawn EMonkeys_fnc_ausweiserstellen;";
			x = 0.547916 * safezoneW + safezoneX;
			y = 0.762037 * safezoneH + safezoneY;
			w = 0.0801564 * safezoneW;
			h = 0.0349627 * safezoneH;
		};
		class schliessen: EMonkeys_RscButtonMenu
		{
			idc = 2401;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			shadow = 0;
			colorDisabled[] = {1,1,1,1};
			onButtonClick = "closeDialog 0;";
			x = 0.373436 * safezoneW + safezoneX;
			y = 0.762038 * safezoneH + safezoneY;
			w = 0.07599 * safezoneW;
			h = 0.0349629 * safezoneH;
		};
		class EMonkeys_geschl: EMonkeys_RscCombo
		{
			idc = 1502;
			colorBackground[] = {1,1,1,0.8};
			colorSelectBackground[] = {0.4,0.4,0.4,0.1};
			colorText[] = {0,0,0,1};
			shadow = 0;

			x = 0.464062 * safezoneW + safezoneX;
			y = 0.693148 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class EMonkeys_gebd: EMonkeys_RscEdit
		{
			idc = 1405;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			shadow = 0;
			colorDisabled[] = {0,0,0,0.4};
			text = "01";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.618222 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class EMonkeys_gebm: EMonkeys_RscEdit
		{
			idc = 1402;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			shadow = 0;
			colorDisabled[] = {0,0,0,0.4};
			text = "04";
			x = 0.489584 * safezoneW + safezoneX;
			y = 0.618519 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class EMonkeys_gebj: EMonkeys_RscEdit
		{
			idc = 1404;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			shadow = 0;
			colorDisabled[] = {0,0,0,0.4};
			text = "2014";
			x = 0.515625 * safezoneW + safezoneX;
			y = 0.618518 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};