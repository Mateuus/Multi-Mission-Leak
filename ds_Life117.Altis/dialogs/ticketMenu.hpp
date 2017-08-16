
class ticketMenu {

	idd = 666677;
	movingEnable = true;
	enableSimulation = true;
	name = "ticketMenu";
	
	class controlsBackground {
	
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20.5 * GUI_GRID_W;
			h = 8 * GUI_GRID_H;
		};
	};
	
	class controls {
		
		
		class reason: RscEdit
		{
			idc = 1400;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Enter ticket reason";
		};
		class amount: RscEdit
		{
			idc = 1401;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "0";
		};
		class RscPicture_1200: DS_RscPicture
		{
			idc = 1200;
			text = "\extras\textures\menus\policeBanner.jpg";
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20.5 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
		};
		class ticketPrices: RscButtonMenu
		{
			idc = 2400;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class issueTicket: RscButtonMenu
		{
			idc = 2401;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class close: RscButtonMenu
		{
			idc = 2402;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};
