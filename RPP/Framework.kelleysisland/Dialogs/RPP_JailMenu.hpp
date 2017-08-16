class RPP_JailMenu
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_JailMenu', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.325 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.2875 * safezoneW;
	h = 0.26 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Jail Time Hours:"; //--- ToDo: Localize;
	x = 0.339583 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.0973958 * safezoneW;
	h = 0.022 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Jail Time Minute:"; //--- ToDo: Localize;
	x = 0.333854 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Jail Time Seconds:"; //--- ToDo: Localize;
	x = 0.333854 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0973958 * safezoneW;
	h = 0.022 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Process Jail"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Process Revoke"; //--- ToDo: Localize;
	x = 0.4875 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.04 * safezoneH;
};
class Jail_Houres: RPP_RscEdit
{
	idc = 1400;
	text = "0"; //--- ToDo: Localize;
	x = 0.436979 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.171875 * safezoneW;
	h = 0.033 * safezoneH;
};
class Jail_min: RPP_RscEdit
{
	idc = 1401;
	text = "1"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.171875 * safezoneW;
	h = 0.033 * safezoneH;
};
class Jail_s: RPP_RscEdit
{
	idc = 1402;
	text = "1"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.171875 * safezoneW;
	h = 0.033 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.325 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.2875 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1003: RPP_RscText
{
	idc = 1003;
	text = "Jail Menu"; //--- ToDo: Localize;
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.0973958 * safezoneW;
	h = 0.022 * safezoneH;
};
};
};
