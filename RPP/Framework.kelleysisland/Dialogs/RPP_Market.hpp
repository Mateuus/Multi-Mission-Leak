class RPP_MarketMenu
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_MarketMenu', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.35 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.3 * safezoneW;
	h = 0.38 * safezoneH;
};
class RscListbox_1500: RPP_RscListbox
{
	idc = 1500;
	x = 0.375 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.25 * safezoneW;
	h = 0.24 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Sell Item"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.66 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscEdit_1400: RPP_RscEdit
{
	idc = 1400;
	text = "1";
	x = 0.425 * safezoneW + safezoneX;
	y = 0.62 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Amount:"; //--- ToDo: Localize;
	x = 0.375 * safezoneW + safezoneX;
	y = 0.62 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Dealer Items"; //--- ToDo: Localize;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscPicture_1200: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.35 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.3 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Market System"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
