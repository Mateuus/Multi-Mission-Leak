class Life_Vehicle_Shop_v2
{
	idd = 2300;
	name="life_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;

	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "";
			x = 0.005 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.385 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "";
			x = 0.850625 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.385 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Available Vehicles"; //--- ToDo: Localize;
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "Additional Information"; //--- ToDo: Localize;
			x = 0.850625 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	class controls {
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			text = "";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.341 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			onLBSelChanged  = "_this call life_fnc_doaxiavoazouko";
			sizeEx = 0.03;
		};
		class RscCombo_2100: Life_RscCombo
		{
			idc = 2100;
			text = "";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.03;
			colorBackground[] = {0,0,0,0.6};
			onLBSelChanged = "_this call life_fnc_viufiuwrluswle;";
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "X"; //--- ToDo: Localize;
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_tleproaviuqiup;";
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Rent"; //--- ToDo: Localize;
			x = 0.0307812 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] spawn life_fnc_cieproeroachie;";
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 2402;
			text = "Buy"; //--- ToDo: Localize;
			x = 0.0874999 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] spawn life_fnc_drlustlaslavou;";
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.850625 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
};
