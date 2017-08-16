class keyMenu {

	idd = 666676;
	movingEnable = true;
	enableSimulation = true;
	name = "keyMenu";
	
	class controlsBackground {
	
		class background: IGUIBack
		{
			idc = 2200;
			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20.5 * GUI_GRID_W;
			h = 17.5 * GUI_GRID_H;
			moving = 1;
		};
	};
	
	class controls {
		
		
		class headerImg: DS_RscPicture
		{
			idc = 1200;
			text = "extras\textures\menus\keyMenu.jpg";
			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 20.5 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
		};
		class list: RscListbox
		{
			idc = 1500;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 19.5 * GUI_GRID_W;
			h = 12.5 * GUI_GRID_H;
		};
		class RscCombo_2100: RscCombo
		{
			idc = 2100;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class giveKey: RscButtonMenu
		{
			idc = 2400;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class dropKey: RscButtonMenu
		{
			idc = 2401;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class exit: RscButtonMenu
		{
			idc = 2402;
			text = "  Close";
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "closeDialog 0;";
		};
	};
};