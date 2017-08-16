class RPP_MethSystem
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_MethSystem', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.15 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.6625 * safezoneW;
	h = 0.36 * safezoneH;
};
class background2: RPP_RscPicture
{
	idc = 1801;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.3625 * safezoneW + safezoneX;
	y = 0.62 * safezoneH + safezoneY;
	w = 0.2375 * safezoneW;
	h = 0.32 * safezoneH;
};
class p_inventory: RPP_RscListbox
{
	idc = 1500;
	x = 0.6375 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.28 * safezoneH;
};
class storage: RPP_RscListbox
{
	idc = 1501;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.28 * safezoneH;
};
class additemStorage: RPP_RscButton
{
	idc = 1600;
	text = "<<<<<<"; //--- ToDo: Localize;
	x = 0.575 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.02 * safezoneH;
};
class RemoveitemStorage: RPP_RscButton
{
	idc = 1601;
	text = ">>>>>>"; //--- ToDo: Localize;
	x = 0.575 * safezoneW + safezoneX;
	y = 0.46 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.02 * safezoneH;
};
class chooking: RPP_RscListbox
{
	idc = 1502;
	x = 0.1625 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.28 * safezoneH;
};
class AdditemChook: RPP_RscButton
{
	idc = 1602;
	text = "<<<<<<"; //--- ToDo: Localize;
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.02 * safezoneH;
};
class Final: RPP_RscListbox
{
	idc = 1503;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.68 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.2 * safezoneH;
};
class RemoveitemChook: RPP_RscButton
{
	idc = 1603;
	text = ">>>>>>"; //--- ToDo: Localize;
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.46 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1604: RPP_RscButton
{
	idc = 1604;
	text = "Take Item/Start Coking"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.9 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Meth Storage"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Meth Choking"; //--- ToDo: Localize;
	x = 0.2125 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Player Inventory"; //--- ToDo: Localize;
	x = 0.6875 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscText_1003: RPP_RscText
{
	idc = 1003;
	text = "Final Product"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.64 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.04 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.15 * safezoneW + safezoneX;
	y = 0.18 * safezoneH + safezoneY;
	w = 0.6625 * safezoneW;
	h = 0.08 * safezoneH;
};
class RscText_1004: RPP_RscText
{
	idc = 1004;
	text = "Meth System"; //--- ToDo: Localize;
	x = 0.15 * safezoneW + safezoneX;
	y = 0.16 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.12 * safezoneH;
};
};
};
