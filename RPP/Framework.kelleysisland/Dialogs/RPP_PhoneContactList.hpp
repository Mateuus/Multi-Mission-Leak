class RPP_PhoneContactList
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_PhoneContactList', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1200;
	text = "RPP_Config\Dialogs\RPP_PhoneContactList.paa";
	x = 0.299 * safezoneW + safezoneX;
	y = 0.2408 * safezoneH + safezoneY;
	w = 0.4 * safezoneW;
	h = 0.52 * safezoneH;
};
class call: RPP_RscButton_Hiden
{
	idc = 1600;
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.022 * safezoneH;
};
class remove: RPP_RscButton_Hiden
{
	idc = 1601;
	x = 0.505156 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.022 * safezoneH;
};
class back: RPP_RscButton_Hiden
{
	idc = 1602;
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.033 * safezoneH;
};
class contacts: RPP_RscListbox
{
	idc = 1500;
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.242 * safezoneH;
};
};
};