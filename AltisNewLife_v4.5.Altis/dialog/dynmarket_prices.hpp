class life_dynmarket_prices {
	idd = 7100;
	name= "life_dynmarket_prices";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn {uiSleep 1;[] call life_fnc_LoadIntoListbox;};";
	
	class controlsBackground {
		    class fondtablet: Life_RscPicture
		{
			idc = 9090999;
			text = "images\ANL\anl_menu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};		

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {
/*class RscFrame_1800: Life_RscText
{
	idc = -1;

	x = 0.276563 * safezoneW + safezoneX;
	y = 0.390043 * safezoneH + safezoneY;
	w = 0.446875 * safezoneW;
	h = 0.219914 * safezoneH;
	colorBackground[] = {0,0,0,1};
};*/
class RscListbox_1500: Life_RscListBox
{
	idc = 7055;
	onLBSelChanged = "[] spawn {[] call life_fnc_DisplayPrices;};";
	x = 0.1;
	y = 0.21;
	w = 0.35; 
	h = 0.605;
	sizeEx = 0.03;
};
class RscText_1000: Life_RscText
{
	idc = -1;

	text = "Prix actuel du marché :"; //--- ToDo: Localize;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.217708 * safezoneW;
	h = 0.0219914 * safezoneH;
};
class RscText_1001: Life_RscText
{
	idc = 7056;

	text = ""; //--- ToDo: Localize;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.20625 * safezoneW;
	h = 0.0549786 * safezoneH;
	sizeEx = 0.070;
};
class RscText_1002: Life_RscText
{
	idc = -1;
	text = "Vous en avez vendu :"; //--- ToDo: Localize;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.53 * safezoneH + safezoneY;
	w = 0.20625 * safezoneW;
	h = 0.0219914 * safezoneH;
};
class RscText_1003: Life_RscText
{
	idc = 7057;

	text = "0"; //--- ToDo: Localize;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.55 * safezoneH + safezoneY;
	w = 0.20625 * safezoneW;
	h = 0.0549786 * safezoneH;
	sizeEx = 0.060;
};
class RscButtonMenu_2400: Life_RscButtonMenu
{
	onButtonClick = "closeDialog 0;";

	idc = 1006;
	text = "FERMER"; //--- ToDo: Localize;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.65 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.05;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0.52,0.03,1};
};
class RscText_1007: Life_RscStructuredText
{
	idc = 7058;

	text = ""; //--- ToDo: Localize;
	x = 0.5 * safezoneW + safezoneX;
	//y = 0.447221 * safezoneH + safezoneY;
	y = 0.460221 * safezoneH + safezoneY;
	w = 0.20625 * safezoneW;
	h = 0.0549786 * safezoneH;
	colorText[] = {0.33,0.33,0.33,1};
};
};
};