
class bugMenu {

	idd = 666687;
	movingEnable = true;
	enableSimulation = true;
	name = "bugMenu";
	
	class controlsBackground {
	
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 14.5 * GUI_GRID_H;
		};
	};
	
	class controls {
		
		
		class RscPicture_1200: DS_RscPicture
		{
			idc = 1200;
			text = "extras\icons\bugLogo.jpg";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 4.5 * GUI_GRID_H;
		};
		class RscText_1000: DS_RscStructuredText
		{
			idc = 1000;
			x = 2.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 35 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Title of your found Bug";
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "";
		};
		class RscText_1001: DS_RscStructuredText
		{
			idc = 1001;
			x = 2.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 35 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Briefly explain the bug";
		};
		class RscEdit_1401: RscEdit
		{
			idc = 1401;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "";
		};
		class RscText_1002: DS_RscStructuredText
		{
			idc = 1002;
			x = 2.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 35 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "State what you think should have happened";
		};
		class RscEdit_1402: RscEdit
		{
			idc = 1402;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "";
		};
		class RscButton_1600: RscButtonMenu
		{
			idc = 1600;
			text = "     Post Bug";
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "[]spawn DS_fnc_reportBug";
		};
		class RscButton_1601: RscButtonMenu
		{
			idc = 1601;
			text = "      Close ";
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "closeDialog 0;"; 
		};
	};
};
