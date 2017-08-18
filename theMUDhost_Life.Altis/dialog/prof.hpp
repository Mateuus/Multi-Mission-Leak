/*
File: prof.hpp
Author: Jacob "PapaBear" Tyler
 
Description:
Dialog for new gui
*/
 
class Life_Prof_Dialog
{
	idd = 7730;
	name = "life_prof_dialog";
	movingEnabled = false;
	enableSimulation = true;
	 
	class controlsBackground 
	{
		class Frame: Life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 18 * GUI_GRID_H;
		};
		 
		class Title: Life_RscText
		{
			idc = -1;
			text = "Proficicency Levels"; //--- ToDo: Localize;
			x = 15.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
		 
	class controls 
	{
		class Prof_Text: Life_RscStructuredText
		{
			idc = 7731;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
		};
		class Prof2_Text: Life_RscStructuredText
		{
			idc = 7732;
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
		};
		class Prof3_Text: Life_RscStructuredText
		{
			idc = 7733;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
		};
		class CloseBTN: Life_RscButtonMenu
		{
			idc = -1;
			text = "Close"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};