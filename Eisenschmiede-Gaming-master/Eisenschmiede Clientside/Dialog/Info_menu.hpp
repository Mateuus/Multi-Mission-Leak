class Info_menu 
{
	idd = 13337;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[9] spawn ES_fnc_InfoText;";

	class controlsBackground {

		class MainBackground: ES_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.293993 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.412014 * safezoneW;
			h = 0.55 * safezoneH;
		};

	};

	class controls {

		class ClolorNix: ES_RscButtonMenu
		{
			idc = 2409;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};

		class ColorRot: ES_RscButtonMenu
		{
			idc = 2400;
			text = "Rot";
			colorText[] = {0,0,0,1};
			x = 0.335194 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0,0,1};
			tooltip = "Rote Farbe";
			onButtonClick = "[0] spawn ES_fnc_InfoText;";
		};

		class ColorBlau: ES_RscButtonMenu
		{
			idc = 2401;
			text = "Blau";
			colorText[] = {0,0,0,1};
			x = 0.335194 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,1,1};
			tooltip = "Blaue Farbe";
			onButtonClick = "[1] spawn ES_fnc_InfoText;";

		};

		class ColotGreen: ES_RscButtonMenu
		{
			idc = 2402;
			text = "Grün";
			colorText[] = {0,0,0,1};
			x = 0.335194 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,1,0,1};
			tooltip = "Grüne Farbe";
			onButtonClick = "[2] spawn ES_fnc_InfoText;";

		};

		class ColorGelb: ES_RscButtonMenu
		{
			idc = 2403;
			text = "Gelb";
			colorText[] = {0,0,0,1};
			x = 0.335194 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,0,1};
			tooltip = "Gelbe Farbe";
			onButtonClick = "[3] spawn ES_fnc_InfoText;";

		};

		class CloloRosa: ES_RscButtonMenu
		{
			idc = 2404;
			text = "Rosa";
			colorText[] = {0,0,0,1};
			x = 0.335194 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0,1,1};
			tooltip = "Rosa Farbe";
			onButtonClick = "[4] spawn ES_fnc_InfoText;";

		};

		class ClolorWeiss: ES_RscButtonMenu
		{
			idc = 2405;
			text = "Weiss";
			colorText[] = {1,1,1,1};
			x = 0.335194 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
			tooltip = "Weisse Farbe";
			onButtonClick = "[5] spawn ES_fnc_InfoText;";

		};

		class ClolorSchwarz: ES_RscButtonMenu
		{
			idc = 2406;
			text = "Orang";
			colorText[] = {1,1,1,1};
			x = 0.335194 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.502,0,1};
			tooltip = "Orange Farbe";
			onButtonClick = "[6] spawn ES_fnc_InfoText;";

		};

		class InfoText: ES_RscText
		{
			idc = 1000;
			text = "www.Eisenschmiede-Gaming.de";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.28326 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class Standart: ES_RscButtonMenu
		{
			idc = 2408;
			text = "Standart";
			x = 0.582403 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Standart Text";
			onButtonClick = "[7] spawn ES_fnc_InfoText;";
		};

		class Info_Text: ES_RscEdit
		{
			idc = 1400;
			text = "www.Eisenschmiede-Gaming.de";
			x = 0.340345 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.272959 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class InfoSave: ES_RscButtonMenu
		{
			idc = 2409;
			text = "Senden";
			x = 0.49485 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;			
			tooltip = "Senden";
			onButtonClick = "[8] spawn ES_fnc_InfoText;";
		};

		class ClolorClose: ES_RscButtonMenu
		{
			idc = 2407;
			text = "Schliessen";
			x = 0.582403 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Schliessen";
			onButtonClick = "closeDialog 0;";
		};

	};
};

