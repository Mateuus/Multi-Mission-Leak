class RPP_PhoneMainMenu
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_PhoneMainMenu', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1200;
	text = "RPP_Config\Dialogs\RPP_PhoneMain.paa";
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.375 * safezoneW;
	h = 0.52 * safezoneH;
};
class addcontact: RPP_RscButton_Hiden
{
	idc = 1600;
	x = 0.432969 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.066 * safezoneH;
};
class messageplayer: RPP_RscButton_Hiden
{
	idc = 1601;
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.066 * safezoneH;
};
class phone: RPP_RscButton_Hiden
{
	idc = 1602;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.066 * safezoneH;
};
class contacts: RPP_RscButton_Hiden
{
	idc = 1603;
	x = 0.432969 * safezoneW + safezoneX;
	y = 0.456 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.066 * safezoneH;
};
class police: RPP_RscButton_Hiden
{
	idc = 1604;
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.456 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.066 * safezoneH;
};
class ems: RPP_RscButton_Hiden
{
	idc = 1605;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.456 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.066 * safezoneH;
};
class back: RPP_RscButton_Hiden
{
	idc = 1606;
	x = 0.432969 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.044 * safezoneH;
};
class ringtones: RPP_RscButton_Hiden
{
	idc = 1607;
	x = 0.432969 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.066 * safezoneH;
};
class settings: RPP_RscButton_Hiden
{
	idc = 1608;
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.066 * safezoneH;
};
class playerlist: RPP_RscCombo
{
	idc = 2100;
	x = 0.432969 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.139219 * safezoneW;
	h = 0.022 * safezoneH;
};
};
};
