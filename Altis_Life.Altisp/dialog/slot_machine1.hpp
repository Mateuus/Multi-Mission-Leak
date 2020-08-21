/*
    File: slot_machine.hpp
    Author: Larry
*/

class SlotMachineGUI
{
    idd = 5780;
    movingEnabled = false;
    enableSimulation = true;

    class controlsBackground
    {

        class RscFrame_1800: life_RscText
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
        };

        class RscText_1000: life_RscText
        {
            idc = -1;
            text = "Wygrana:"; //--- ToDo: Localize;
            x = 0.355625 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.055 * safezoneH;
			sizeEx = 3 * 0.03;
        };

        class RscText_1003: life_RscText
        {
            idc = -1;
            text = "Obstaw"; //--- ToDo: Localize;
            x = 0.298906 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 2 * 0.03;
        };
        class RscText_1002: life_RscText
        {
            idc = -1;
            text = "Slot Machine"; //--- ToDo: Localize;
            x = 0.298906 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {0,0.49,0.92,1};
            sizeEx = 3 * 0.03;
        };

    };

    class controls
    {

        class SLOT_1: life_RscPicture
        {
            idc = 5771;
            text = "textures\SlotMachine\slot_empty.paa";
            x = 0.2955 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.122 * safezoneW;
			h = 0.198 * safezoneH;
        };
        class SLOT_2: life_RscPicture
        {
            idc = 5772;
            text = "textures\SlotMachine\slot_empty.paa";
            x = 0.4195 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.122 * safezoneW;
			h = 0.198 * safezoneH;
        };
        class SLOT_3: life_RscPicture
        {
            idc = 5773;
            text = "textures\SlotMachine\slot_empty.paa";
            x = 0.543 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.122 * safezoneW;
			h = 0.198 * safezoneH;
        };

        class Winnings: Life_RscStructuredText
        {
            idc = 5775;
            test = "";
            x = 0.469062 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.055 * safezoneH;
        };

        class EXIT_BTN: life_RscButtonMenu
        {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
        };
		class RscText_1005: Life_RscText
		{
			idc = -1;
			text = "5.000$"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0,0.49,0.92,1};
			sizeEx = 2 * 0.03;
		};
		class RscText_1006: Life_RscText
		{
			idc = -1;
			text = "10.000$"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0,0.49,0.92,1};
			sizeEx = 2 * 0.03;
		};
		class RscText_1007: Life_RscText
		{
			idc = -1;
			text = "25.000$"; //--- ToDo: Localize;
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0,0.49,0.92,1};
			sizeEx = 2 * 0.03;
		};
		class RscText_1008: Life_RscText
		{
			idc = -1;
			text = "50.000$"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0,0.49,0.92,1};
			sizeEx = 2 * 0.03;
		};
        class BET_5K: life_RscButtonMenu
        {
            idc = 5778;
            tooltip = "5000$"; //--- ToDo: Localize;
            colorBackground[] = {0,0,0,0};
            onButtonClick = "[5000] spawn life_fnc_slotSpin;";
            x = 0.371094 * safezoneW + safezoneX;
      			y = 0.577 * safezoneH + safezoneY;
      			w = 0.0515625 * safezoneW;
      			h = 0.033 * safezoneH;
      			colorBackgroundFocused[] = {0,0,0,0};
      			colorBackground2[] = {0,0,0,0};
      			color[] = {1,1,1,1};
      			colorFocused[] = {0,0,0,0};
      			color2[] = {0,0,0,0};
      			colorText[] = {1,1,1,1};
        };
        class BET_50K: life_RscButtonMenu
        {
            idc = 5779;
            tooltip = "50000$"; //--- ToDo: Localize;
            colorBackground[] = {0,0,0,0};
            onButtonClick = "[50000] spawn life_fnc_slotSpin;";
            x = 0.62375 * safezoneW + safezoneX;
      			y = 0.577 * safezoneH + safezoneY;
      			w = 0.061875 * safezoneW;
      			h = 0.033 * safezoneH;
      			colorBackgroundFocused[] = {0,0,0,0};
      			colorBackground2[] = {0,0,0,0};
      			color[] = {1,1,1,1};
      			colorFocused[] = {0,0,0,0};
      			color2[] = {0,0,0,0};
      			colorText[] = {1,1,1,1};
        };
        class BET_25K: life_RscButtonMenu
        {
            idc = 5781;
            tooltip = "25000$"; //--- ToDo: Localize;
            colorBackground[] = {0,0,0,0};
            onButtonClick = "[25000] spawn life_fnc_slotSpin;";
            x = 0.536094 * safezoneW + safezoneX;
      			y = 0.577 * safezoneH + safezoneY;
      			w = 0.061875 * safezoneW;
      			h = 0.033 * safezoneH;
      			colorBackgroundFocused[] = {0,0,0,0};
      			colorBackground2[] = {0,0,0,0};
      			color[] = {1,1,1,1};
      			colorFocused[] = {0,0,0,0};
      			color2[] = {0,0,0,0};
      			colorText[] = {1,1,1,1};
        };
        class BET_10K: life_RscButtonMenu
        {
            idc = 5782;
            tooltip = "10000$"; //--- ToDo: Localize;
            colorBackground[] = {0,0,0,0};
            onButtonClick = "[10000] spawn life_fnc_slotSpin;";
            x = 0.448438 * safezoneW + safezoneX;
      			y = 0.577 * safezoneH + safezoneY;
      			w = 0.061875 * safezoneW;
      			h = 0.033 * safezoneH;
      			colorBackgroundFocused[] = {0,0,0,0};
      			colorBackground2[] = {0,0,0,0};
      			color[] = {1,1,1,1};
      			colorFocused[] = {0,0,0,0};
      			color2[] = {0,0,0,0};
      			colorText[] = {1,1,1,1};
        };
    };
};
