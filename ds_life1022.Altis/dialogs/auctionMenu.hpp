class auctionMenu {
	idd = 366346;
	name= "auctionMenu";
	movingEnable = true;
	enableSimulation = true;

	class controls
	{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 33.5 * GUI_GRID_W;
			h = 19.5 * GUI_GRID_H;
			moving = 1;
		};
		class button1: DS_RscButtonMenu
		{
			idc = 2400;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class button2: DS_RscButtonMenu
		{
			idc = 2401;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class button3: DS_RscButtonMenu
		{
			idc = 2402;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class button4: DS_RscButtonMenu
		{
			idc = 2403;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class button5: DS_RscButtonMenu
		{
			idc = 2404;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class button6: DS_RscButtonMenu
		{
			idc = 2405;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class button7: DS_RscButtonMenu
		{
			idc = 2406;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class button8: DS_RscButtonMenu
		{
			idc = 2407;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class button9: DS_RscButtonMenu
		{
			idc = 2408;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class button10: DS_RscButtonMenu
		{
			idc = 2409;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class button11: DS_RscButtonMenu
		{
			idc = 2410;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class button12: DS_RscButtonMenu
		{
			idc = 2411;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class buttonClose: DS_RscButtonMenu
		{
			idc = 2412;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 31.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class textArea: DS_RscStructuredText
		{
			idc = 1100;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 31.5 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
			text = "";
		};
	};
};