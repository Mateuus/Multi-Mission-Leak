////////////////////////////////////////////////////////
// ArmA.Network
// R4thbone
////////////////////////////////////////////////////////

class an_gangmenu {
	idd = 2620;
	name= "an_gangmenu";
	movingEnable = 0;
	enableSimulation = 1;
	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			text = "";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.386719 * safezoneW;
			h = 0.396 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	class controls {
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "Online Gang Members"; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Your Gang - Gang Name"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.386719 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			text = "";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.33 * safezoneH;
			sizeEx = 0.035;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Close"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.386719 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "Current Gang Level:"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1004: Life_RscText
		{
			idc = 1004;
			text = "Gang Bank:"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Upgrade Gang Level"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] spawn life_fnc_fruwruna";
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 2402;
			text = "Kick Member"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_pawracup";
		};
		class RscButtonMenu_2403: Life_RscButtonMenu
		{
			idc = 2403;
			text = "Set Leader"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] spawn life_fnc_qefresaf";
		};
		class RscButtonMenu_2404: Life_RscButtonMenu
		{
			idc = 2404;
			text = "Rank Member Up"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[0] call life_fnc_wrezafra;";
		};
		class RscButtonMenu_2405: Life_RscButtonMenu
		{
			idc = 2405;
			text = "Rank Member Down"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[1] call life_fnc_wrezafra;";
		};
		class RscButtonMenu_2406: Life_RscButtonMenu
		{
			idc = 2406;
			text = "Offline Members"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; [player,(life_gangData select 0)] remoteExecCall [""life_fnc_offlineGangMembers"",2];";
		};
		class RscButtonMenu_2407: Life_RscButtonMenu
		{
			idc = 2407;
			text = "Gang Zones"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; call life_fnc_stefustaprake;";
		};
		class RscButtonMenu_2408: Life_RscButtonMenu
		{
			idc = 2408;
			text = "Leave Gang"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_veprudre";
		};
		class RscButtonMenu_2409: Life_RscButtonMenu
		{
			idc = 2409;
			text = "Disband Gang"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] spawn life_fnc_themeche;";
		};
	};
};


class an_gangzones {
	idd = 2623;
	name= "an_gangzones";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class RscText_1000: RscText
		{
			idc = -1;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.286 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1002: Life_RscText
		{
			idc = -1;
			text = "Gang Control Points"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	class controls {
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			text = "";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.242 * safezoneH;
			sizeEx = 0.035;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Close"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
	};
};


class an_gangoffline {
	idd = 2625;
	name= "an_gangoffline";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			text = "";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.286 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Offline Gang Members"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	class controls {
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Close"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			text = "";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.209 * safezoneH;
			sizeEx = 0.035;
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Remove"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_caruvuwuzeswa;";
		};
	};
};



class Life_Create_Gang_Diag {
	idd = 2521;
	name= "life_my_gang_menu_create";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2521)}; ((findDisplay 2521) displayCtrl 1100) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(getNumber(missionConfigFile >> ""CfgGangs"" >> ""life_gang_price""))] call life_fnc_rupadudejat]};";
	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Create your New Gang"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	class controls {
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Close"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class RscEdit_1400: Life_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Confirm and Create"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_chuhespu;";
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};
