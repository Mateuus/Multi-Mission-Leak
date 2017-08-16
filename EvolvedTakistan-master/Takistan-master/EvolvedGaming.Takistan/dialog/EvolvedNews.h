class Evolved_Life_News {
	idd = 1526;
	name= "Evolved_Life_News";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_EvolvedNews;";
	
	class controlsBackground {
		class Life_RscTitleBackground: Life_RscText
		{
			idc = -1;
			text = "EvolvedGaming News System"; //--- ToDo: Localize;
			x = 0.1875;
			y = 0.18;
			w = 0.65;
			h = 0.04;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		
		class MainBackground: Life_RscText
		{
			idc = -1;
			x = 0.1875;
			y = 0.22;
			w = 0.65;
			h = 0.16;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	
	class controls {
		class NewsToSend: Life_RscEdit
		{
			text = "";
			idc = 1400;
			x = 0.2;
			y = 0.24;
			w = 0.6125;
			h = 0.04;
		};
		
		class Channel7Button: life_RscButtonMenu
		{
			idc = 1600;
			text = "Channel 7 BroadCast"; 
			onButtonClick = "[] call TON_fnc_news_broadcast_Channel7";
			x = 0.2;
			y = 0.3;
			w = 0.2;
			h = 0.04;
		};
		class AdminButton: life_RscButtonMenu
		{
			idc = 1601;
			text = "Admin BroadCast"; 
			onButtonClick = "[] call TON_fnc_news_broadcast_Admin";
			x = 0.425;
			y = 0.3;
			w = 0.1625;
			h = 0.04;
		};
		class GovButton: life_RscButtonMenu
		{
			idc = 1602;
			text = "Government Broadcast"; 
			onButtonClick = "[] call TON_fnc_news_broadcast_Gov";	
			x = 0.6125;
			y = 0.3;
			w = 0.2;
			h = 0.04;
		};
	};
};
