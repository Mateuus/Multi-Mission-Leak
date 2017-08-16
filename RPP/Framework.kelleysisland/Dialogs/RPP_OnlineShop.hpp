class RPP_OnlineShop
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_OnlineShop', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.2875 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.425 * safezoneW;
	h = 0.48 * safezoneH;
};
class ShopSelect: RPP_RscCombo
{
	idc = 2100;
	text = "N/A"; //--- ToDo: Localize;
	onLBSelChanged = "_this call RPP_OnlineShop_FindeShop";
	x = 0.425 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.02 * safezoneH;
};
class Return: RPP_RscListbox
{
	idc = 1500;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.4 * safezoneW;
	h = 0.3 * safezoneH;
};
class Type: RPP_RscCombo
{
	idc = 2101;
	text = "N/A"; //--- ToDo: Localize;
	onLBSelChanged = "_this call RPP_OnlineShop_FindeType";
	x = 0.425 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Shop List"; //--- ToDo: Localize;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Shop Name:"; //--- ToDo: Localize;
	x = 0.3625 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Shop Type:"; //--- ToDo: Localize;
	x = 0.3625 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "View"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Buy"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "Close"; //--- ToDo: Localize;
	x = 0.575 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.2875 * safezoneW + safezoneX;
	y = 0.22 * safezoneH + safezoneY;
	w = 0.425 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
