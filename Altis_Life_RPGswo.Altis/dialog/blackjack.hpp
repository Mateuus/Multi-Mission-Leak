/*Created by Blacklistgaming.org Coder: PapaBear */

#define GUI_GRID_X    (0)
#define GUI_GRID_Y    (0)
#define GUI_GRID_W    (0.025)
#define GUI_GRID_H    (0.043)
#define GUI_GRID_WAbs    (1)
#define GUI_GRID_HAbs    (1)
class BlackjackGUI
{
	idd = 5980;
	name="black_jack";
	movingEnabled = 0;
	enableSimulation = 1;
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
			idc = 5988;
			text = "Dealer";
			x = 5 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class RscText_1001: DWEV_RscText
		{
			idc = 5989;
			text = "Spieler";
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};

		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Blackjack";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		}; 
		
		class RscText_1013: DWEV_RscText
		{
			idc = 6000;
			text = "Gewinn: €";
			x = 5.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
	};
		
	class controls
	{
		class STAY_BTN: DWEV_RscButtonMenu
		{
			idc = 5982;
			text = "Stop";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn DWEV_fnc_BJstay;";
			x = 0.5;
			y = 0.6235;
			w = 0.1;
			h = 0.1075;
		};
		class HIT_BTN: DWEV_RscButtonMenu
		{
			idc = 5983;
			text = "Ziehen";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn DWEV_fnc_BJhit;";
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.1;
			h = 0.1075;
		};
		class TOTAL: DWEV_RscText
		{
			idc = 6007;
			text = "Gesamt: ";
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class BET_5K: DWEV_RscButtonMenu
		{
			idc = 5984;
			text = "1K";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[1000] spawn DWEV_fnc_BJbet;";
			x = 0.15;
			y = 0.817;
			w = 0.1;
			h = 0.1075;
		};
		class BET_10K: DWEV_RscButtonMenu
		{
			idc = 5985;
			text = "2K";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[2000] spawn DWEV_fnc_BJbet;";
			x = 0.325;
			y = 0.817;
			w = 0.1;
			h = 0.1075;
		};
		class BET_25K: DWEV_RscButtonMenu
		{
			idc = 5986;
			text = "4K";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[4000] spawn DWEV_fnc_BJbet;";
			x = 0.5;
			y = 0.817;
			w = 0.1;
			h = 0.1075;
		};
		class BET_50K: DWEV_RscButtonMenu
		{
			idc = 5987;
			text = "8K";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[8000] spawn DWEV_fnc_BJbet;";
			x = 0.675;
			y = 0.817;
			w = 0.1;
			h = 0.1075;
		};
		
		class Dealer_Card_1: DWEV_RscText
		{
			idc = 5990;
			x = 5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Dealer_Card_2: DWEV_RscText
		{
			idc = 5991;
			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Player_Card_1: DWEV_RscText
		{
			idc = 5992;
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Player_Card_2: DWEV_RscText
		{
			idc = 5993;
			x = 24.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Player_Card_3: DWEV_RscText
		{
			idc = 5994;
			x = 28.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Dealer_Card_4: DWEV_RscText
		{
			idc = 5995;
			x = 5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Dealer_Card_5: DWEV_RscText
		{
			idc = 5996;
			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Player_Card_4: DWEV_RscText
		{
			idc = 5997;
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Player_Card_5: DWEV_RscText
		{
			idc = 5998;
			x = 24.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		
		class Winnings: DWEV_RscText
		{
			idc = 6001;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};

		class RscText_1015: DWEV_RscText
		{
			idc = 6003;
			text = "Setzten";
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1016: DWEV_RscText
		{
			idc = 6004;
			text = "Setzten";
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1017: DWEV_RscText
		{
			idc = 6005;
			text = "Setzten";
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1018: DWEV_RscText
		{
			idc = 6006;
			text = "Setzten";
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
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