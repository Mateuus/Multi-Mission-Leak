class RPP_LoginMenu_Register
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_LoginMenu_Register', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.35 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.3 * safezoneW;
	h = 0.32 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Username:"; //--- ToDo: Localize;
	x = 0.381406 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Password:"; //--- ToDo: Localize;
	x = 0.381406 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Retype Password:"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Register Account"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscText_1003: RPP_RscText
{
	idc = 1003;
	text = "Testuser123"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
	h = 0.02 * safezoneH;
};
class password_1: RPP_RscEdit
{
	idc = 1400;
	x = 0.448438 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.02 * safezoneH;
};
class password_2: RPP_RscEdit
{
	idc = 1401;
	x = 0.448438 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.35 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.3 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1005: RPP_RscText
{
	idc = 1005;
	text = "Login System Registration"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
