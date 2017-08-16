class radio {

	idd = 8000;
	movingEnable = 0;
	EnableSimulation = 1;
	onLoad = "[0] spawn life_fnc_radiomod;";

	class controlsbackground 
	{
		class background: Life_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class zuhorertitle: Life_RscText
		{
			idc = -1;
			text = "Aktuelle Zuhörer";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,1,1,0.4};
			sizeEx = 1.2 * GUI_GRID_H;
		};

		class title: Life_RscText
		{
			idc = -1;
			text = "Radio Altis 95.8 - Übersicht";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
			sizeEx = 1.5 * GUI_GRID_H;
		};

		class bild: Life_RscPicture
		{
			idc = -1;
			text = "images\werbung.paa";
			x = 0.469063 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.242 * safezoneH;
		};

		class framebackground: Life_RscFrame
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorText[] = {1,1,0,1};
		};
	};

	class controls 
	{
		class onairbutton: Life_RscButtonMenu
		{
			idc = 8001;
			text = "ON AIR";
			OnButtonClick = "[1] call life_fnc_radiomod;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0,1,0,1};
		};

		class zuehorerinfo: Life_RscText
		{
			idc = 8002;
			text = "";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
	};
};