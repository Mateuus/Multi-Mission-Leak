class RPP_PostOffice_Menu
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_PostOffice_Menu', (_this select 0)]";
	
	class Controls
	{
class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.35 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.3 * safezoneW;
	h = 0.24 * safezoneH;
};
class deliverys_box: RPP_RscListbox
{
	idc = 1500;
	x = 0.3625 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.14 * safezoneH;
};
class distance: RPP_RscCombo
{
	idc = 2100;
	x = 0.5375 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class vehicle: RPP_RscCombo
{
	idc = 2101;
	x = 0.5375 * safezoneW + safezoneX;
	y = 0.42 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class type: RPP_RscCombo
{
	idc = 2102;
	x = 0.5375 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Deliverys"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.35 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.3 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Post Office"; //--- ToDo: Localize;
	x = 0.35 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Take Delivery"; //--- ToDo: Localize;
	x = 0.3875 * safezoneW + safezoneX;
	y = 0.52 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
};
};

