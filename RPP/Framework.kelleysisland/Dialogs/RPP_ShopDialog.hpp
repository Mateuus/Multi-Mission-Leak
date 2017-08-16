class RPP_ShopDialog
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_ShopDialog', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1200;
	text = "RPP_Image\Dialogs\RPP_Menu_Shop.paa";
	x = 0.2125 * safezoneW + safezoneX;
	y = 0.04 * safezoneH + safezoneY;
	w = 0.5625 * safezoneW;
	h = 0.84 * safezoneH;
};
class Buy: RPP_RscButton_Hiden
{
	idc = 1602;
	x = 0.257656 * safezoneW + safezoneX;
	y = 0.654 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.044 * safezoneH;
};
class ShopInfo: RPP_RscButton_Hiden
{
	idc = 1603;
	x = 0.355625 * safezoneW + safezoneX;
	y = 0.654 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.044 * safezoneH;
};
class Add: RPP_RscButton_Hiden
{
	idc = 1601;
	x = 0.654688 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.033 * safezoneH;
};
class Remove: RPP_RscButton_Hiden
{
	idc = 1600;
	x = 0.654688 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.044 * safezoneH;
};
class Price: RPP_RscText
{
	idc = 1000;
	x = 0.654688 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.044 * safezoneH;
};
class ShopList: RPP_RscListbox_Hiden
{
	idc = 1500;
	x = 0.2625 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.381563 * safezoneW;
	h = 0.154 * safezoneH;
};
class Card: RPP_RscListbox_Hiden
{
	idc = 1501;
	x = 0.2625 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.381563 * safezoneW;
	h = 0.165 * safezoneH;
};
};
};
