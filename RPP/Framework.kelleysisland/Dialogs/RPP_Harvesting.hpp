class RPP_Harvest
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_CheckPointBuilder', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.3 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.4 * safezoneW;
	h = 0.52 * safezoneH;
};
class Obj_Owning: RPP_RscListbox
{
	idc = 1500;
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.375 * safezoneW;
	h = 0.18 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Harvest Object"; //--- ToDo: Localize;
	x = 0.371094 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Farming"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscPicture_1200: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.3 * safezoneW + safezoneX;
	y = 0.18 * safezoneH + safezoneY;
	w = 0.4 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Harvester"; //--- ToDo: Localize;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.18 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
