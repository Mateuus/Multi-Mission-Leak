class RPP_AdminMenu
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_AdminMenu', (_this select 0)]";
	
	class Controls
	{
class Background: RPP_RscPicture
{
	idc = 1800;

	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.275 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.45 * safezoneW;
	h = 0.3 * safezoneH;
};
class Admin_Command_list: RPP_RscListbox
{
	idc = 1500;
	x = 0.2875 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.425 * safezoneW;
	h = 0.16 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Use Selected Command"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Activate Command"; //--- ToDo: Localize;
	x = 0.6 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscEdit_1400: RPP_RscEdit
{
	idc = 1400;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Command:"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.275 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.45 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "RP Project Admin Menu"; //--- ToDo: Localize;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
};
};
