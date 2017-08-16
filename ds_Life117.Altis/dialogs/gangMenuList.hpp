class gangMenuList {

	idd = 666672;
	movingEnable = true;
	enableSimulation = true;
	name = "gangMenuList";
	
	class controlsBackground {
	
		class backGround: IGUIBack
		{
			idc = 2200;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 18.5 * GUI_GRID_H;
			moving = 1;
		};
	};
	
	class controls {
		
		
		class header: DS_RscPicture
		{
			idc = 1200;
			text = "extras\textures\menus\gangBanner.jpg";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
		};
		class currentGangs: DS_RscListbox
		{
			idc = 1500;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 11.5 * GUI_GRID_H;
			onLBSelChanged = "_this call DS_civ_updateList";
		};
		class gangMembers: DS_RscStructuredText
		{
			idc = 1501;
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 11.5 * GUI_GRID_H;
		};
		class create: DS_RscButtonMenu
		{
			idc = 2400;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class join: DS_RscButtonMenu
		{
			idc = 2401;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class close: DS_RscButtonMenu
		{
			idc = 2402;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class gangListText: DS_RscStructuredText
		{
			idc = 1100;
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class playerListText: DS_RscStructuredText
		{
			idc = 1101;
			x = 23 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};