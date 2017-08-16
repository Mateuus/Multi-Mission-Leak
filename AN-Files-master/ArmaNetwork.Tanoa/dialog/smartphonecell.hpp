class Life_my_smartphone {
	idd = 88888;
	name = "life_my_telephone_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_fapuf;";

	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.374 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Messaging"; //--- ToDo: Localize;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	class controls {
		class search: Life_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
			onKeyDown = "call life_fnc_swepr;";
		};
		class playerlist: Life_RscListbox
		{
			idc = 88881;
			text = "";
			onLBSelChanged = "[2] spawn life_fnc_fapuf;";
			sizeEx = 0.03;
			colorBackground[] = {0,0,0,0};
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.286 * safezoneH;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Write"; //--- ToDo: Localize;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_wuyuf; createDialog ""Life_smartphone_schreiben"";";
		};
		class messagelist: Life_RscListNBox
		{
			idc = 88882;
			colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[(lbCurSel 88882)] call life_fnc_sagad;";
			sizeEx = 0.03;
			columns[] = {0,0.4};
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Your Messages"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "Message"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class controlgroup: Life_RscControlsGroup
		{
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.121 * safezoneH;
			class HScrollbar : HScrollbar {
				height = 0;
				color[] = {0,0,0,1};
			};
			class controls {
				class controlgroupone: Life_RscStructuredText
				{
					idc = 88887;
					text = "";
					x = 0;
					y = 0;
					w = 0.335156 * safezoneW;
					h = 1;
				};
			};
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Reply"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[0,[] call life_fnc_druca] call life_fnc_tafru; call life_fnc_wuyuf; createDialog ""Life_smartphone_schreiben"";";
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 2402;
			text = "Delete"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[3] call life_fnc_fapuf;";
		};
		class RscButtonMenu_2403: Life_RscButtonMenu
		{
			idc = 2403;
			text = "Emergency"; //--- ToDo: Localize;
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_wuyuf; createDialog ""Life_smartphone_notruf"";";
		};
		class RscButtonMenu_2404: Life_RscButtonMenu
		{
			idc = 2404;
			text = "Close"; //--- ToDo: Localize;
			x = 0.680469 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_wuyuf;";
		};
	};
};

class Life_smartphone_notruf {
	idd = 887890;
	name= "life_my_smartphone_notruf";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[6] spawn life_fnc_tafru;";
	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.231 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Emergency"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	class controls {
		class RscButtonMenu_2404: Life_RscButtonMenu
		{
			idc = -1;
			text = "Close"; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "TSO"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[2,-1,(ctrlText 888894)] call life_fnc_tafru;";
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "EMS"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[3,-1,(ctrlText 888894)] call life_fnc_tafru;";
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 2402;
			text = "Mechanics"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[4,-1,(ctrlText 888894)] call life_fnc_tafru;";
		};
		class RscButtonMenu_2403: Life_RscButtonMenu
		{
			idc = 2403;
			text = "Admin"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[6,-1,(ctrlText 888894)] call life_fnc_tafru;";
		};
		class RscButtonMenu_2405: Life_RscButtonMenu
		{
			idc = 2405;
			text = "Server"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[7,-1,(ctrlText 888894)] call life_fnc_tafru;";
		};
		class RscEdit_1400: Life_RscEdit
		{
			idc = 888894;
			text = "";
			style = 16;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.187 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscButtonMenu_2406: Life_RscButtonMenu
		{
			idc = 2406;
			text = "TSO Message"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[8,-1,(ctrlText 888894)] call life_fnc_tafru;";
		};
	};
};

class Life_smartphone_schreiben
{
	idd = 88883;
	name = "life_my_smartphone_schreiben";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[0,(lbData[88881,(lbCurSel 88881)])] spawn life_fnc_tafru;";
	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.187 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Direct Message"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	class controls {
		class RscButtonMenu_2404: Life_RscButtonMenu
		{
			idc = 2404;
			text = "Close"; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class RscEdit_1400: Life_RscEdit
		{
			idc = 88884;
			text = "";
			style = 16;
			colorBackground[] = {0,0,0,0};
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.099 * safezoneH;
		};
		class RscButtonMenu_2407: Life_RscButtonMenu
		{
			idc = 2407;
			text = "Send"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[1,-1,(ctrlText 88884)] call life_fnc_tafru;";
		};
	};
};
