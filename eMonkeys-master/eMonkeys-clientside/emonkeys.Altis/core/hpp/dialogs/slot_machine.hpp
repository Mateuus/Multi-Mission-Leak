/*
	File: slot_machine.hpp
    Author: Jacob "PapaBear" Tyler
	Edit: DerOnkel | e-monkeys.com / avanix-gaming.de
	
	Description: Gui for slotmachine
*/

#define GUI_GRID_X    (0)
#define GUI_GRID_Y    (0)
#define GUI_GRID_W    (0.025)
#define GUI_GRID_H    (0.04)
#define GUI_GRID_WAbs    (1)
#define GUI_GRID_HAbs    (1)

class SlotMachineGUI
{
	idd = 5780;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_slotmachine.paa";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.194 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.594 * safezoneH;
		};
	};
	
	class controls
	{
		class SLOT_1: EMonkeys_RscPicture
		{
			idc = 5771;
			text = "";
			x = 0.405031 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class SLOT_2: EMonkeys_RscPicture
		{
			idc = 5772;
			text = "";
			x = 0.478219 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class SLOT_3: EMonkeys_RscPicture
		{
			idc = 5773;
			text = "";
			x = 0.548406 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.088 * safezoneH;
		};
		
		class Winnings: EMonkeys_RscText
		{
			idc = 5775;
			test = "";
			sizeEx = 0.05;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.6845 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Cash:  EMonkeys_RscText
		{
			idc = 5776;
			test = "";
			sizeEx = 0.05;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.7185 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class BET_5K: EMonkeys_RscButtonMenu
		{
			idc = 5778;
			text = "";
			onButtonClick = "[5000] spawn EMonkeys_fnc_slotSpin;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.373294 * safezoneW + safezoneX;
			y = 0.552 * safezoneH + safezoneY;
			w = 0.0587187 * safezoneW;
			h = 0.0301 * safezoneH;
		};
		
		class BET_10K: EMonkeys_RscButtonMenu
		{
			idc = 5782;
			text = "";
			onButtonClick = "[10000] spawn EMonkeys_fnc_slotSpin;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.439125 * safezoneW + safezoneX;
			y = 0.552 * safezoneH + safezoneY;
			w = 0.0587187 * safezoneW;
			h = 0.0301 * safezoneH;
		};
		
		class BET_25K: EMonkeys_RscButtonMenu
		{
			idc = 5781;
			text = "";
			onButtonClick = "[25000] spawn EMonkeys_fnc_slotSpin;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.552 * safezoneH + safezoneY;
			w = 0.0587187 * safezoneW;
			h = 0.0301 * safezoneH;
		};
		
		class BET_50K: EMonkeys_RscButtonMenu
		{
			idc = 5779;
			text = "";
			onButtonClick = "[50000] spawn EMonkeys_fnc_slotSpin;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.552 * safezoneH + safezoneY;
			w = 0.0587187 * safezoneW;
			h = 0.0301 * safezoneH;
		};
		
		class Close_Button: EMonkeys_RscButtonMenu
		{
			idc = 5783;
			text = "";
			onButtonClick = "closeDialog 0;";
			tooltip = "Beenden";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.642219 * safezoneW + safezoneX;
			y = 0.745 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};