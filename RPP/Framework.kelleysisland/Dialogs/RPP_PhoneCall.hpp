class RPP_PhoneCall
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_PhoneCall', (_this select 0)]";
	
	class Controls
	{

class RscPicture_1200: RPP_RscPicture
{
	idc = 1200;
	text = "RPP_Config\Dialogs\RPP_PhoneCall.paa";
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.22 * safezoneH + safezoneY;
	w = 0.375 * safezoneW;
	h = 0.56 * safezoneH;
};
class Answear: RPP_RscButton_Hiden
{
	idc = 1600;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
};
class cancel: RPP_RscButton_Hiden
{
	idc = 1601;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
};
class caller: RPP_RscStructuredText
{
	idc = 1100;
	text = ""; //--- ToDo: Localize;
	x = 0.4125 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.08 * safezoneH;
};
};
};
