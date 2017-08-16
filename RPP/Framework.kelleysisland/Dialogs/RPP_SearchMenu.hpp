class RPP_SearchMenu
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_SearchMenu', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.375 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.25 * safezoneW;
	h = 0.36 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Close"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.62 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscListbox_1500: RPP_RscListbox
{
	idc = 1500;
	x = 0.3875 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.225 * safezoneW;
	h = 0.24 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Inventory"; //--- ToDo: Localize;
	x = 0.475 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.375 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.25 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Search Menu"; //--- ToDo: Localize;
	x = 0.3875 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.02 * safezoneH;
};
};
};