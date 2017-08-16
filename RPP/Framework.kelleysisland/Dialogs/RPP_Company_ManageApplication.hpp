class RPP_Company_ManageApplication
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_Company_ManageApplication', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.325 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.325 * safezoneW;
	h = 0.42 * safezoneH;
};
class info: RPP_RscListbox
{
	idc = 1500;
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.3 * safezoneW;
	h = 0.22 * safezoneH;
};
class applyers: RPP_RscCombo
{
	idc = 2100;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Get Application Details"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Accept Application"; //--- ToDo: Localize;
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.74 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscPicture_1200: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.325 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.325 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Application Details"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Company System"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "Reject Application"; //--- ToDo: Localize;
	x = 0.5125 * safezoneW + safezoneX;
	y = 0.74 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
};
};
