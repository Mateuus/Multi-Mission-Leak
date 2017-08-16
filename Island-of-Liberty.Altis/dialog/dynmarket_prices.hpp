class life_dynmarket_prices {
	idd = 7100;
	name= "life_dynmarket_prices";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {sleep 1;[] call life_fnc_LoadIntoListbox;};";
	
	class controlsBackground {
	};
	
	class controls {
	
	class fondtablet: Life_RscPicture
	{
		idc = 90909095;
		text = "icons\phone\blacktablet.paa";
		x = 0.185469 * safezoneW + safezoneX;
		y = 0.165 * safezoneH + safezoneY;
		w = 0.629062 * safezoneW;
		h = 0.659 * safezoneH;
	};
class RscListbox_1500: Life_RscListBox
{
	idc = 7055;
	onLBSelChanged = "[] spawn {[] call life_fnc_DisplayPrices;};";

	x = 0.27 * safezoneW + safezoneX;
	y = 0.30 * safezoneH + safezoneY;
	w = 0.220 * safezoneW;
	h = 0.450 * safezoneH;
	sizeEx = 0.0460;
	//0.0260
};
class RscText_1000: Life_RscText
{
	idc = -1;

	text = "Aktueller Verkaufspreis"; //--- ToDo: Localize;
	x = 0.51* safezoneW + safezoneX;
	y = 0.30 * safezoneH + safezoneY;
	w = 0.217708 * safezoneW;
	h = 0.0219914 * safezoneH;
};
class RscText_1001: Life_RscText
{
	idc = 7056;

	text = "Bitte wähle ein Item aus"; //--- ToDo: Localize;
	x = 0.51 * safezoneW + safezoneX;
	y = 0.35 * safezoneH + safezoneY;
	w = 0.20625 * safezoneW;
	h = 0.0549786 * safezoneH;
	sizeEx = 0.060;
};
class RscText_1002: Life_RscText
{
	idc = -1;

	text = "Verkaufte Anzahl an Items"; //--- ToDo: Localize;
	x = 0.51 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.21 * safezoneW;
	h = 0.0219914 * safezoneH;
};
class RscText_1003: Life_RscText
{
	idc = 7057;

	text = "......."; //--- ToDo: Localize;
	x = 0.51 * safezoneW + safezoneX;
	y = 0.513195 * safezoneH + safezoneY;
	w = 0.20625 * safezoneW;
	h = 0.0549786 * safezoneH;
	sizeEx = 0.060;
};
class RscButtonMenu_2400: Life_RscButtonMenu
{
	onButtonClick = "closeDialog 0;";
	idc = 1006;
	text = "      Wirtschafts Preislisten Menü schliessen "; //--- ToDo: Localize;
	x = 0.51 * safezoneW + safezoneX;
	y = 0.75 * safezoneH + safezoneY;
	w = 0.18 * safezoneW;
	h = 0.0219914 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0.52,0.03,1};
};
		class RscText_1007: Life_RscStructuredText
		{
			idc = 7058;
			text = ""; //--- ToDo: Localize;
			x = 0.51 * safezoneW + safezoneX;
			//y = 0.447221 * safezoneH + safezoneY;
			y = 0.460221 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.0549786 * safezoneH;
			colorText[] = {0.33,0.33,0.33,1};
		};
	};
};