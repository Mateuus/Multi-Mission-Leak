class compMenuVehicles
{
	idd = 666644;
	name = "compMenuVehicles";
	movingEnable = false;
	onLoad = "";

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
		class IGUIBack_2201: IGUIBack
		{
			idc = 2201;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 19.5 * GUI_GRID_W;
			h = 17 * GUI_GRID_H;
			colorBackground[] = {0.28,0.28,0.28,0.28};
		};
		class RscListbox_1500: DS_RscListBox
		{
			idc = 1500;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 17 * GUI_GRID_H;
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
		class RscCombo_2101: DS_RscCombo
		{
			idc = 2101;
			onLBSelChanged = "[] call DS_fnc_cmUpdateVehicleList;";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCombo_2102: DS_RscCombo
		{
			idc = 2102;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 19.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2800: DS_RscCheckbox
		{
			idc = 2800;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2801: DS_RscCheckbox
		{
			idc = 2801;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2802: DS_RscCheckbox
		{
			idc = 2802;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2803: DS_RscCheckbox
		{
			idc = 2803;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2804: DS_RscCheckbox
		{
			idc = 2804;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2805: DS_RscCheckbox
		{
			idc = 2805;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2806: DS_RscCheckbox
		{
			idc = 2806;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2807: DS_RscCheckbox
		{
			idc = 2807;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2808: DS_RscCheckbox
		{
			idc = 2808;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2809: DS_RscCheckbox
		{
			idc = 2809;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2810: DS_RscCheckbox
		{
			idc = 2810;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2811: DS_RscCheckbox
		{
			idc = 2811;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2812: DS_RscCheckbox
		{
			idc = 2812;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2813: DS_RscCheckbox
		{
			idc = 2813;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2814: DS_RscCheckbox
		{
			idc = 2814;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscCheckbox_2815: DS_RscCheckbox
		{
			idc = 2815;
			onCheckedChanged = "_this call DS_fnc_cmCheckBoxChanged;";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Insurance X1 Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1002: DS_RscText
		{
			idc = 1002;
			text = "Insurance X2 Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1003: DS_RscText
		{
			idc = 1003;
			text = "Capacity Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1004: DS_RscText
		{
			idc = 1004;
			text = "Super Capacity Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1005: DS_RscText
		{
			idc = 1005;
			text = "Fuel Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1006: DS_RscText
		{
			idc = 1006;
			text = "Super Fuel Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1007: DS_RscText
		{
			idc = 1007;
			text = "Security Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1008: DS_RscText
		{
			idc = 1008;
			text = "Super Security Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1009: DS_RscText
		{
			idc = 1009;
			text = "Animal Repellent Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1010: DS_RscText
		{
			idc = 1010;
			text = "Airbags Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1011: DS_RscText
		{
			idc = 1011;
			text = "Special Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1012: DS_RscText
		{
			idc = 1012;
			text = "Vehicle Ammo Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1013: DS_RscText
		{
			idc = 1013;
			text = "Thermal Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1014: DS_RscText
		{
			idc = 1014;
			text = "Bulletproof Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1015: DS_RscText
		{
			idc = 1015;
			text = "CCU Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1016: DS_RscText
		{
			idc = 1016;
			text = "GCU Upgrade"; //--- ToDo: Localize;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};