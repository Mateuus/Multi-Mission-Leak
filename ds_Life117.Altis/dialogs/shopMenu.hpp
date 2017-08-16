#include "defines.sqf"
class shopMenu {

	idd = 666667;
	movingEnable = true;
	enableSimulation = true;
	name = "shopMenu";
	
	class controlsBackground {
	
		class background: IGUIBack
		{
			idc = 2200;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 16 * GUI_GRID_H;
			moving = 1;
		};
		class title: DS_RscPicture
		{
			idc = 1100;
			text = "extras\textures\menus\interactionMenu.jpg";
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = -3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 8 * GUI_GRID_H;
		};
	};
	
	class controls {
		
		
		class listbox1: DS_RscListbox
		{
			idc = 1500;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 12 * GUI_GRID_H;
			onLBSelChanged = "_this call DS_fnc_shopLBChange";
		};
		
		class listbox3: RscListbox
		{
			idc = 1501;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 12 * GUI_GRID_H;
			onLBSelChanged = "_this call DS_fnc_carShopLBChange";
		};
		
		class closeButton: RscButtonMenu
		{
			idc = 66650;
			text = "     Close";
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "closeDialog 0;";
		};
		class RscButtonMenuOK_2601: RscButtonMenu
		{
			idc = 777;
			x = 10 * GUI_GRID_W + GUI_GRID_X;//11.5
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;//19.5
			h = 1.5 * GUI_GRID_H;
		};
		class RscButtonMenuOK_2602: RscButtonMenu
		{
			idc = 778;
			x = 17.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class colourSelect: DS_RscCombo
		{
			idc = 66653;
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class selectAmount: RscButtonMenu
		{
			idc = 66654;
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscCheckbox_2800: RscButtonMenu
		{
			idc = 1212;
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 19.12 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.75 * GUI_GRID_W;
			h = 0.75 * GUI_GRID_H;
		};
		class RscCheckbox_2801: RscButtonMenu
		{
			idc = 1213;
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 19.12 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.75 * GUI_GRID_W;
			h = 0.75 * GUI_GRID_H;
		};
		class RscCheckbox_2802: RscButtonMenu
		{
			idc = 1214;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 19.12 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.75 * GUI_GRID_W;
			h = 0.75 * GUI_GRID_H;
		};
		class RscCheckbox_2803: RscButtonMenu
		{
			idc = 1215;
			x = 32 * GUI_GRID_W + GUI_GRID_X;
			y = 19.12 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.75 * GUI_GRID_W;
			h = 0.75 * GUI_GRID_H;
		};
		class RscCheckbox_2804: RscButtonMenu
		{
			idc = 1216;
			x = 33 * GUI_GRID_W + GUI_GRID_X;
			y = 19.12 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.75 * GUI_GRID_W;
			h = 0.75 * GUI_GRID_H;
		};
		class RscCheckbox_2805: RscButtonMenu
		{
			idc = 1217;
			x = 34 * GUI_GRID_W + GUI_GRID_X;
			y = 19.12 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.75 * GUI_GRID_W;
			h = 0.75 * GUI_GRID_H;
		};
		class RscCheckbox_2806: RscButtonMenu
		{
			idc = 1218;
			x = 35 * GUI_GRID_W + GUI_GRID_X;
			y = 19.12 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.75 * GUI_GRID_W;
			h = 0.75 * GUI_GRID_H;
		};
		class RscCheckbox_2807: RscButtonMenu
		{
			idc = 1219;
			x = 36 * GUI_GRID_W + GUI_GRID_X;
			y = 19.12 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.75 * GUI_GRID_W;
			h = 0.75 * GUI_GRID_H;
		};
	};
};

// .columns
