class RPP_JobFinder_Menu
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_JobFinder_Menu', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.325 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.35 * safezoneW;
	h = 0.36 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "View Info"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.64 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Take Job"; //--- ToDo: Localize;
	x = 0.55 * safezoneW + safezoneX;
	y = 0.64 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscListbox_1500: RPP_RscListbox
{
	idc = 1500;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.3 * safezoneW;
	h = 0.26 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Job List"; //--- ToDo: Localize;
	x = 0.475 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
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
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Job Finder"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.1 * safezoneH;
};
};
};
