class RPP_PhoneAddContact
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_PhoneAddContact', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1200;
	text = "RPP_Config\Dialogs\RPP_PhoneAddContact.paa";
	x = 0.299 * safezoneW + safezoneX;
	y = 0.2408 * safezoneH + safezoneY;
	w = 0.4 * safezoneW;
	h = 0.52 * safezoneH;
};
class add: RPP_RscButton_Hiden
{
	idc = 1600;
	x = 0.505156 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.033 * safezoneH;
};
class back: RPP_RscButton_Hiden
{
	idc = 1602;
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.033 * safezoneH;
};
class name: RPP_RscEdit
{
	idc = 1400;
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.401 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.022 * safezoneH;
};
class number: RPP_RscEdit
{
	idc = 1401;
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.022 * safezoneH;
};
};
};
