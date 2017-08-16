class RPP_Company_Manager
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_Company_Manager', (_this select 0)]";
	
	class Controls
	{
class Background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.25 * safezoneW + safezoneX;
	y = 0.2 * safezoneH + safezoneY;
	w = 0.5 * safezoneW;
	h = 0.64 * safezoneH;
};
class RscFrame_1801: RPP_RscFrame
{
	idc = 1801;
	text = "PayCheck"; //--- ToDo: Localize;
	x = 0.6 * safezoneW + safezoneX;
	y = 0.22 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.12 * safezoneH;
};
class players_paycheck: RPP_RscCombo
{
	idc = 2100;
	x = 0.6125 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class paycheck_amount: RPP_RscCombo
{
	idc = 2101;
	x = 0.6125 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscFrame_1802: RPP_RscFrame
{
	idc = 1802;
	text = "Posision"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.22 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.12 * safezoneH;
};
class players_posision: RPP_RscCombo
{
	idc = 2102;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class rank_posision: RPP_RscCombo
{
	idc = 2103;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscFrame_1803: RPP_RscFrame
{
	idc = 1803;
	text = "Delivery"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.2875 * safezoneW;
	h = 0.18 * safezoneH;
};
class Delivery_list: RPP_RscCombo
{
	idc = 2104;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class delivery_output: RPP_RscListbox
{
	idc = 1500;
	x = 0.5875 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.1 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Get informasjon"; //--- ToDo: Localize;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Informasjon"; //--- ToDo: Localize;
	x = 0.625 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscFrame_1804: RPP_RscFrame
{
	idc = 1804;
	text = "Workers"; //--- ToDo: Localize;
	x = 0.2625 * safezoneW + safezoneX;
	y = 0.22 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.3 * safezoneH;
};
class workers: RPP_RscListbox
{
	idc = 1501;
	x = 0.275 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.22 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Fire"; //--- ToDo: Localize;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1603: RPP_RscButton
{
	idc = 1603;
	text = "Save"; //--- ToDo: Localize;
	x = 0.625 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1604: RPP_RscButton
{
	idc = 1604;
	text = "Save"; //--- ToDo: Localize;
	x = 0.475 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class Delivery: RPP_RscButton
{
	idc = 1605;
	text = "Store Item"; //--- ToDo: Localize;
	x = 0.6 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscFrame_1806: RPP_RscFrame
{
	idc = 1806;
	text = "Storage"; //--- ToDo: Localize;
	x = 0.2625 * safezoneW + safezoneX;
	y = 0.52 * safezoneH + safezoneY;
	w = 0.475 * safezoneW;
	h = 0.26 * safezoneH;
};
class c_storage: RPP_RscListbox
{
	idc = 1503;
	x = 0.2875 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.16 * safezoneH;
};
class RscButton_1609: RPP_RscButton
{
	idc = 1609;
	text = "Company Applications"; //--- ToDo: Localize;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.8 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1610: RPP_RscButton
{
	idc = 1610;
	text = "Company Reports"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.8 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1611: RPP_RscButton
{
	idc = 1611;
	text = "Crafting"; //--- ToDo: Localize;
	x = 0.575 * safezoneW + safezoneX;
	y = 0.8 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Company Storage"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.54 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.02 * safezoneH;
};
class p_storage: RPP_RscListbox
{
	idc = 1502;
	x = 0.55 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.16 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "<<<<<<"; //--- ToDo: Localize;
	x = 0.475 * safezoneW + safezoneX;
	y = 0.6 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1606: RPP_RscButton
{
	idc = 1606;
	text = ">>>>>>"; //--- ToDo: Localize;
	x = 0.475 * safezoneW + safezoneX;
	y = 0.66 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Player Inventory"; //--- ToDo: Localize;
	x = 0.6 * safezoneW + safezoneX;
	y = 0.54 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.25 * safezoneW + safezoneX;
	y = 0.14 * safezoneH + safezoneY;
	w = 0.5 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1003: RPP_RscText
{
	idc = 1003;
	text = "Company System"; //--- ToDo: Localize;
	x = 0.25 * safezoneW + safezoneX;
	y = 0.14 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
