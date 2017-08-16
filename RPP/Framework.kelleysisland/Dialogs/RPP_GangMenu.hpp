class RPP_GangMenu
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_GangMenu', (_this select 0)]";
	
	class Controls
	{

class Background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.3375 * safezoneW;
	h = 0.3 * safezoneH;
};
class ganglist: RPP_RscListbox
{
	idc = 1500;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.3125 * safezoneW;
	h = 0.16 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Create Gang"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.58 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Manage Gang"; //--- ToDo: Localize;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.58 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "Join Gang"; //--- ToDo: Localize;
	x = 0.575 * safezoneW + safezoneX;
	y = 0.58 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class Gangname: RPP_RscEdit
{
	idc = 1400;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.54 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Gang Name:"; //--- ToDo: Localize;
	x = 0.3625 * safezoneW + safezoneX;
	y = 0.54 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "RP Project Gangs"; //--- ToDo: Localize;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.3375 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Gang System"; //--- ToDo: Localize;
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.1 * safezoneH;
};
};
};