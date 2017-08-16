class RPP_TicketDialog
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_TicketDialog', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.3875 * safezoneW + safezoneX;
	y = 0.42 * safezoneH + safezoneY;
	w = 0.225 * safezoneW;
	h = 0.24 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Ticket:"; //--- ToDo: Localize;
	x = 0.3875 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscEdit_1400: RPP_RscEdit
{
	idc = 1400;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Give Ticket"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.6 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Reason:"; //--- ToDo: Localize;
	x = 0.3875 * safezoneW + safezoneX;
	y = 0.54 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscEdit_1401: RPP_RscEdit
{
	idc = 1401;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.54 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.3875 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.225 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Ticket System"; //--- ToDo: Localize;
	x = 0.3875 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
