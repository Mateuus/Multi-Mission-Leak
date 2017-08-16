class RPP_SearchDialog
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_SearchDialog', (_this select 0)]";
	
	class Controls
	{

class Background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.3 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.4 * safezoneW;
	h = 0.48 * safezoneH;
};
class search: RPP_RscListbox
{
	idc = 1500;
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.34 * safezoneH;
};
class inv: RPP_RscListbox
{
	idc = 1501;
	x = 0.5125 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.34 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Take"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.7 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Destroy"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.74 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Searching"; //--- ToDo: Localize;
	x = 0.375 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Your Inventory"; //--- ToDo: Localize;
	x = 0.5625 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.3 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.4 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Search Menu"; //--- ToDo: Localize;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
