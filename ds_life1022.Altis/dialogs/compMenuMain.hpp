class compMenuMain
{
	idd = 666641;
	name = "compMenuMain";
	movingEnable = false;

	class controls
	{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscButtonMenu_2400: DS_RscButtonMenu
		{
			idc = 2400;
			onButtonClick = "[] spawn DS_fnc_cmItems;";
			text = "Items"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButtonMenu_2401: DS_RscButtonMenu
		{
			idc = 2401;
			onButtonClick = "[] spawn DS_fnc_cmGear;";
			text = "Gear"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButtonMenu_2402: DS_RscButtonMenu
		{
			idc = 2402;
			onButtonClick = "[] spawn DS_fnc_cmVehicles;";
			text = "Vehicles"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButtonMenu_2403: DS_RscButtonMenu
		{
			idc = 2403;
			onButtonClick = "[] spawn DS_fnc_cmMoney;";
			text = "Money"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButtonMenu_2404: DS_RscButtonMenu
		{
			idc = 2404;
			text = "Close"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick = "closeDialog 0;";
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};