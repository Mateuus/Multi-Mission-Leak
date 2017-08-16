class RPP_Company_Main
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_Company_Main', (_this select 0)]";
	
	class Controls
	{
class RscFrame_1801: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.3 * safezoneW + safezoneX;
	y = 0.22 * safezoneH + safezoneY;
	w = 0.4 * safezoneW;
	h = 0.58 * safezoneH;
};
class RscListbox_1500: RPP_RscListbox
{
	idc = 1500;
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.375 * safezoneW;
	h = 0.44 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Apply for Company"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Create Company"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "Delete Company"; //--- ToDo: Localize;
	x = 0.575 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1603: RPP_RscButton
{
	idc = 1603;
	text = "Sue Company"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.76 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1604: RPP_RscButton
{
	idc = 1604;
	text = "Look for Company"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.76 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1605: RPP_RscButton
{
	idc = 1605;
	text = "Company Dealer"; //--- ToDo: Localize;
	x = 0.575 * safezoneW + safezoneX;
	y = 0.76 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "RP Project Company's"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.3 * safezoneW + safezoneX;
	y = 0.16 * safezoneH + safezoneY;
	w = 0.4 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Company System"; //--- ToDo: Localize;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.16 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
