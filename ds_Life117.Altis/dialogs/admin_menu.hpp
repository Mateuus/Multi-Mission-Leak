class DS_admin_menu {
	idd = 2900;
	name= "DS_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn DS_fnc_adminMenu;";
	
	class controls {

		
		class backGround: IGUIBack
		{
			idc = 2200;
			text = ""; //--- ToDo: Localize;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 40 * GUI_GRID_W;
			h = 25 * GUI_GRID_H;
		};
		class playerList: DS_RscListBox
		{
			idc = 2902;
			text = ""; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.5 * GUI_GRID_W;
			h = 24 * GUI_GRID_H;
			onLBDblClick = "[] spawn DS_fnc_adminSpectate;";
			onLBSelChanged = "[_this] spawn DS_fnc_adminQuery";
		};
		class playerInformation: DS_RscStructuredText
		{
			idc = 1000;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 25 * GUI_GRID_W;
			h = 7.5 * GUI_GRID_H;
			text = "";
		};
		class textInput: RscEdit
		{
			idc = 2462;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 25 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "";
		};
		class RscButton_1600: DS_RscButtonMenu
		{
			idc = 1600;
			x = 14.55 * GUI_GRID_W + GUI_GRID_X;
			y = 10.54 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1601: DS_RscButtonMenu
		{
			idc = 1601;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1602: DS_RscButtonMenu
		{
			idc = 1602;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1603: DS_RscButtonMenu
		{
			idc = 1603;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1604: DS_RscButtonMenu
		{
			idc = 1604;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1605: DS_RscButtonMenu
		{
			idc = 1605;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1606: DS_RscButtonMenu
		{
			idc = 1606;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1607: DS_RscButtonMenu
		{
			idc = 1607;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1608: DS_RscButtonMenu
		{
			idc = 1608;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1609: DS_RscButtonMenu
		{
			idc = 1609;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1610: DS_RscButtonMenu
		{
			idc = 1610;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1611: DS_RscButtonMenu
		{
			idc = 1611;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1612: DS_RscButtonMenu
		{
			idc = 1612;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1613: DS_RscButtonMenu
		{
			idc = 1613;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1614: DS_RscButtonMenu
		{
			idc = 1614;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1615: DS_RscButtonMenu
		{
			idc = 1615;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1616: DS_RscButtonMenu
		{
			idc = 1616;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
	};
};