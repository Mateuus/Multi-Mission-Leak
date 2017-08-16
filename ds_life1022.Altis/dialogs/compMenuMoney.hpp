class compMenuMoney
{
	idd = 666645;
	name = "compMenuMoney";
	movingEnable = false;

	class controls
	{
        class IGUIBack_2200: IGUIBack
        {
        	idc = 2200;
        	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 27 * GUI_GRID_W;
        	h = 5 * GUI_GRID_H;
        	colorBackground[] = {0,0,0,0.7};
        };
        class RscButtonMenu_2400: DS_RscButtonMenu
        {
        	idc = 2400;
        	text = "Compensate"; //--- ToDo: Localize;
        	x = 7 * GUI_GRID_W + GUI_GRID_X;
        	y = 14 * GUI_GRID_H + GUI_GRID_Y;
        	w = 12.5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        	colorText[] = {1,1,1,1};
        	colorBackground[] = {0,0,0,0.8};
        };
        class RscButtonMenu_2401: DS_RscButtonMenu
        {
        	idc = 2401;
        	onButtonClick = "closeDialog 0;";
        	text = "Close"; //--- ToDo: Localize;
        	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 14 * GUI_GRID_H + GUI_GRID_Y;
        	w = 12.5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        	colorText[] = {1,1,1,1};
        	colorBackground[] = {0,0,0,0.8};
        };
        class RscEdit_1400: DS_RscEdit
        {
        	idc = 1400;
			text = "";
        	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 16 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };
        class RscCombo_2100: DS_RscCombo
        {
        	idc = 2100;
        	x = 16 * GUI_GRID_W + GUI_GRID_X;
        	y = 11 * GUI_GRID_H + GUI_GRID_Y;
        	w = 9 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };
	};
};