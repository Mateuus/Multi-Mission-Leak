class tempBanList {
	idd = 2901;
    name = "tempBanList";
    movingEnable = false;
	enableSimulation = true;

	class controls
	{
        class IGUIBack_2200: IGUIBack
        {
        	idc = 2200;
        	x = 6 * GUI_GRID_W + GUI_GRID_X;
        	y = 5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 28 * GUI_GRID_W;
        	h = 15 * GUI_GRID_H;
        };
        class RscListbox_1500: RscListbox
        {
        	idc = 1500;
        	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 27 * GUI_GRID_W;
        	h = 12.5 * GUI_GRID_H;
        };
        class RscButtonMenu_2400: RscButtonMenu
        {
        	idc = 2400;
        	text = ""; //--- ToDo: Localize;
        	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 10 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };
        class RscButtonMenu_2401: RscButtonMenu
        {
        	idc = 2401;
        	text = ""; //--- ToDo: Localize;
        	x = 17 * GUI_GRID_W + GUI_GRID_X;
        	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 10 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };
        class RscButtonMenu_2402: RscButtonMenu
        {
        	idc = 2402;
        	text = ""; //--- ToDo: Localize;
        	x = 27.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 6 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };
	};
};