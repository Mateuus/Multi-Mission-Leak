class TrunkMenu
{
	idd = 3500;
	name = "TrunkMenu";
	movingEnable = 0;
	enableSimulation = 1;
	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.275 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	class controls {
		class RscText_1001: Life_RscText
		{
			idc = 3501;
			text = "Vehicle Trunk"; //--- ToDo: Localize;
			x = 0.334999 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class vehicletrunk: Life_RscListbox
		{
			idc = 3502;
			text = "";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.165 * safezoneH;
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Take"; //--- ToDo: Localize;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_trakucrumafup;";
			class Attributes
			{
				align = "center";
			};
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Close"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 3507;
			text = "Store"; //--- ToDo: Localize;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_fupewudrewruc;";
			class Attributes
			{
				align = "center";
			};
		};
		class yourinventory: Life_RscListbox
		{
			idc = 3503;
			text = "";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.165 * safezoneH;
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Vehicle Trunk"; //--- ToDo: Localize;
			x = 0.345311 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "Your Inventory"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1004: Life_RscText
		{
			idc = 3504;
			text = "20/20"; //--- ToDo: Localize;
			x = 0.644376 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			class Attributes
			{
				align = "left";
			};
		};
		class vehicletrunkedit: Life_RscEdit
		{
			idc = 3505;
			text = "";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class yourinventoryedit: Life_RscEdit
		{
			idc = 3506;
			text = "";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
	};
};
