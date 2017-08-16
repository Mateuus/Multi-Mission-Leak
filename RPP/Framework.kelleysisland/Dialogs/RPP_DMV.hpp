class RPP_DMV
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_DMV', (_this select 0)]";
	
	class Controls
	{
class RscFrame_1800: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.298 * safezoneH + safezoneY;
	w = 0.4375 * safezoneW;
	h = 0.4 * safezoneH;
};
class Lic_buy: RPP_RscListbox
{
	idc = 1500;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.200521 * safezoneW;
	h = 0.308 * safezoneH;
};
class RscListbox_1501: RPP_RscListbox
{
	idc = 1501;
	x = 0.522917 * safezoneW + safezoneX;
	y = 0.324 * safezoneH + safezoneY;
	w = 0.200521 * safezoneW;
	h = 0.308 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Take License Test"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.64 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Licenses"; //--- ToDo: Localize;
	x = 0.375 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Your Licenses"; //--- ToDo: Localize;
	x = 0.6 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.236 * safezoneH + safezoneY;
	w = 0.4375 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "DMV"; //--- ToDo: Localize;
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.02 * safezoneH;
};
};
};
