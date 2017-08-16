class donorMenu {
	idd = 666624;
	name= "donorMenu";
	movingEnable = true;
	enableSimulation = true;

	class controls
	{
		class background: IGUIBack
		{
			idc = 2200;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 40 * GUI_GRID_W;
			h = 19 * GUI_GRID_H;
		};
		class RscListbox_1500: DS_RscListbox
		{
			idc = 1500;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
		};
		class RscListbox_1502: DS_RscListbox
		{
			idc = 1502;
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
		};
		class RscListbox_1501: DS_RscListbox
		{
			idc = 1501;
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
		};
		class RscListbox_1503: DS_RscListbox
		{
			idc = 1503;
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
		};
		class btn1: DS_RscButtonMenu
		{
			idc = 2400;
			text = "Play Animation"; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class btn2: DS_RscButtonMenu
		{
			idc = 2401;
			text = "Play Sound"; //--- ToDo: Localize;
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class btn3: DS_RscButtonMenu
		{
			idc = 2402;
			text = "Apply Texture"; //--- ToDo: Localize;
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class btn4: DS_RscButtonMenu
		{
			idc = 2404;
			text = "Change Body"; //--- ToDo: Localize;
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class closeButton: DS_RscButtonMenu
		{
			idc = 2403;
			text = "Close"; //--- ToDo: Localize;
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};