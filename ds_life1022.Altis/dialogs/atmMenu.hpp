class atmMenu {
	idd = 666;
	name= "atmMenu";
	movingEnable = true;
	enableSimulation = true;

	class controls
	{
		class background: IGUIBack
		{
			idc = 2200;
			moving = true;
			x = 8.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 22.5 * GUI_GRID_W;
			h = 11.5 * GUI_GRID_H;
		};
		class logo1: DS_RscPicture
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.7};
			text = "extras\textures\menus\bankBackground.jpg";
			x = 8.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 22.5 * GUI_GRID_W;
			h = 14 * GUI_GRID_H;
		};
		class logo2: DS_RscPicture
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.7};
			text = "";
			x = 23.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 6 * GUI_GRID_H;
		};
		class inputBox: DS_RscEdit
		{
			idc = 1400;
			text = "0";
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class deposit: RscButtonMenu
		{
			idc = 2400;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class withdraw: RscButtonMenu
		{
			idc = 2401;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class playerList: DS_RscCombo
		{
			idc = 2100;
			x = 15 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class transfer: RscButtonMenu
		{
			idc = 2402;
			x = 15 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class title: DS_RscStructuredText
		{
			idc = 1000;
			text = "";
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class balance: DS_RscStructuredText
		{
			idc = 1001;
			text = "0";
			x = 15.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class insurance: RscButtonMenu
		{
			idc = 2403;
			x = 9 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class exit: RscButtonMenu
		{
			idc = 2404;
			x = 25 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
	};
};