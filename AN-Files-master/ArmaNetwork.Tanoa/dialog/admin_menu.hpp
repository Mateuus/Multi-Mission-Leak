////////////////////////////////////////////////////////
// ArmA.Network
////////////////////////////////////////////////////////
class an_admin_menu {
	idd = 2900;
	name= "an_admin_menu";
	movingEnable = 0;
	enableSimulation = 1;
	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.53625 * safezoneW;
			h = 0.594 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "Admin Menu"; //--- ToDo: Localize;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.53625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.517 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	class controls {
		class playersearch: Life_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
			onKeyDown = "call life_fnc_gecra;";
			colorBackground[] = {0,0,0,0.7};
		};
		class playerlist: Life_RscListbox
		{
			idc = 1500;
			text = "";
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.517 * safezoneH;
			sizeEx = 0.03;
			onLBSelChanged = "_this call life_fnc_yayar";
			colorBackground[] = {0,0,0,0};
		};
		class RscText_1004: Life_RscText
		{
			idc = 1004;
			text = "Players"; //--- ToDo: Localize;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class playerinfotext: Life_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "Player Specific Tools"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1005: Life_RscText
		{
			idc = 1005;
			text = "Player Information"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "To Player (With Vehicle)"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[0] call life_fnc_raber;";
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "To Player (Without Vehicle)"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[1] call life_fnc_raber;";
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 2402;
			text = "To Admin (Without Vehicle)"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[2] call life_fnc_raber;";
		};
		class RscButtonMenu_2403: Life_RscButtonMenu
		{
			idc = 2403;
			text = "To Admin (With Vehicle)"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[3] call life_fnc_raber;";
		};
		class RscButtonMenu_2404: Life_RscButtonMenu
		{
			idc = 2404;
			text = "Freeze"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_praha;";
		};
		class RscButtonMenu_2405: Life_RscButtonMenu
		{
			idc = 2405;
			text = "Spectate"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_zaqud;";
		};
		class RscButtonMenu_2406: Life_RscButtonMenu
		{
			idc = 2406;
			text = "Strip"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2407: Life_RscButtonMenu
		{
			idc = 2407;
			text = "Send Message"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2408: Life_RscButtonMenu
		{
			idc = 2408;
			text = "Kick"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1006: Life_RscText
		{
			idc = 1006;
			text = "Server Tools"; //--- ToDo: Localize;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButtonMenu_2409: Life_RscButtonMenu
		{
			idc = 2409;
			text = "God Mode"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_sagay;";
		};
		class RscButtonMenu_2410: Life_RscButtonMenu
		{
			idc = 2410;
			text = "Map Markers"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] spawn life_fnc_kases;";
		};
		class RscButtonMenu_2411: Life_RscButtonMenu
		{
			idc = 2411;
			text = "Teleport"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_teguh; hintSilent 'Select where you would like to teleport';";
		};
		class RscButtonMenu_2412: Life_RscButtonMenu
		{
			idc = 2412;
			text = "Seize Items"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] spawn life_fnc_seize;";
		};
		class RscButtonMenu_2413: Life_RscButtonMenu
		{
			idc = 2413;
			text = "Delete"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_tuyed;";
		};
		class RscButtonMenu_2415: Life_RscButtonMenu
		{
			idc = 2415;
			text = "Close"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.427969 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_brefr";
		};
		class RscButtonMenu_2414: Life_RscButtonMenu
		{
			idc = 2414;
			text = "Cleanup"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] spawn AN_server_deleteAllVehicles; closeDialog 0; hint ""Server cleanup ran, Do not spam this!""; ";
		};
		class RscButtonMenu_2416: Life_RscButtonMenu
		{
			idc = 2416;
			text = "Spare"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class vehiclelist: Life_RscListbox
		{
			idc = 1501;
			text = "";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.308 * safezoneH;
			sizeEx = 0.03;
			colorBackground[] = {0,0,0,0};
		};
	};
};
