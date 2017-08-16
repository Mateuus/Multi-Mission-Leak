/*
	File: slot_machine.hpp
        Author: Jacob "PapaBear" Tyler
	Description: Gui for slotmachine
*/

#define GUI_GRID_X    (0)
#define GUI_GRID_Y    (0)
#define GUI_GRID_W    (0.025)
#define GUI_GRID_H    (0.04)
#define GUI_GRID_WAbs    (1)
#define GUI_GRID_HAbs    (1)

class SlotMachineGUI
{
	idd = 5780;
	movingEnabled = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton;";
	
	class controlsBackground
	{
	
		class wolftablet: DWEV_RscPicture
		{
			idc = 505000;
			text = "";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
		
		class RscText_1000: DWEV_RscText
		{
			idc = 5774;
			text = "Gewinn: €";
			x = 5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.7;
			w = 5 * GUI_GRID_W;
			h = 0.08;
		};
			
		class RscText_1003: DWEV_RscText
		{
			idc = 5783;
			text = "Setze";
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W; 
			h = 1 * GUI_GRID_H;//1
		};
		class RscText_1004: DWEV_RscText
		{
			idc = 5784;
			text = "Setze";
			x = 15 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;//1
		};
		class RscText_1005: DWEV_RscText
		{
			idc = 5786;
			text = "Setze";
			x = 23 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;//1
		};
		class RscText_1006: DWEV_RscText
		{
			idc = 5787;
			text = "Setze";
			x = 32 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H; //1
		};
		
		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Slot Maschiene";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		}; 
		
	};
	
	class controls
	{
	
		class SLOT_1: DWEV_RscPicture
		{
			idc = 5771;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
		};
		class SLOT_2: DWEV_RscPicture
		{
			idc = 5772;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
		};
		class SLOT_3: DWEV_RscPicture
		{
			idc = 5773;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
		};
		
		class Winnings: DWEV_RscText
		{
			idc = 5775;
			test = "";
			x = 18.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		
		class BET_5K: DWEV_RscButtonMenu
		{
			idc = 5778;
			text = "5K";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[5000] spawn DWEV_fnc_slotSpin;";
			x = 5 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class BET_50K: DWEV_RscButtonMenu
		{
			idc = 5779;
			text = "50K";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[50000] spawn DWEV_fnc_slotSpin;";
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class BET_25K: DWEV_RscButtonMenu
		{
			idc = 5781;
			text = "25K";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[25000] spawn DWEV_fnc_slotSpin;";
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class BET_10K: DWEV_RscButtonMenu
		{
			idc = 5782;
			text = "10K";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[10000] spawn DWEV_fnc_slotSpin;";
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		
		class ctrl_icon_grafik_shutdown: DWEV_RscPicture
		{
			idc = 507003;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_shutdown.paa";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
		
		class ctrl_icon_button_shutdown: DWEV_RscButtonInvisible
		{
			idc = 507004;
			text = "";
			tooltip = "Tablet ausschalten";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
		
	};
};