class RPP_PhoneCallScreen
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_PhoneCallScreen', (_this select 0)]";
	
	class Controls
	{

class RscPicture_1200: RPP_RscPicture
{
	idc = 1200;
	text = "RPP_Config\Dialogs\RPP_PhoneCallScreen.paa";
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.22 * safezoneH + safezoneY;
	w = 0.375 * safezoneW;
	h = 0.56 * safezoneH;
};
class speaker: RPP_RscButton_Hiden
{
	idc = 1600;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
};
class facetime: RPP_RscButton_Hiden
{
	idc = 1601;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
};
class endcall: RPP_RscButton_Hiden
{
	idc = 1602;
	x = 0.484531 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
};
class calling: RPP_RscStructuredText
{
	idc = 1101;
	text = ""; //--- ToDo: Localize;
	x = 0.4125 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.175 * safezoneW;
	h = 0.1 * safezoneH;
};
};
};
