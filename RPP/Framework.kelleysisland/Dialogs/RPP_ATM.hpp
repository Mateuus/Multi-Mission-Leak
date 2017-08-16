class RPP_ATM
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_ATM', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.4 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.32 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Cash $1234567"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.4125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Bank $1234567"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.4125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscCombo_2100: RPP_RscCombo
{
	idc = 2100;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.6 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscEdit_1400: RPP_RscEdit
{
	idc = 1400;
	text = "1"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Amount:"; //--- ToDo: Localize;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.0375 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Withdraw"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Deposit"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.52 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "Transfer"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.4 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1003: RPP_RscText
{
	idc = 1003;
	text = "ATM"; //--- ToDo: Localize;
	x = 0.4125 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
