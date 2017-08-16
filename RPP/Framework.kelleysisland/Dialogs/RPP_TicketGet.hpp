class RPP_TicketGet
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_TicketGet', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.375 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.2375 * safezoneW;
	h = 0.12 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Pay Ticket"; //--- ToDo: Localize;
	x = 0.3875 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Don't Pay"; //--- ToDo: Localize;
	x = 0.5125 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.04 * safezoneH;
};
class text: RPP_RscText
{
	idc = 1000;
	text = "TEST USER"; //--- ToDo: Localize;
	x = 0.3875 * safezoneW + safezoneX;
	y = 0.46 * safezoneH + safezoneY;
	w = 0.4625 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.375 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.2375 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
