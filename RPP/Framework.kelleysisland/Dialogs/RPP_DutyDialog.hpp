class RPP_DutyDialog
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_DutyDialog', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.35 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.3 * safezoneW;
	h = 0.34 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Go on Duty"; //--- ToDo: Localize;
	x = 0.375 * safezoneW + safezoneX;
	y = 0.62 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Go off Duty"; //--- ToDo: Localize;
	x = 0.5375 * safezoneW + safezoneX;
	y = 0.62 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscListbox_1500: RPP_RscListbox
{
	idc = 1500;
	x = 0.375 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.25 * safezoneW;
	h = 0.24 * safezoneH;
};
class RscPicture_1200: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.35 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.3 * safezoneW;
	h = 0.08 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "RP Project Police Department"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.22 * safezoneH + safezoneY;
	w = 0.3125 * safezoneW;
	h = 0.12 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Online list"; //--- ToDo: Localize;
	x = 0.475 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.02 * safezoneH;
};
};
};