class gangMenuCreate {

	idd = 666673;
	movingEnable = true;
	enableSimulation = true;
	name = "gangMenuCreate";
	
	class controlsBackground {
	
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 8 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 22 * GUI_GRID_W;
			h = 6 * GUI_GRID_H;
			moving = 1;
		};
	};
	
	class controls {
		
		
		class RscEdit_1400: DS_RscEdit
		{
			idc = 1400;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "Enter name here";
		};
		class RscButtonMenu_2400: DS_RscButtonMenu
		{
			idc = 2400;
			x = 9 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "   Close";
			onButtonClick = "closeDialog 0;";
		};
		class RscButtonMenu_2401: DS_RscButtonMenu
		{
			idc = 2401;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "    Create";
			onButtonClick = "[] spawn DS_civ_gangInsert";
		};
	};
};