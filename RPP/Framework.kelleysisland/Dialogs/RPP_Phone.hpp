class RPP_Phone
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_Phone', (_this select 0)]";
	
	class Controls
	{
class Background: RPP_RscPicture
{
	idc = 1800;

	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.4 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.24 * safezoneH;
};
class RscCombo_2100: RPP_RscCombo
{
	idc = 2100;

	x = 0.425 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;

	text = "Message List"; //--- ToDo: Localize;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscEdit_1400: RPP_RscEdit
{
	idc = 1400;

	text = "Your Message..."; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;

	text = "Message"; //--- ToDo: Localize;
	x = 0.475 * safezoneW + safezoneX;
	y = 0.46 * safezoneH + safezoneY;
	w = 0.0625 * safezoneW;
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
class RscText_1002: RPP_RscText
{
	idc = 1002;

	text = "Phone Menu"; //--- ToDo: Localize;
	x = 16.5 * GUI_GRID_W + GUI_GRID_X;
	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 2.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Send Message"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.54 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.04 * safezoneH;
};
};
};
