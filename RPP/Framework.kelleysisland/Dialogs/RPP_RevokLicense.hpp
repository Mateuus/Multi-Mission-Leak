class RPP_RevokeLicense_Dialog
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_RevokeLicense_Dialog', (_this select 0)]";
	
	class Controls
	{
class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.375 * safezoneW + safezoneX;
	y = 0.276 * safezoneH + safezoneY;
	w = 0.25 * safezoneW;
	h = 0.42 * safezoneH;
};
class lic: RPP_RscListbox
{
	idc = 1500;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.3 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Revoke"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.64 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.04 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.375 * safezoneW + safezoneX;
	y = 0.22 * safezoneH + safezoneY;
	w = 0.25 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "License Revoke System"; //--- ToDo: Localize;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.1875 * safezoneW;
	h = 0.02 * safezoneH;
};
};
};
