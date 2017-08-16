
class bootMenu {

	idd = 666668;
	movingEnable = true;
	enableSimulation = true;
	name = "bootMenu";
	
	class controlsBackground {
	
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 40 * GUI_GRID_W;
			h = 12 * GUI_GRID_H;
		};
	};
	
	class controls {
		
		
		class header: DS_RscPicture
		{
			idc = 1277;
			text = "extras\textures\menus\vehicleBoot.jpg";
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 40 * GUI_GRID_W;
			h = 5.5 * GUI_GRID_H;
		};

		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
		};
		class RscListbox_1501: RscListbox
		{
			idc = 1501;
			x = 23.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
		};
		class RscPicture_1200: DS_RscPicture
		{
			idc = 1200;
			text = "extras\textures\menus\leftArrow.jpg";
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class store: DS_PictureButtonMenu
		{
			idc = 1203;
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscPicture_1201: DS_RscPicture
		{
			idc = 1201;
			text = "extras\textures\menus\rightArrow.jpg";
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class take: DS_PictureButtonMenu
		{
			idc = 1204;
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			text = "1";
			x = 5.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscEdit_1401: RscEdit
		{
			idc = 1401;
			text = "1";
			x = 26.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscShortcutButtonMain_2000: RscButtonMenu
		{
			idc = 2000;
			text = "       Close";
			x = 15 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "closeDialog 0;";
		};
		class RscText_1000: DS_RscStructuredText
		{
			idc = 1000;
			x = 5.7 * GUI_GRID_W + GUI_GRID_X;
			y = 6.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1001: DS_RscStructuredText
		{
			idc = 1001;
			x = 24.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class Weight: DS_RscStructuredText
		{
			idc = 1002;
			x = 18.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};