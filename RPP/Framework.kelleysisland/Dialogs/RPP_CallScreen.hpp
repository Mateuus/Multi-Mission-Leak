class RPP_CallScreen
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_CallScreen', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.4 * safezoneW + safezoneX;
	y = 0.42 * safezoneH + safezoneY;
	w = 0.225 * safezoneW;
	h = 0.1 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Call Time: 20 Second(s)"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Call Police"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Call EMS"; //--- ToDo: Localize;
	x = 0.525 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.02 * safezoneH;
};
};
};
