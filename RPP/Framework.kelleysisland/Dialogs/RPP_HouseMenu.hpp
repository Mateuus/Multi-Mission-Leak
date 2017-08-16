class RPP_HouseMenu
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_HouseMenu', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.2625 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.5 * safezoneW;
	h = 0.54 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "House Owner: Loading..."; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.3125 * safezoneW;
	h = 0.06 * safezoneH;
};

class trunk: RPP_RscListbox
{
	idc = 1500;
	x = 0.2875 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.1875 * safezoneW;
	h = 0.24 * safezoneH;
};
class RscListbox_1501: RPP_RscListbox
{
	idc = 1501;
	text = "p_inventory"; //--- ToDo: Localize;
	x = 0.5375 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.24 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "House Storage"; //--- ToDo: Localize;
	x = 0.3375 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Player Inventory"; //--- ToDo: Localize;
	x = 0.5875 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "View Trunk"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.58 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1604: RPP_RscButton
{
	idc = 1604;
	text = "<<<<<<"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.022 * safezoneH;
};
class RscButton_1605: RPP_RscButton
{
	idc = 1605;
	text = ">>>>>>"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.022 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Share Key"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.62 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "Unlock/Lock House"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.68 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1603: RPP_RscButton
{
	idc = 1603;
	text = "Close Menu"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.74 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class player_list: RPP_RscCombo
{
	idc = 2100;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.62 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
};
};
