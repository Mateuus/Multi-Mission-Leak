class RPP_Shop_Manager
{
    idd = 30046;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_Shop_Manager', (_this select 0)]";
	
	class Controls
	{

class Background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.325 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.35 * safezoneW;
	h = 0.32 * safezoneH;
};
class Commands: RPP_RscListbox
{
	idc = 1500;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.3 * safezoneW;
	h = 0.2 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Use command"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.58 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Shop Commands"; //--- ToDo: Localize;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Use Shop"; //--- ToDo: Localize;
	x = 0.5125 * safezoneW + safezoneX;
	y = 0.58 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.04 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.325 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.35 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Shopping System"; //--- ToDo: Localize;
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
