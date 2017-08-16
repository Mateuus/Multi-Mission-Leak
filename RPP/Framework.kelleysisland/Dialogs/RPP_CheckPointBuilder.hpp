class RPP_CheckPointBuilder
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
class CP_Store: RPP_RscListbox
{
	idc = 1500;
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.375 * safezoneW;
	h = 0.18 * safezoneH;
};
class CP_Owning: RPP_RscListbox
{
	idc = 1501;
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.54 * safezoneH + safezoneY;
	w = 0.375 * safezoneW;
	h = 0.18 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Buy Object"; //--- ToDo: Localize;
	x = 0.371094 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Pickup Object"; //--- ToDo: Localize;
	x = 0.37625 * safezoneW + safezoneX;
	y = 0.731 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "Cancel"; //--- ToDo: Localize;
	x = 0.520625 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1603: RPP_RscButton
{
	idc = 1603;
	text = "Remove Object"; //--- ToDo: Localize;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.731 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "CheckPoint Objects"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "CheckPoint Owning Objects"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
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
	text = "CheckPoint Builder"; //--- ToDo: Localize;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.18 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
