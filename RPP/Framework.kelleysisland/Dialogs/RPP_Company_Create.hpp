class RPP_Company_Create
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_Company_Create', (_this select 0)]";
	
	class Controls
	{

class RscFrame_1800: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.25 * safezoneW;
	h = 0.2 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Company Name:"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Company Type:"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Company Description:"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.02 * safezoneH;
};
class Price: RPP_RscText
{
	idc = 1003;
	text = "Price: 0$"; //--- ToDo: Localize;
	x = 0.5375 * safezoneW + safezoneX;
	y = 0.52 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1004: RPP_RscText
{
	idc = 1004;
	text = "Company Creating"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class Name: RPP_RscEdit
{
	idc = 1400;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class des: RPP_RscEdit
{
	idc = 1401;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class Type: RPP_RscCombo
{
	idc = 2100;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Create Company"; //--- ToDo: Localize;
	x = 0.4125 * safezoneW + safezoneX;
	y = 0.52 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.25 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1005: RPP_RscText
{
	idc = 1005;
	text = "Company System"; //--- ToDo: Localize;
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
