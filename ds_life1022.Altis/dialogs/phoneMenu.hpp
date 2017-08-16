class phoneMenu {
	idd = 666669;
	movingEnable = true;
	enableSimulation = true;
	name = "phoneMenu";

	class controlsBackground
	{
		class background: IGUIBack
		{
			idc = 2200;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 19 * GUI_GRID_H;
			moving = 1;
		};
	};

	class controls
	{
		class textbox: RscEdit
		{
			idc = 1400;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 26.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "";
		};
		class titleImgage: DS_RscPicture
		{
			idc = 1200;
			text = "extras\textures\menus\phone.jpg";
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 25.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class comboBox: RscCombo
		{
			idc = 2100;
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class textLog: DS_RscListNbox
		{
			idc = 1500;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 37 * GUI_GRID_W;
			h = 8 * GUI_GRID_H;
			drawSideArrows = true;
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			onLBSelChanged = "_this call DS_fnc_messageLog;";
		};
		class textLogTitle: RscStructuredText
		{
			idc = 1100;
			x = 15.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscButtonMenu_2400: RscButtonMenu
		{
			idc = 2400;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscButtonMenu_2401: RscButtonMenu
		{
			idc = 2401;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscButtonMenu_2402: RscButtonMenu
		{
			idc = 2402;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscButtonMenu_2403: RscButtonMenu
		{
			idc = 2403;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscButtonMenu_2404: RscButtonMenu
		{
			idc = 2404;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscButtonMenu_2405: RscButtonMenu
		{
			idc = 2405;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscButtonMenu_2406: RscButtonMenu
		{
			idc = 2406;
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscButtonMenu_2407: RscButtonMenu
		{
			idc = 2407;
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscButtonMenu_2408: RscButtonMenu
		{
			idc = 2408;
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscButtonMenu_2409: RscButtonMenu
		{
			idc = 2409;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscButtonMenu_2410: RscButtonMenu
		{
			idc = 2410;
			x = 33 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
		};
	};
};