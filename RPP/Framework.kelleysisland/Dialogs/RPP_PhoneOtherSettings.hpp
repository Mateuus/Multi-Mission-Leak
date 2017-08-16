class RPP_PhoneOtherSettings
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_PhoneOtherSettings', (_this select 0)]";
	
	class Controls
	{


class background: RPP_RscPicture
{
	idc = 1200;
	text = "RPP_Config\Dialogs\RPP_PhoneSettings.paa";
	x = 0.30525 * safezoneW + safezoneX;
	y = 0.2324 * safezoneH + safezoneY;
	w = 0.3875 * safezoneW;
	h = 0.54 * safezoneH;
};
class settings: RPP_RscListbox
{
	idc = 1500;
	x = 0.430625 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.139219 * safezoneW;
	h = 0.165 * safezoneH;
};
class apply: RPP_RscButton_Hiden
{
	idc = 1600;
	x = 0.505781 * safezoneW + safezoneX;
	y = 0.643 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.022 * safezoneH;
};
class back: RPP_RscButton_Hiden
{
	idc = 1601;
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.033 * safezoneH;
};
};
};
