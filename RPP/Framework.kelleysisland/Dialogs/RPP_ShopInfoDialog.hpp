class RPP_ShopInfoDialog
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_ShopInfoDialog', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1200;
	text = "RPP_Image\Dialogs\RPP_Menu_ShopInfo.paa";
	x = 0.2 * safezoneW + safezoneX;
	y = 0.1 * safezoneH + safezoneY;
	w = 0.6 * safezoneW;
	h = 0.74 * safezoneH;
};
class Usecommand: RPP_RscButton_Hiden
{
	idc = 1600;
	x = 0.5125 * safezoneW + safezoneX;
	y = 0.64 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.04 * safezoneH;
};
class Back: RPP_RscButton_Hiden
{
	idc = 1601;
	x = 0.25 * safezoneW + safezoneX;
	y = 0.64 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.04 * safezoneH;
};
class info: RPP_RscListbox_Hiden
{
	idc = 1500;
	x = 0.25 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.25 * safezoneW;
	h = 0.26 * safezoneH;
};
class Commands: RPP_RscListbox_Hiden
{
	idc = 1501;
	x = 0.5125 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.25 * safezoneW;
	h = 0.26 * safezoneH;
};
};
};
