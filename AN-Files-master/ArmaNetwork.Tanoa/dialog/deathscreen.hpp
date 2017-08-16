class DeathScreen {
	idd = 7300;
	name = "Life_Death_Screen";
	movingEnabled = 0;
	enableSimulation = 1;

	class controlsBackground {
		class background: Life_RscText
		{
			idc = 1000;
			text = "";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.154 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1007: Life_RscText
		{
			idc = 1007;
			text = "";
			x = 0.0720312 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.154 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "You're in critical condition..."; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1008: Life_RscText
		{
			idc = 1008;
			text = "Players around You:"; //--- ToDo: Localize;
			x = 0.0720312 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	class controls {
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Request EMS"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "call life_fnc_fujawenanu;";
			class Attributes
			{
				align = "center";
			};
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Killer:"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class RscText_1003: Life_RscText
		{
			idc = 1003;
			text = "Killer UID:"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class RscText_1004: Life_RscText
		{
			idc = 1004;
			text = "Weapon:"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class RscText_1005: Life_RscText
		{
			idc = 1005;
			text = "Distance:"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			text = "";
			x = 0.0720312 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.132 * safezoneH;
			sizeEx = 0.035;
		};
		class RscText_1009: Life_RscText
		{
			idc = 1009;
			text = "Timer"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			class Attributes
			{
				align = "center";
			};
		};
	};
};
