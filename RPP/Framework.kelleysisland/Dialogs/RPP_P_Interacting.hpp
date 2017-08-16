class RPP_PlayerInteractingMenu
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_PlayerInteractingMenu', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.4 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.34 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Use Command"; //--- ToDo: Localize;
	x = 0.4125 * safezoneW + safezoneX;
	y = 0.58 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscListbox_1500: RPP_RscListbox
{
	idc = 1500;
	x = 0.4125 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.22 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Player Commands"; //--- ToDo: Localize;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscPicture_1200: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.4 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Player Interacting"; //--- ToDo: Localize;
	x = 0.4125 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
