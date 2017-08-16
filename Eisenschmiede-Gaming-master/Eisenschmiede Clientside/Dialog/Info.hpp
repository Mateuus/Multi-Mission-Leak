class ES_infoMenu
{
	idd = 133337;
	movingEnable = true;
	enableSimulation = 1;

	class controlsBackground
	{
		class BG: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\menu_logo2.jpg";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class MainBackground: ES_RscText
		{
			idc = -1;
			x = 0.294271 * safezoneW + safezoneX;
			y = 0.228592 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.539 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class Title: ES_RscTitle
		{
			idc = 1342;
			text = "Eisenschmiede Regeln"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx =  0.05;
		};
	};
    class controls
	{
		class Content: ES_RscStructuredText
		{
			idc = 121212;
			text = "";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.418 * safezoneH;
			sizeEx = 0.04;
			colorBackground[] = {-1,-1,-1,0};

		};

		class SelContant: ES_RscListbox
		{
			idc = 1997;
			onLBSelChanged = "[] call ES_fnc_info;";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.418 * safezoneH;
			sizeEx = 0.03;
			colorBackground[] = {-1,-1,-1,0};
			colorActive[] = {-1,-1,-1,1};
		};

		class CloseButtonKey: ES_RscButtonMenu
		{
		idc = -1;
		text = "$STR_Global_Close";
		onButtonClick = "closeDialog 0;";

		x = 0.293229 * safezoneW + safezoneX;
		y = 0.774944 * safezoneH + safezoneY;
		w = 0.111927 * safezoneW;
		h = 0.032074 * safezoneH;
		tooltip = "Schließen"; //--- ToDo: Localize;
		};
	};
};
