class jailMenu {
	idd = 2700;
	name= "jailMenu";
	movingEnable = false;
	enableSimulation = true;

	class controls
	{
		class background: IGUIBack
		{
			idc = 2200;
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 12 * GUI_GRID_H;
		};
		class RscButton_1600: DS_RscButtonMenu
		{
			idc = 1600;
			text = "Send To Jail";
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "[] spawn DS_cop_jailCiv";
		};
		class RscButton_1701: DS_RscButtonMenu
		{
			idc = 1701;
			text = "Check Info";
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5* GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "[] call DS_cop_checkCharges";
		};
		class RscButton_1601: DS_RscButtonMenu
		{
			idc = 1601;
			text = "Close";
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "closeDialog 0;";
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Minutes"; //--- ToDo: Localize;
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};

		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			text = "1";
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};

		class RscEdit_1401: RscEdit
		{
			idc = 1401;
			text = "No reason entered";
			x = 15 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Reason"; //--- ToDo: Localize;
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};