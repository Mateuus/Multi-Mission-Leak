class RPP_Company_App
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_Company_App', (_this select 0)]";
	
	class Controls
	{
class Background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.35 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.3 * safezoneW;
	h = 0.3 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Send Application"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.58 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Name:"; //--- ToDo: Localize;
	x = 0.375 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Age:"; //--- ToDo: Localize;
	x = 0.375 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Info about your self:"; //--- ToDo: Localize;
	x = 0.375 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1003: RPP_RscText
{
	idc = 1003;
	text = "Where are you from:"; //--- ToDo: Localize;
	x = 0.375 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1004: RPP_RscText
{
	idc = 1004;
	text = "Why do you wanna join:"; //--- ToDo: Localize;
	x = 0.375 * safezoneW + safezoneX;
	y = 0.52 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.02 * safezoneH;
};
class name: RPP_RscEdit
{
	idc = 1400;
	x = 0.4875 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.02 * safezoneH;
};
class age: RPP_RscEdit
{
	idc = 1401;
	x = 0.4875 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.02 * safezoneH;
};
class info: RPP_RscEdit
{
	idc = 1402;
	x = 0.4875 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.02 * safezoneH;
};
class whereyoufrom: RPP_RscEdit
{
	idc = 1403;
	x = 0.4875 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.02 * safezoneH;
};
class why: RPP_RscEdit
{
	idc = 1404;
	x = 0.4875 * safezoneW + safezoneX;
	y = 0.52 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
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
class RscText_1005: RPP_RscText
{
	idc = 1005;
	text = "Company System"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
