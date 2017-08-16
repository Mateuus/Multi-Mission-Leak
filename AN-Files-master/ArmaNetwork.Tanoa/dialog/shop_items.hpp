////////////////////////////////////////////////////////
// ArmA.Network
////////////////////////////////////////////////////////
class shops_menu {
	idd = 2400;
	name= "shops_menu";
	movingEnable = 0;
	enableSimulation = 1;
	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			text = "";
			x = 0.345315 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.319 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "Shop - "; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	class controls {
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = -1;
			text = "Close"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Available Items"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "Your Inventory"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class shopinv: Life_RscListbox
		{
			idc = 2401;
			text = "";
			x = 0.355623 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.187 * safezoneH;
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0.6};
		};
		class playerinv: Life_RscListbox
		{
			idc = 2402;
			text = "";
			x = 0.510311 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.187 * safezoneH;
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2406;
			text = "Buy"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] spawn life_fnc_virt_buy;";
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 2407;
			text = "Sell"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_virt_sell";
		};
		class shopedit: Life_RscEdit
		{
			idc = 2404;
			text = "0";
			x = 0.355624 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class playeredit: Life_RscEdit
		{
			idc = 2405;
			text = "0";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
	};
};
