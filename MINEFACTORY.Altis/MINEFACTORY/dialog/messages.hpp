class shinji_messages {
	idd = 10000;
	name= "shinji_messages";
	onLoad = "uiNamespace setVariable ['shinji_messages', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['shinji_messages', nil]";
	movingEnable = false;
	enableSimulation = true;
	class controlsBackground {
		class RscText_1000: RscText
		{
			idc = 1000;
			x = 0.252969 * safezoneW + safezoneX;
			y = 0.16 * safezoneH + safezoneY;
			w = 0.51 * safezoneW;
			h = 0.646 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			colorActive[] = {-1,-1,-1,0.7};
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "MineFactory SMS Telefon"; //--- ToDo: Localize;
			x = 0.252969 * safezoneW + safezoneX;
			y = 0.16 * safezoneH + safezoneY;
			w = 0.51 * safezoneW;
			h = 0.034 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			colorActive[] = {0.1,0.1,1,0.7};
		};
	};
	class controls {
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			text = ""; //--- ToDo: Localize;
			lineSpacing = 1; 
			style = ST_MULTI;
			x = 0.428281 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.31875 * safezoneW;
			h = 0.272 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			onLBSelChanged = "_this call life_fnc_getMessage;";
			x = 0.268906 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.143438 * safezoneW;
			h = 0.459 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			type = 1;
			text = "Senden"; //--- ToDo: Localize;
			action = "[0]spawn life_fnc_playerSent;";
			x = 0.428281 * safezoneW + safezoneX;
			y = 0.551 * safezoneH + safezoneY;
			w = 0.103594 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			onButtonClick = "[] call TON_fnc_cell_textcop";
			idc = 3016;
			type = 1;
			text = "Polizei"; //--- ToDo: Localize;
			x = 0.539844 * safezoneW + safezoneX;
			y = 0.551 * safezoneH + safezoneY;
			w = 0.095625 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class RscButton_1602: RscButton
		{
			onButtonClick = "[] call TON_fnc_cell_emsrequest";
			idc = 3022;
			type = 1;
			text = "Medic"; //--- ToDo: Localize;
			x = 0.643438 * safezoneW + safezoneX;
			y = 0.551 * safezoneH + safezoneY;
			w = 0.103594 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class RscCheckbox_2800: Life_Checkbox
		{
			idc = 2800;
			x = 0.420312 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.031875 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class RscCombo_2100: RscCombo
		{
			idc = 2100;
			x = 0.428281 * safezoneW + safezoneX;
			y = 0.211 * safezoneH + safezoneY;
			w = 0.31875 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Nachrichten"; //--- ToDo: Localize;
			x = 0.268907 * safezoneW + safezoneX;
			y = 0.245 * safezoneH + safezoneY;
			w = 0.143438 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class RscEdit_1401: RscEdit
		{
			idc = 1401;
			text = "";
			onKeyUp = "[] call life_fnc_findUser;";
			x = 0.268906 * safezoneW + safezoneX;
			y = 0.211 * safezoneH + safezoneY;
			w = 0.143438 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 0.428281 * safezoneW + safezoneX;
			y = 0.653 * safezoneH + safezoneY;
			w = 0.326719 * safezoneW;
			h = 0.136 * safezoneH;
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1101;
			text = "Position mit GPS melden?"; //--- ToDo: Localize;
			x = 0.460156 * safezoneW + safezoneX;
			y = 0.602 * safezoneH + safezoneY;
			w = 0.294844 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class RscButton_1603: RscButton
		{
			idc = 1603;
			type = 1;
			text = "Leeren"; //--- ToDo: Localize;
			onMouseButtonDblClick = "[] call life_fnc_clearMessages;";
			x = 0.268906 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.143438 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class RscButton_2489: RscButton
		{
			onButtonClick = "[] call TON_fnc_cell_textadmin";
			idc = 3017;
			type = 1;
			text = "AN Admin"; //--- ToDo: Localize;
			x = 0.428281 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.103594 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class adminanspieler: RscButton
		{
			idc = 3020;
			type = 1;
			text = "Admin Spieler"; //--- ToDo: Localize;
			onButtonClick = "[] call TON_fnc_cell_adminmsg";			
			x = 0.643438 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.103594 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class adminalle: RscButton
		{
			idc = 3021;
			type = 1;
			text = "Admin Alle"; //--- ToDo: Localize;
			onButtonClick = "[] call TON_fnc_cell_adminmsgall";
			x = 0.539844 * safezoneW + safezoneX;
			y = 0.738 * safezoneH + safezoneY;
			w = 0.095625 * safezoneW;
			h = 0.034 * safezoneH;
		};
	};
};
