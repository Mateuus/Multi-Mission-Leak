class life_admin_menu {
	idd = 2900;
	name= "life_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_adminMenu;";

	class controlsBackground {
		class Life_RscTitleBackground: Life_RscText
	{
		idc = -1;

		x = 0.345761 * safezoneW + safezoneX;
		y = 0.268972 * safezoneH + safezoneY;
		w = 0.308477 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
	};
	class MainBackground: Life_RscText
	{
		idc = -1;

		x = 0.345761 * safezoneW + safezoneX;
		y = 0.290975 * safezoneH + safezoneY;
		w = 0.308477 * safezoneW;
		h = 0.32564 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	};

	class controls {
		class Title: Life_RscTitle
	{
		idc = 2901;

		text = "Admin Menu"; //--- ToDo: Localize;
		x = 0.345761 * safezoneW + safezoneX;
		y = 0.268972 * safezoneH + safezoneY;
		w = 0.0626594 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {0.95,0.95,0.95,1};
	};
	class PlayerList_Admin: Life_RscListBox
	{
		idc = 2902;
		onLBSelChanged = "[_this] spawn life_fnc_adminQuery";

		x = 0.355283 * safezoneW + safezoneX;
		y = 0.290975 * safezoneH + safezoneY;
		w = 0.115679 * safezoneW;
		h = 0.309107 * safezoneH;
	};
	class PlayerBInfo: Life_RscStructuredText
	{
		idc = 2903;

		x = 21.01 * GUI_GRID_W + GUI_GRID_X;
		y = 2.86 * GUI_GRID_H + GUI_GRID_Y;
		w = 13.9458 * GUI_GRID_W;
		h = 14.1876 * GUI_GRID_H;
	};
	class CloseButtonKey: Life_RscButtonMenu
	{
		onButtonClick = "closeDialog 0;";

		idc = 1005;
		text = "Close"; //--- ToDo: Localize;
		x = 0.345761 * safezoneW + safezoneX;
		y = 0.621015 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes {
				align = "center";
			};
	};
	class AdminID: Life_RscButtonMenu
	{
		onButtonClick = "[] call life_fnc_admingetID;";

		idc = 1006;
		text = "Get ID"; //--- ToDo: Localize;
		x = 0.408421 * safezoneW + safezoneX;
		y = 0.621015 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes {
				align = "center";
			};
	};
	class Compensate: Life_RscButtonMenu
	{
		idc = 2904;
		onButtonClick = "createDialog ""Life_Admin_Compensate"";";

		text = "Comp"; //--- ToDo: Localize;
		x = 0.47108 * safezoneW + safezoneX;
		y = 0.621015 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes {
				align = "center";
			};
	};
	class Spectate: Life_RscButtonMenu
	{
		idc = 2905;
		onButtonClick = "[] call life_fnc_adminSpectate;";

		text = "Spectate"; //--- ToDo: Localize;
		x = 0.53374 * safezoneW + safezoneX;
		y = 0.621015 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes {
				align = "center";
			};
	};
	class Teleport: Life_RscButtonMenu
	{
		idc = 2906;
		onButtonClick = "[] call life_fnc_adminTeleport; hint 'Select where you would like to teleport';";

		text = "Teleport"; //--- ToDo: Localize;
		x = 0.596399 * safezoneW + safezoneX;
		y = 0.621015 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes {
				align = "center";
			};
	};
	class TeleportHere: Life_RscButtonMenu
	{
		idc = 2907;
		onButtonClick = "[] call life_fnc_adminTpHere;";

		text = "TP Here"; //--- ToDo: Localize;
		x = 0.345761 * safezoneW + safezoneX;
		y = 0.654019 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes {
				align = "center";
			};
	};
	class God: Life_RscButtonMenu
	{
		idc = 2908;
		onButtonClick = "[] call life_fnc_adminGodMode;";

		text = "GodMode"; //--- ToDo: Localize;
		x = 0.408421 * safezoneW + safezoneX;
		y = 0.654019 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes {
				align = "center";
			};
	};
	class Freeze: Life_RscButtonMenu
	{
		idc = 2909;
		onButtonClick = "[] call life_fnc_adminFreeze;";

		text = "Freeze"; //--- ToDo: Localize;
		x = 0.47108 * safezoneW + safezoneX;
		y = 0.654019 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes {
				align = "center";
			};
	};
	class Markers: Life_RscButtonMenu
	{
		idc = 2910;
		onButtonClick = "[] spawn life_fnc_adminMarkers;";

		text = "Markers"; //--- ToDo: Localize;
		x = 0.53374 * safezoneW + safezoneX;
		y = 0.654019 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes {
				align = "center";
			};
	};
	class Debug: Life_RscButtonMenu
	{
		idc = 2911;
		onButtonClick = "[] call life_fnc_adminDebugCon;";

		text = "Debug"; //--- ToDo: Localize;
		x = 0.596399 * safezoneW + safezoneX;
		y = 0.654019 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes {
				align = "center";
			};
	};
	class FogControl: Life_RscButtonMenu
	{
		idc = 2907;
		onButtonClick = "[] call life_fnc_adminFog;";

		text = "Fog Off"; //--- ToDo: Localize;
		x = 0.345761 * safezoneW + safezoneX;
		y = 0.687023 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes {
				align = "center";
			};
	};
	class Purge: Life_RscButtonMenu
	{
		idc = 6847;
		onButtonClick = "[] execVM 'core\functions\fn_purge.sqf'";

		text = "The Purge"; //--- ToDo: Localize;
		x = 0.408421 * safezoneW + safezoneX;
		y = 0.687023 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes {
				align = "center";
			};
	};
	class Revive: Life_RscButtonMenu
	{
		onButtonClick = "[] call life_fnc_adminRevive;";

		idc = 1017;
		text = "Revive"; //--- ToDo: Localize;
		x = 0.47108 * safezoneW + safezoneX;
		y = 0.687023 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes {
				align = "center";
			};
	};
	class Gear: Life_RscButtonMenu
	{
		onButtonClick = "[] call life_fnc_admingear;";

		idc = 1018;
		text = "Gear"; //--- ToDo: Localize;
		x = 0.53374 * safezoneW + safezoneX;
		y = 0.687023 * safezoneH + safezoneY;
		w = 0.0602494 * safezoneW;
		h = 0.0220027 * safezoneH;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
		class Attributes {
				align = "center";
			};
		};
	};
};
