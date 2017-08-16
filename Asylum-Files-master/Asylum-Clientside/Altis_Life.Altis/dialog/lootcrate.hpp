#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class lootcrate_menu {
	idd = 22200;
	name = "lootcrate_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 15 * GUI_GRID_H;
		};
	};
	
	class controls {
		
		class MainTitle : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};			
			idc = -1;
			text = "LOOT CRATES AND KEYS"; 
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = -1;
			text = "Loot crates are semi-rare items you can find which require a matching key to be opened. Inside, you'll find all sorts  of rewards, from common to very rare."; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 26 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class RscStructuredText_1101: Life_RscStructuredText
		{
			idc = -1;
			text = "You can add keys to open loot crates on your My Asylum webpage at my.gaming-asylum.com."; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 26 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class RscText_1001: Life_RscText
		{
			idc = 22201;
			text = "POSSIBLE CONTENTS OF LOOT CRATE"; //--- ToDo: Localize;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0.4, 0, 0, 0.7};
		};
		class RscText_1002: Life_RscText
		{
			idc = -1;
			text = "Common"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0.4, 0, 0, 0.7};
		};
		class RscText_1003: Life_RscText
		{
			idc = -1;
			text = "Rare"; //--- ToDo: Localize;
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0.4, 0, 0, 0.7};
		};
		class RscText_1004: Life_RscText
		{
			idc = -1;
			text = "Limited"; //--- ToDo: Localize;
			x = 24.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0.4, 0, 0, 0.7};
		};
		class RscStructuredText_1103: Life_RscStructuredText
		{
			idc = 22202;
			text = "CommonItem"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			colorText[] = {0.12,1,0,1};
			colorBackground[] = {-1,-1,-1,0.4};
		};
		class RscStructuredText_1104: Life_RscStructuredText
		{
			idc = 22204;
			text = "RareItem"; //--- ToDo: Localize;
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			colorText[] = {0,0.44,0.87,1};
			colorBackground[] = {-1,-1,-1,0.4};
		};
		class RscStructuredText_1105: Life_RscStructuredText
		{
			idc = 22206;
			text = "LimitedItem"; //--- ToDo: Localize;
			x = 24.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			colorText[] = {0.64,0.21,0.93,1};
			colorBackground[] = {-1,-1,-1,0.4};
		};
		class RscButtonMenuOK_2600: Life_RscButtonMenu
		{
			idc = 22210;
			text = "OK";
			onButtonClick = "closeDialog 0;";
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscStructuredText_1102: Life_RscStructuredText
		{
			idc = 22212;
			text = "<a href='http://my.gaming-asylum.com'>BUY CRATE KEY</a>"; //--- ToDo: Localize;
			x = 18.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {1,-1,-1,0.8};
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 22214;
			text = "Open This Crate"; //--- ToDo: Localize;
			onButtonClick = "[1] spawn life_fnc_openLootCrate;";
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0.7,1,0.8};
		};
	};

};

