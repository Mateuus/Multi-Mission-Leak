class gangMenuList {
	idd = 666672;
	movingEnable = true;
	enableSimulation = true;
	name = "gangMenuList";

	class controls
	{
		class background: IGUIBack
		{
			idc = 2200;
			moving = 1;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 17 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class header: DS_RscPicture
		{
			idc = 1200;
			text = "extras\textures\menus\gangBanner.jpg"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
		};
		class currentGangs: DS_RscListBox
		{
			idc = 1500;
			onLBSelChanged = "_this call DS_civ_gangUpdateList";
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 14 * GUI_GRID_H;
		};
		class gangMembers: DS_RscListBox
		{
			idc = 1501;
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 14 * GUI_GRID_H;
			colorSelect[] = {1,1,1,1};
			colorSelect2[] = {1,1,1,1};
			colorSelectBackground[] = {0,0,0,0};
			colorSelectBackground2[] = {0,0,0,0};
		};
		class create: DS_RscButtonMenu
		{
			idc = 2400;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class join: DS_RscButtonMenu
		{
			idc = 2401;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class close: DS_RscButtonMenu
		{
			idc = 2402;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};