class RPP_VehicleMenu
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_VehicleMenu', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.4 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.3 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Lock\Unlock Vehicle"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Lock\Unlock Trunk"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.04 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "Share Key"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.04 * safezoneH;
};
class Playerlist: RPP_RscCombo
{
	idc = 2100;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.62 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.4 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Vehicle Menu"; //--- ToDo: Localize;
	x = 0.4125 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscButton_1603: RPP_RscButton
{
	idc = 1603;
	text = "Open Trunk"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.04 * safezoneH;
};
};
};
