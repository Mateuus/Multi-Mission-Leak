class RPP_GangMange
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_GangMange', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.3875 * safezoneW;
	h = 0.44 * safezoneH;
};
class RscListbox_1500: RPP_RscListbox
{
	idc = 1500;
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.3375 * safezoneW;
	h = 0.28 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Delete Gang"; //--- ToDo: Localize;
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.68 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Kick User"; //--- ToDo: Localize;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.68 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "Lock/Unlock Gang"; //--- ToDo: Localize;
	x = 0.5875 * safezoneW + safezoneX;
	y = 0.68 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Gang Info"; //--- ToDo: Localize;
	x = 0.475 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.3875 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Gang Manager"; //--- ToDo: Localize;
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscButton_1603: RPP_RscButton
{
	idc = 1603;
	text = "Close"; //--- ToDo: Localize;
	x = 0.5875 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
};
};
