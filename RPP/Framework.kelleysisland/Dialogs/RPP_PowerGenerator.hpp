class RPP_PowerGenerator
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_PowerGenerator', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.325 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.325 * safezoneW;
	h = 0.36 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Turn off"; //--- ToDo: Localize;
	x = 0.55 * safezoneW + safezoneX;
	y = 0.62 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Turn on"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.62 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "Repair"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.62 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.04 * safezoneH;
};
class Log: RPP_RscListbox
{
	idc = 1500;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.275 * safezoneW;
	h = 0.2 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Power Generator Log"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.04 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.325 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.325 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Power Generator"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.1 * safezoneH;
};
};
};
