/*################################
#	(c) 2016 gamer-nation.eu #
#			         #
#	Author: PierreAmyf   	 #
################################*/
class playerHUD {
    idd = -1;
    duration = 10e10;
    movingEnable = 0;
    fadein = 0;
    fadeout = 0;
    name = "playerHUD";
    onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
    objects[] = {};
    controls[] = {
		Hintergrund,
        Essen, 
        Trinken,
        Leben,
        Einwohner,
        Polizei,
        Feuerwehr,
		Bank,
		Bargeld
    };
	class Hintergrund: life_RscPicture
	{
		idc = 1200;
		text = "textures\UI\hud.paa";
		x = 0.559572 * safezoneW + safezoneX;
		y = 0.60116 * safezoneH + safezoneY;
		w = 0.441158 * safezoneW;
		h = 0.400244 * safezoneH;
	};
	class Essen: life_RscText
	{
		idc = 2400;
		text = ""; //--- ToDo: Localize;
		x = 0.952604 * safezoneW + safezoneX;
		y = 0.662737 * safezoneH + safezoneY;
		w = 0.0481249 * safezoneW;
		h = 0.0329876 * safezoneH;
	};
	class Trinken: life_RscText
	{
		idc = 2402;
		text = ""; //--- ToDo: Localize;
		x = 0.952604 * safezoneW + safezoneX;
		y = 0.704521 * safezoneH + safezoneY;
		w = 0.0481249 * safezoneW;
		h = 0.0329876 * safezoneH;
	};
	class Leben: life_RscText
	{
		idc = 2403;
		text = ""; //--- ToDo: Localize;
		x = 0.952604 * safezoneW + safezoneX;
		y = 0.744105 * safezoneH + safezoneY;
		w = 0.0481249 * safezoneW;
		h = 0.0329876 * safezoneH;
	};
	class Einwohner: life_RscText
	{
		idc = 2404;
		text = ""; //--- ToDo: Localize;
		x = 0.956042 * safezoneW + safezoneX;
		y = 0.785888 * safezoneH + safezoneY;
		w = 0.0446875 * safezoneW;
		h = 0.0329876 * safezoneH;
	};
	class Polizei: life_RscText
	{
		idc = 2405;
		text = ""; //--- ToDo: Localize;
		x = 0.956041 * safezoneW + safezoneX;
		y = 0.825473 * safezoneH + safezoneY;
		w = 0.0446875 * safezoneW;
		h = 0.0329876 * safezoneH;
	};
	class Feuerwehr: life_RscText
	{
		idc = 2406;
		text = ""; //--- ToDo: Localize;
		x = 0.956041 * safezoneW + safezoneX;
		y = 0.867256 * safezoneH + safezoneY;
		w = 0.0446875 * safezoneW;
		h = 0.0329876 * safezoneH;
	};
	class Bank: life_RscText
	{
		idc = 2407;
		text = ""; //--- ToDo: Localize;
		x = 0.907917 * safezoneW + safezoneX;
		y = 0.906841 * safezoneH + safezoneY;
		w = 0.0939569 * safezoneW;
		h = 0.0351867 * safezoneH;
	};
	class Bargeld: life_RscText
	{
		idc = 2408;
		text = ""; //--- ToDo: Localize;
		x = 0.909063 * safezoneW + safezoneX;
		y = 0.948625 * safezoneH + safezoneY;
		w = 0.0928111 * safezoneW;
		h = 0.0351867 * safezoneH;
	};
};