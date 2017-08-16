class ES_bugreport
{
	idd = 232323;
	movingEnabled = false;
	enableSimulation = 1;

	class controlsBackground
	{
		class RscTitleBackground: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\menu_bug.jpg";
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

		class Eisenschmiede: ES_RscTitle
		{
			idc = -1;
			text = "www.Eisenschmiede-Gaming.de"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};

	class controls
	{
		class BugreportText: ES_RscEdit
		{
			idc = 252525;
			text = "Nutze dieses Feld, um uns Bugs mitzuteilen.";
            type = 2;
            style = 16;

			x = 0.298906 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.121 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class Senden: ES_RscButtonMenu
		{
			idc = 2401;
			text = "Senden"; //--- ToDo: Localize;
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Senden"; //--- ToDo: Localize;
			onButtonClick = "[] spawn ES_fnc_bugreport;";
		};

		class Warnung_1: ES_RscTitle
		{
			idc = -1;
			text = "Bedenke, missbrauch von dem Bug Report kann geahndet werden !"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.376406 * safezoneW;
			h = 0.2 * safezoneH;
		};

		class Warnung_2: ES_RscTitle
		{
			idc = -1;
			text = "Also benutze ihn nur für richtige Bugs !"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.376406 * safezoneW;
			h = 0.2 * safezoneH;
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