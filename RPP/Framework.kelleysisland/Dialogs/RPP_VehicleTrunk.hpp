class RPP_VehicleTrunk
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_VehicleTrunk', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.2625 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.4875 * safezoneW;
	h = 0.36 * safezoneH;
};
class Trunk_list: RPP_RscListbox
{
	idc = 1500;
	x = 0.275 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.24 * safezoneH;
};
class Inventory_p: RPP_RscListbox
{
	idc = 1501;
	x = 0.525 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.24 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Vehicle Trunk"; //--- ToDo: Localize;
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Player Inventory"; //--- ToDo: Localize;
	x = 0.5875 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Store Item"; //--- ToDo: Localize;
	x = 0.5625 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Take Item"; //--- ToDo: Localize;
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.2625 * safezoneW + safezoneX;
	y = 0.2 * safezoneH + safezoneY;
	w = 0.4875 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Vehicle Trunk Menu"; //--- ToDo: Localize;
	x = 0.275 * safezoneW + safezoneX;
	y = 0.2 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};

