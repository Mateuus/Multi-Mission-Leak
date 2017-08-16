class compMenuGear
{
	idd = 666643;
	name = "compMenuGear";
	movingEnable = false;

	class controls
	{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;

			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 40 * GUI_GRID_W;
			h = 21 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscListbox_1500: DS_RscListBox
		{
			idc = 1500;

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.5 * GUI_GRID_W;
			h = 15.5 * GUI_GRID_H;
		};
		class RscListbox_1501: DS_RscListBox
		{
			idc = 1501;

			x = 23 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.5 * GUI_GRID_W;
			h = 15.5 * GUI_GRID_H;
		};
		class RscButtonMenu_2400: DS_RscButtonMenu
		{
			idc = 2400;

			text = "Compensate"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
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
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class RscPicture_1203: DS_RscPicture
		{
			idc = 1202;

			text = "extras\textures\menus\rightArrow.jpg"; //--- ToDo: Localize;
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 10.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class take: DS_PictureButtonMenu
		{
			idc = 1203;

			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 10.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.08};
		};
		class RscCombo_2101: DS_RscCombo
		{
			idc = 2101;

			onLBSelChanged = "[] call DS_fnc_cmUpdateGearCompType";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCombo_2102: DS_RscCombo
		{
			idc = 2102;
			onLBSelChanged = "[] call DS_fnc_cmUpdateGearList;";

			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscEdit_1400: DS_RscEdit
		{
			idc = 1400;

			text = "1";
			x = 23 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButtonMenu_2402: DS_RscButtonMenu
		{
			idc = 2402;

			text = "Update"; //--- ToDo: Localize;
			x = 30.5 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Updates the amount of the selected item"; //--- ToDo: Localize;
		};
		class RscButtonMenu_2403: DS_RscButtonMenu
		{
			idc = 2403;

			text = "Remove"; //--- ToDo: Localize;
			x = 35 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Remove the item from being compensated"; //--- ToDo: Localize;
		};
		class RscEdit_1401: DS_RscEdit
		{
			idc = 1401;

			text = "1";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1000: DS_RscText
		{
			idc = 1501;

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.5 * GUI_GRID_W;
			h = 15.5 * GUI_GRID_H;
		};
	};
};