class RPP_VehicleStorage_Dialog
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_VehicleStorage_Dialog', (_this select 0)]";
	
	class Controls
	{


class background: RPP_RscPicture
{
	idc = 1200;
	text = "RPP_Image\Dialogs\RPP_Menu_Garage.paa";
	x = 0.237031 * safezoneW + safezoneX;
	y = 0.06 * safezoneH + safezoneY;
	w = 0.525 * safezoneW;
	h = 0.740001 * safezoneH;
};
class list: RPP_RscListbox_Hiden
{
	idc = 1501;
	x = 0.278281 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.448594 * safezoneW;
	h = 0.286 * safezoneH;
};
class output: RPP_RscButton_Hiden
{
	idc = 1600;
	x = 0.556719 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.033 * safezoneH;
};
class Store: RPP_RscButton_Hiden
{
	idc = 1601;
	x = 0.649531 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.033 * safezoneH;
};
};
};
