class RPP_Shop
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_Shop', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.2125 * safezoneW + safezoneX;
	y = 0.22 * safezoneH + safezoneY;
	w = 0.5625 * safezoneW;
	h = 0.5 * safezoneH;
};
class ShopList: RPP_RscListbox
{
	idc = 1500;
	x = 0.2375 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.25 * safezoneW;
	h = 0.32 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Remove from Cart"; //--- ToDo: Localize;
	x = 0.55 * safezoneW + safezoneX;
	y = 0.6 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.04 * safezoneH;
};
class Cart: RPP_RscListbox
{
	idc = 1501;
	x = 0.5125 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.25 * safezoneW;
	h = 0.32 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Add to Cart"; //--- ToDo: Localize;
	x = 0.275 * safezoneW + safezoneX;
	y = 0.6 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Shop List"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Shop Cart"; //--- ToDo: Localize;
	x = 0.6125 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "Process"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.66 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.04 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.2125 * safezoneW + safezoneX;
	y = 0.16 * safezoneH + safezoneY;
	w = 0.5625 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Shopping System"; //--- ToDo: Localize;
	x = 0.225 * safezoneW + safezoneX;
	y = 0.16 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
