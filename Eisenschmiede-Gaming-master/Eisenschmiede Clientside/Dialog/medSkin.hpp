class ES_medSkin
{
	idd = 1234564;
	movingEnable = true;
	enableSimulation = 1;
	onLoad = "[0] spawn ES_fnc_medSkin;";


	class controlsBackground
	{
		class BG: ES_RscText
		{
			idc = -1;
			x = 0.293993 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.412014 * safezoneW;
			h = 0.561 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};

		class Text: ES_RscTitle
		{
			idc = 1015;
			text = "Feuerwer Skins";
			x = 0.293993 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.412014 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls
	{
		class medLvlBtn1: ES_RscButtonMenu
		{
			idc = 1600;
			text = "ADAC";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[1] spawn ES_fnc_medSkin;";
		};

		class medLvlBtn2: ES_RscButtonMenu
		{
			idc = 1601;
			text = "Rettungsdienst";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[2] spawn ES_fnc_medSkin;";
		};

		class medLvlBtn3: ES_RscButtonMenu
		{
			idc = 1602;
			text = "Feuerwehr";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[3] spawn ES_fnc_medSkin;";
		};

		class medLvlBtn4: ES_RscButtonMenu
		{
			idc = 1603;
			text = "Küstenrettung";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[4] spawn ES_fnc_medSkin;";
		};

		class medLvlBtn5: ES_RscButtonMenu
		{
			idc = 1604;
			text = "Ausbilder";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[5] spawn ES_fnc_medSkin;";
		};

		class medLvlBtn6: ES_RscButtonMenu
		{
			idc = 1605;
			text = "CO-Leitung";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[6] spawn ES_fnc_medSkin;";
		};

		class medLvlBtn7: ES_RscButtonMenu
		{
			idc = 1606;
			text = "Leitung";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[7] spawn ES_fnc_medSkin;";
		};

		class lvl1: ES_RscText
		{
			idc = 1000;
			text = "ADAC Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl2: ES_RscText
		{
			idc = 1001;
			text = "Rettungsdienst Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl3: ES_RscText
		{
			idc = 1002;
			text = "Feuerwehr Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl4: ES_RscText
		{
			idc = 1003;
			text = "Küstenrettung Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl5: ES_RscText
		{
			idc = 1004;
			text = "Ausbilder Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl6: ES_RscText
		{
			idc = 1005;
			text = "CO-Leitung Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl7: ES_RscText
		{
			idc = 1006;
			text = "Leitung Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class NAME: ES_RscText
		{
			idc = 1013;
			text = "";
			x = 0.520601 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class GUID: ES_RscText
		{
			idc = 1014;
			text = "";
			x = 0.520601 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class LvL: ES_RscText
		{
			idc = 1016;
			text = "";
			x = 0.520601 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Server: ES_RscText
		{
			idc = 1017;
			text = "";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.401714 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ButtonClose: ES_RscButtonMenu
		{
			idc = 1212;
			text = "Schliessen";
			onButtonClick = "closeDialog 0;";
			x = 0.628754 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Schliessen";
		};
	};
};
