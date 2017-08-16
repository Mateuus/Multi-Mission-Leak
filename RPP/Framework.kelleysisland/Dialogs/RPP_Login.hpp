class RPP_LoginMenu
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_LoginMenu', (_this select 0)]";
	
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
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Login"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Register"; //--- ToDo: Localize;
	x = 0.5375 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Username:"; //--- ToDo: Localize;
	x = 0.365937 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Password:"; //--- ToDo: Localize;
	x = 0.365937 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
	h = 0.02 * safezoneH;
};
class Username_txt: RPP_RscText
{
	idc = 1002;
	text = "TestUser123"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.42 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.02 * safezoneH;
};
class password: RPP_RscEdit
{
	idc = 1400;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.02 * safezoneH;
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
class RscText_1004: RPP_RscText
{
	idc = 1004;
	text = "Login System"; //--- ToDo: Localize;
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};