class ES_pager
{
	idd = 5689;
	name= "ES_pager";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground
	{

		class bg: ES_RscText
		{
			idc = -1;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.422812 * safezoneW;
			h = 0.396 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class title: ES_RscText
		{
			idc = -1;
			text = "Eisenschmiede Pager"; //--- ToDo: Localize;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
			sizeEx = 2 * GUI_GRID_H;
		};
		class infotext: ES_RscText
		{
			idc = -1;
			text = "Einheiten in Streife:"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};

	class Controls
	{
		class login: ES_RscButtonMenu
		{
			idc = 8254;
			text = "Einloggen"; //--- ToDo: Localize;
			onButtonClick = "[] spawn ES_fnc_setpager;";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class combo: ES_RscCombo
		{
			idc = 8256;
			sizeEx=0.045;
			onLBSelChanged = "[_this] spawn ES_fnc_pagerliste";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class listbox: ES_RscListbox
		{
			idc = 8255;
			sizeEx=0.04;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.340312 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class close: ES_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			text = "Schließen";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
	};
};