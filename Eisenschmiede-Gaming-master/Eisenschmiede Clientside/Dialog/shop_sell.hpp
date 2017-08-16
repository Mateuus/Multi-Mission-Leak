class ES_shop_sell {
	idd = 2900;
	name= "ES_shop_sell";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "if(isNil ""ES_shop_sell_menu"") then { [] call ES_shop_sell; }else{ [] spawn ES_shop_sell_menu; };";

	class controlsBackground {

		class MainBackground: ES_RscText
		{
			idc = 1200;
			x = 0.147728 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.715874 * safezoneW;
			h = 0.759 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class i_0: ES_RscText
		{
			idc = 1201;
			x = 0.313564 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.381113 * safezoneW;
			h = 0.704 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class i_1: ES_RscText
		{
			idc = -1;
			x = 0.319742 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.00412014 * safezoneW;
			h = 0.616 * safezoneH;
			colorBackground[] = {1,0.6,0.2,1};
		};

		class i_2: ES_RscText
		{
			idc = -1;
			x = 0.687467 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.00412014 * safezoneW;
			h = 0.616 * safezoneH;
			colorBackground[] = {1,0.6,0.2,1};
		};

		class i_3: ES_RscText
		{
			idc = -1;
			x = 0.319744 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.370813 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {1,0.6,0.2,1};
		};

		class i_4: ES_RscText
		{
			idc = -1;
			x = 0.320774 * safezoneW + safezoneX;
			y = 0.7816 * safezoneH + safezoneY;
			w = 0.370813 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {1,0.6,0.2,1};
		};

		class i_t_1: ES_RscText
		{
			idc = 1003;
			x = 0.320774 * safezoneW + safezoneX;
			y = 0.1414 * safezoneH + safezoneY;
			w = 0.175106 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class i_t_2: ES_RscText
		{
			idc = 1004;
			x = 0.527811 * safezoneW + safezoneX;
			y = 0.1414 * safezoneH + safezoneY;
			w = 0.159655 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class i_t_3: ES_RscText
		{
			idc = 1005;
			x = 0.510302 * safezoneW + safezoneX;
			y = 0.1898 * safezoneH + safezoneY;
			w = 0.154505 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class i_t_4: ES_RscText
		{
			idc = 1006;
			x = 0.159057 * safezoneW + safezoneX;
			y = 0.1106 * safezoneH + safezoneY;
			w = 0.149355 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class i_t_5: ES_RscText
		{
			idc = 1007;
			x = 0.692618 * safezoneW + safezoneX;
			y = 0.1106 * safezoneH + safezoneY;
			w = 0.149355 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

	class controls {

		class item: ES_RscListbox
		{
			idc = 2902;
			type=5;
			style=0;
			font="PuristaLight";
			sizeEx=0.03;
			shadow=0;
			x = 0.326954 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.169956 * safezoneW;
			h = 0.55 * safezoneH;
			colorText[] = {0.8,0,0.8,1};
			colorBackground[] = {0,0,0,0.4};
		};

		class info_item: ES_RscListbox
		{
			idc = 2903;
			type=5;
			style=0;
			font="PuristaLight";
			sizeEx=0.03;
			shadow=0;
			x = 0.51236 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.169956 * safezoneW;
			h = 0.55 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.4};
		};

		class item_sell: ES_RscListbox
		{
			idc = 1100;
			type=5;
			style=0;
			font="PuristaLight";
			sizeEx=0.03;
			shadow=0;
			x = 0.161117 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.154505 * safezoneW;
			h = 0.715 * safezoneH;
			colorText[] = {1,0.502,0,1};
			colorBackground[] = {0,0,0,0.4};
		};

		class item_buy: ES_RscListbox
		{
			idc = 2901;
			type=5;
			style=0;
			font="PuristaLight";
			sizeEx=0.03;
			shadow=0;
			x = 0.694678 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.154505 * safezoneW;
			h = 0.715 * safezoneH;
			colorText[] = {1,0.502,0,1};
			colorBackground[] = {0,0,0,0.4};
		};

		class item_search: ES_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.327984 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.159655 * safezoneW;
			h = 0.022 * safezoneH;
			autocomplete="";
			onKeyUp = "if(ctrlText 1400 != """") then {[] call ES_shop_sell_menu_search;} else { [] call ES_shop_sell_menu_loadscreen;}";
			colorBackground[] = {0,0,0,0.2};
		};

		class item_edit: ES_RscEdit
		{
			idc = 1401;
			text = "";
			x = 0.320774 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.370813 * safezoneW;
			h = 0.033 * safezoneH;
			autoComplete = "scripting";
			colorBackground[] = {0,0,0,0.4};
			onKeyUp = "if(ctrlText 1401 != """") then {[] call ES_shop_sell_menu_savesearch;}";
		};
	};
};
