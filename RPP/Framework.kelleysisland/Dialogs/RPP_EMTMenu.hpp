class RPP_EMTMenuMain
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_EMTMenuMain', (_this select 0)]";
	
	class Controls
	{

class background1: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.375 * safezoneW;
	h = 0.4 * safezoneH;
};
class Injurd_list: RPP_RscListbox
{
	idc = 1500;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.28 * safezoneH;
};
class Treatment: RPP_RscListbox
{
	idc = 1501;
	x = 0.5125 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.28 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Treatments"; //--- ToDo: Localize;
	x = 0.575 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Injuries"; //--- ToDo: Localize;
	x = 0.375 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Apply Treatment"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.62 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.04 * safezoneH;
};
class Background2: RPP_RscPicture
{
	idc = 1801;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.4 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.225 * safezoneW;
	h = 0.18 * safezoneH;
};
class RscListbox_1502: RPP_RscListbox
{
	idc = 1502;
	text = "Command_list"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.76 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Process"; //--- ToDo: Localize;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.84 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Commands"; //--- ToDo: Localize;
	x = 0.4875 * safezoneW + safezoneX;
	y = 0.74 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.22 * safezoneH + safezoneY;
	w = 0.375 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1003: RPP_RscText
{
	idc = 1003;
	text = "EMT System"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
};
};
