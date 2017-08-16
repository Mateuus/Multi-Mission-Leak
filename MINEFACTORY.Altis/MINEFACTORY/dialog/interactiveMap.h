class InteractiveMap
{
	idd = 12000;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class ControlsBackground
	{
        class RscPicture_1200: life_RscPicture
        {
	        idc = 8183;
	        text = "MINEFACTORY\textures\interactiveMap.paa";
	        x = -6 * GUI_GRID_W + GUI_GRID_X;
	        y = -3.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 52 * GUI_GRID_W;
	        h = 32 * GUI_GRID_H;
        };
	};
	
	class Controls
	{
        class KavalaButton: Life_RscButtonInvisible
        {
			colorBackground[] = {0,0,0,0};
	        idc = 12001;
			text = "";
			tooltip = "Travel to Kavala";
			onButtonClick = "[0] spawn life_fnc_busTravel; closeDialog 0;";
	        x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 4 * GUI_GRID_W;
	        h = 0.8 * GUI_GRID_H;
        };
		
        class AthiraButton: Life_RscButtonInvisible
        {
			colorBackground[] = {0,0,0,0};
	        idc = 12004;
			text = "";
			tooltip = "Travel to Athira";
			onButtonClick = "[1] spawn life_fnc_busTravel; closeDialog 0;";
	        x = 16.5 * GUI_GRID_W + GUI_GRID_X;
	        y = 8.1 * GUI_GRID_H + GUI_GRID_Y;
	        w = 4 * GUI_GRID_W;
	        h = 0.8 * GUI_GRID_H;
        };

        class AirportButton: Life_RscButtonInvisible
        {
			colorBackground[] = {0,0,0,0};
	        idc = 12005;
			text = "";
			tooltip = "Travel to the Airport";
			onButtonClick = "[4] spawn life_fnc_busTravel; closeDialog 0;";
	        x = 17.1 * GUI_GRID_W + GUI_GRID_X;
	        y = 10.2 * GUI_GRID_H + GUI_GRID_Y;
	        w = 4.7 * GUI_GRID_W;
	        h = 0.8 * GUI_GRID_H;
        };

        class PyrgosButton: Life_RscButtonInvisible
        {
			colorBackground[] = {0,0,0,0};
	        idc = 12007;
			text = "";
			tooltip = "Travel to Pyrgos";
			onButtonClick = "[2] spawn life_fnc_busTravel; closeDialog 0;";
	        x = 21 * GUI_GRID_W + GUI_GRID_X;
	        y = 14.9 * GUI_GRID_H + GUI_GRID_Y;
	        w = 4 * GUI_GRID_W;
	        h = 0.8 * GUI_GRID_H;
        };

        class SofiaButton: Life_RscButtonInvisible
        {
			colorBackground[] = {0,0,0,0};
	        idc = 12009;
			text = "";
			tooltip = "Travel to Sofia";
			onButtonClick = "[3] spawn life_fnc_busTravel; closeDialog 0;";
	        x = 33.9 * GUI_GRID_W + GUI_GRID_X;
	        y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	        w = 3.22 * GUI_GRID_W;
	        h = 0.8 * GUI_GRID_H;
        };
	};
};
