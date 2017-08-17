/*Created by Blacklistgaming.org Coder: PapaBear */


class BlackjackGUI
{	
	idd = 5980;	name="black_jack";	
	movingEnabled = 0;	
	enableSimulation = 1;	
	onLoad = "";		
	
	class controlsBackground	
	{			
		class TitleBackground: Life_RscText
		{
			idc = -1;
			x = 0.270856 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.231,0.749,0.89,1};
		};
		class MainBackground: Life_RscText
		{
			idc = -1;
			x = 0.270856 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.473 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Title: Life_RscText
		{
			idc = -1;
			text = "Black Jack"; //--- ToDo: Localize;
			x = 0.270856 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.458333 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};			
		
		class RscText_1000: life_RscText		
		{			
			idc = 5988;			
			text = "Dealer"; //--- ToDo: Localize;			
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;		
		};		
		
		class RscText_1001: life_RscText		
		{			
			idc = 5989;			
			text = "Player"; //--- ToDo: Localize;			
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;	
		};					
		
		class RscText_1013: life_RscText		
		{			
			idc = 6000;			
			text = "Winnings: $"; //--- ToDo: Localize;			
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.044 * safezoneH;		
		};	
	};			
	
	class controls	
	{		
		class STAY_BTN: life_RscButtonMenu		
		{			
			idc = 5982;			
			text = "Stay"; //--- ToDo: Localize;			
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};			
			onButtonClick = "[] spawn life_fnc_BJstay;";			
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;	
		};		
		
		class HIT_BTN: life_RscButtonMenu		
		{			
			idc = 5983;			
			text = "Hit"; //--- ToDo: Localize;			
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};			
			onButtonClick = "[] spawn life_fnc_BJhit;";			
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;		
		};		
		
		class TOTAL: life_RscText		
		{			
			idc = 6007;			
			text = "Total: "; //--- ToDo: Localize;			
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;	
		};		
		
		class BET_5K: life_RscButtonMenu		
		{			
			idc = 5984;			
			text = "5K"; //--- ToDo: Localize;			
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};			
			onButtonClick = "[5000] spawn life_fnc_BJbet;";			
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;		
		};		
		
		class BET_10K: life_RscButtonMenu		
		{			
			idc = 5985;			
			text = "10K"; //--- ToDo: Localize;			
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};			
			onButtonClick = "[10000] spawn life_fnc_BJbet;";			
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;	
		};		
		
		class BET_25K: life_RscButtonMenu		
		{			
			idc = 5986;			
			text = "25K"; //--- ToDo: Localize;			
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};			
			onButtonClick = "[25000] spawn life_fnc_BJbet;";			
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;	
		};		
		
		class BET_50K: life_RscButtonMenu		
		{			
			idc = 5987;			
			text = "50K"; //--- ToDo: Localize;			
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};			
			onButtonClick = "[50000] spawn life_fnc_BJbet;";			
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;	
		};				
		
		class Dealer_Card_1: life_RscText		
		{			
			idc = 5990;			
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;	
		};		
		
		class Dealer_Card_2: life_RscText		
		{			
			idc = 5991;			
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;		
		};		
		
		class Player_Card_1: life_RscText		
		{			
			idc = 5992;			
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;		
		};		
		
		class Player_Card_2: life_RscText		
		{			
			idc = 5993;			
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;		
		};		
		
		class Player_Card_3: life_RscText		
		{			
			idc = 5994;			
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;	
		};		
		
		class Dealer_Card_4: life_RscText		
		{			
			idc = 5995;			
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;		
		};		
		
		class Dealer_Card_5: life_RscText		
		{			
			idc = 5996;			
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;		
		};		
		
		class Player_Card_4: life_RscText		
		{			
			idc = 5997;			
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;		
		};		
		
		class Player_Card_5: life_RscText		
		{			
			idc = 5998;			
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;		
		};				
		
		class Winnings: life_RscText		
		{			
			idc = 6001;			
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;	
		};		
		
		class EXIT_BTN: life_RscButtonMenu		
		{			
			idc = 6002;			
			text = "EXIT"; //--- ToDo: Localize;			
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};			
			onButtonClick = "closeDialog 0;";			
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;	
		};		
		
		class RscText_1015: life_RscText		
		{			
			idc = 6003;			
			text = "BET"; //--- ToDo: Localize;			
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.022 * safezoneH;
		};		
		
		class RscText_1016: life_RscText		
		{			
			idc = 6004;			
			text = "BET"; //--- ToDo: Localize;			
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.022 * safezoneH;		
		};		
		
		class RscText_1017: life_RscText		
		{			
			idc = 6005;			
			text = "BET"; //--- ToDo: Localize;			
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.022 * safezoneH;	
		};		
		
		class RscText_1018: life_RscText		
		{			
			idc = 6006;			
			text = "BET"; //--- ToDo: Localize;			
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.022 * safezoneH;	
		};	
	};
};