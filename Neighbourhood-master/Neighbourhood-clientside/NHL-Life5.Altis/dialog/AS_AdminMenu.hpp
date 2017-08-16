class AS_menu 
{
	idd = 16000;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "closeDialog 0;[] spawn AS_fnc_openMenu;";
	
	class controlsBackground {};
	
	class controls {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.257133 * safezoneW + safezoneX;
			y = 0.224954 * safezoneH + safezoneY;
			w = 0.485734 * safezoneW;
			h = 0.550092 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			x = 0.257133 * safezoneW + safezoneX;
			y = 0.216152 * safezoneH + safezoneY;
			w = 0.485734 * safezoneW;
			h = 0.0286047 * safezoneH;
			colorBackground[] = {0,0.26,0.6,1};
		};
		class RscText_1002: Life_RscText
		{
			idc = -1;
			text = "ARMA-SERVICES.DE | ADVANCED ADMIN PANEL"; //--- ToDo: Localize;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.213952 * safezoneH + safezoneY;
			w = 0.242867 * safezoneW;
			h = 0.0330055 * safezoneH;
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 16001;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.279963 * safezoneH + safezoneY;
			w = 0.170007 * safezoneW;
			h = 0.484081 * safezoneH;
			sizeEx = 0.025;
			onLBDblClick = "[3] spawn life_fnc_ASreceiver;";
		};
		class RscText_1003: Life_RscText
		{
			idc = -1;
			text = "CONNECTED PLAYERS"; //--- ToDo: Localize;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.246958 * safezoneH + safezoneY;
			w = 0.242867 * safezoneW;
			h = 0.0330055 * safezoneH;
		};
		class RscText_1004: Life_RscText
		{
			idc = -1;
			text = "AVAILABLE ACTIONS"; //--- ToDo: Localize;
			x = 0.445355 * safezoneW + safezoneX;
			y = 0.246958 * safezoneH + safezoneY;
			w = 0.242867 * safezoneW;
			h = 0.0330055 * safezoneH;
		};
		class RscListbox_1501: Life_RscListbox
		{
			idc = 16002;
			x = 0.445355 * safezoneW + safezoneX;
			y = 0.279963 * safezoneH + safezoneY;
			w = 0.285369 * safezoneW;
			h = 0.484081 * safezoneH;
			sizeEx = 0.04;
			onLBDblClick = "[] spawn life_fnc_execute;";
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = -1;
			text = "CLOSE THIS DISPLAY"; //--- ToDo: Localize;
			x = 0.566789 * safezoneW + safezoneX;
			y = 0.777246 * safezoneH + safezoneY;
			w = 0.176078 * safezoneW;
			h = 0.0220037 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
	};
};