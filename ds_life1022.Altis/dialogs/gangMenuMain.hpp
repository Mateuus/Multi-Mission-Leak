class gangMenuMain {
	idd = 666674;
	movingEnable = true;
	enableSimulation = true;
	name = "gangMenuMain";

	class controlsBackground
	{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 3.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 33 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
			moving = 1;
		};
	};

	class controls
	{
		class header: DS_RscPicture
		{
			idc = 1200;
			text = "extras\textures\menus\gangBanner.jpg";
			x = 3.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 33 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
		};
		class memberList: DS_RscListbox
		{
			idc = 1500;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.5 * GUI_GRID_W;
			h = 11 * GUI_GRID_H;
		};
		class gangName: RscStructuredText
		{
			idc = 1100;
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class gangAreas: RscStructuredText
		{
			idc = 1101;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 32 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class unlockGang: DS_RscButtonMenu
		{
			idc = 2400;
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class kickPlayer: DS_RscButtonMenu
		{
			idc = 2401;
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class leaveGang: DS_RscButtonMenu
		{
			idc = 2403;
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class giveLeader: DS_RscButtonMenu
		{
			idc = 2407;
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class close: DS_RscButtonMenu
		{
			idc = 2402;
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
	};
};