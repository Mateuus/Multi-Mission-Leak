class RPP_PlayerMenu
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_PlayerMenu', (_this select 0)]";
	
	class Controls
	{

class Background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.2875 * safezoneW + safezoneX;
	y = 0.22 * safezoneH + safezoneY;
	w = 0.425 * safezoneW;
	h = 0.54 * safezoneH;
};
class RscListbox_1500: RPP_RscListbox
{
	idc = 1500;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.48 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Use"; //--- ToDo: Localize;
	x = 0.525 * safezoneW + safezoneX;
	y = 0.66 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Inventory"; //--- ToDo: Localize;
	x = 0.375 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Drop"; //--- ToDo: Localize;
	x = 0.525 * safezoneW + safezoneX;
	y = 0.6 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.04 * safezoneH;
};
class Amount_edit: RPP_RscEdit
{
	idc = 1400;
	text = "1"; //--- ToDo: Localize;
	x = 0.5875 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Amount:"; //--- ToDo: Localize;
	x = 0.5375 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "Give"; //--- ToDo: Localize;
	x = 0.525 * safezoneW + safezoneX;
	y = 0.54 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1603: RPP_RscButton
{
	idc = 1603;
	text = "Phone"; //--- ToDo: Localize;
	x = 0.525 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1604: RPP_RscButton
{
	idc = 1604;
	text = "Animations"; //--- ToDo: Localize;
	x = 0.525 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1605: RPP_RscButton
{
	idc = 1605;
	text = "Company Manager"; //--- ToDo: Localize;
	x = 0.525 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscCombo_2100: RPP_RscCombo
{
	idc = 2100;
	x = 0.525 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1606: RPP_RscButton
{
	idc = 1606;
	text = "Settings"; //--- ToDo: Localize;
	x = 0.525 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscPicture_1200: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.2875 * safezoneW + safezoneX;
	y = 0.16 * safezoneH + safezoneY;
	w = 0.425 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Player Menu"; //--- ToDo: Localize;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.16 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
