class ES_lvl_menu
{
	idd = 1250;
	movingEnable = true;
	enableSimulation = 1;
    class controlsBackground {
		class RscTitleBackground: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\menu_xp.jpg";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class MainBackground: ES_RscText
		{
			idc = -1;
			x = 0.294271 * safezoneW + safezoneX;
			y = 0.230556 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.539 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class Autor: ES_RscTitle
		{
			idc = -1;
			text = "www.Eisenschmiede-Gaming.de"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
	class controls
	{
		class infoLvltxt: ES_RscStructuredText
		{
			idc = 1750;
			text = "";

			x = 0.434531 * safezoneW + safezoneX;
			y = 0.278148 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.187 * safezoneH;
		};

		class InfoLvl: ES_RscListbox
		{
			idc = 2000;
			onLBSelChanged = "[] call ES_fnc_lvl_info;";
			sizeEx = 0.03;

			x = 0.299427 * safezoneW + safezoneX;
			y = 0.274444 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.44 * safezoneH;
		};

		class Freischaltungen: ES_RscText
		{
			idc = 1004;
			text = "Freischaltungen:"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class deinxp: ES_RscText
		{
			idc = 1001;
			text = "Xp:"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class deinlvl: ES_RscText
		{
			idc = 1002;
			text = "Level:"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class lvlbild: ES_RscPicture
		{
			idc = 1200;
			text = "";			
			x = 0.433048 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.149355 * safezoneW;
			h = 0.209 * safezoneH;
		};

		class nowlvl: ES_RscText
		{
			idc = 1007;
			text = "0"; //--- ToDo: Localize;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class nextlvl: ES_RscText
		{
			idc = 1009;
			text = "0"; //--- ToDo: Localize;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class ProgresBarXP: ES_RscProgress
		{
			idc = 1850;
			colorBar[] = {1,0.6,0,1};
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class xppro: ES_RscText
		{
			idc = 1111;
			text = "0";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Side: ES_RscText
		{
			idc = 1235;
			text = "";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
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