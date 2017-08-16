////////////////////////////////////////////////////////
// ArmA.Network
////////////////////////////////////////////////////////
class life_admin_menu {
	idd = 2900;
	name= "life_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_adminMenu;";

	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.429 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			colorActive[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "ArmA.Network Admin Menu";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls {
		class RscText_1002: Life_RscText
		{
			idc = -1;
			text = "Select Player:";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[_this] spawn life_fnc_adminQuery";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.319 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class RscText_1003: Life_RscText
		{
			idc = -1;
			text = "Info:";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 2903;
			text = "";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.319 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = -1;
			text = "Close Admin Panel";
			onButtonClick = "closeDialog 0;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = -1;
			text = "Get Player ID";
			onButtonClick = "[] call life_fnc_admingetID;";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 2402;
			text = "Declare Terror";
			onButtonClick = "[] execVM 'core\functions\fn_terrorAttack.sqf'";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2403: Life_RscButtonMenu
		{
			idc = 2403;
			text = "Spectate";
			onButtonClick = "[] call life_fnc_adminSpectate;";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2404: Life_RscButtonMenu
		{
			idc = 2404;
			text = "Teleport";
			onButtonClick = "[] call life_fnc_adminTeleport; hint 'Select where you would like to teleport';";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2405: Life_RscButtonMenu
		{
			idc = 2405;
			text = "Teleport To ";
			onButtonClick = "[] call life_fnc_adminTpHere;";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2406: Life_RscButtonMenu
		{
			idc = 2406;
			text = "Freeze Player";
			onButtonClick = "[] call life_fnc_adminFreeze;";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2407: Life_RscButtonMenu
		{
			idc = 2407;
			text = "God Mode";
			onButtonClick = "[] call life_fnc_adminGodMode;";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2408: Life_RscButtonMenu
		{
			idc = 2408;
			text = "Markers";
			onButtonClick = "[] spawn life_fnc_adminMarkers;";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2409: Life_RscButtonMenu
		{
			idc = 2409;
			text = "Cleanup";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2410: Life_RscButtonMenu
		{
			idc = 2410;
			text = "Not Used";
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscStructuredText_1101: Life_RscStructuredText
		{
			idc = -1;
			text = "Abusing will lead to powers and access being revoked. All admin actions are logged.";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
	};
};
