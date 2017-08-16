class life_dynmarket_prices {
	idd = 7100;
	name= "life_dynmarket_prices";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {sleep 1;[] call life_fnc_LoadIntoListbox;};";
	
	class controlsBackground {	
		class fondtablet: Life_RscPicture
		{
			idc = 9090909;
			text = "textures\HUD\menu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};
	};
	
	class controls {
class RscListbox_1500: Life_RscListBox
{
	idc = 7055;
	onLBSelChanged = "[] spawn {[] call life_fnc_DisplayPrices;};";

	x = 0.40 * safezoneW + safezoneX;
	y = 0.33 * safezoneH + safezoneY;
	w = 0.211979 * safezoneW;
	h = 0.202321 * safezoneH;
	sizeEx = 0.03;
};
class RscText_1000: Life_RscText
{
	idc = -1;

	text = "Prix courant"; //--- ToDo: Localize;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.53 * safezoneH + safezoneY;
	w = 0.217708 * safezoneW;
	h = 0.0219914 * safezoneH;
};
class RscText_1001: Life_RscText
{
	idc = 7056;

	text = "Sélectionner un acticle"; //--- ToDo: Localize;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.55 * safezoneH + safezoneY;
	w = 0.20625 * safezoneW;
	h = 0.0549786 * safezoneH;
	sizeEx = 0.060;
};
class RscText_1002: Life_RscText
{
	idc = -1;

	text = "Montant des articles vendus par vous"; //--- ToDo: Localize;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.61 * safezoneH + safezoneY;
	w = 0.217708 * safezoneW;
	h = 0.0219914 * safezoneH;
};
class RscText_1003: Life_RscText
{
	idc = 7057;

	text = "0"; //--- ToDo: Localize;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.63 * safezoneH + safezoneY;
	w = 0.20625 * safezoneW;
	h = 0.0549786 * safezoneH;
	sizeEx = 0.060;
};
class RscButtonMenu_2400: Life_RscButtonMenu
{
	idc = 1006;
	text = "$STR_Global_Close";
	onButtonClick = "closeDialog 0;";
	x = 0.1;
	y = 0.8 - (1 / 25);
	w = (6.25 / 40);
	h = (1 / 25);
};
class RscText_1007: Life_RscStructuredText
{
	idc = 7058;

	text = ""; //--- ToDo: Localize;
	x = 0.4 * safezoneW + safezoneX;
	//y = 0.447221 * safezoneH + safezoneY;
	y = 0.59 * safezoneH + safezoneY;
	w = 0.20625 * safezoneW;
	h = 0.0549786 * safezoneH;
	colorText[] = {0.33,0.33,0.33,1};
};
};
};