class RPP_PhoneScreen
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_PhoneScreen', (_this select 0)]";
	
	class Controls
	{

class Background: RPP_RscPicture
{
	idc = 1200;
	text = "RPP_Config\Dialogs\RPP_PhoneScreen.paa";
	x = 0.3125 * safezoneW + safezoneX;
	y = 0.22 * safezoneH + safezoneY;
	w = 0.375 * safezoneW;
	h = 0.56 * safezoneH;
};
class Phone_Number: RPP_RscStructuredText
{
	idc = 1000;
	text = ""; //--- ToDo: Localize;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.06 * safezoneH;
};
class 1: RPP_RscButton_Hiden
{
	idc = 1600;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
	action = "[1] call RPP_Phone_EnterNumber;";
};
class 2: RPP_RscButton_Hiden
{
	idc = 1601;
	x = 0.484531 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	action = "[2] call RPP_Phone_EnterNumber;";
};
class 3: RPP_RscButton_Hiden
{
	idc = 1602;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	action = "[3] call RPP_Phone_EnterNumber;";
};
class 4: RPP_RscButton_Hiden
{
	idc = 1603;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
	action = "[4] call RPP_Phone_EnterNumber;";
};
class 5: RPP_RscButton_Hiden
{
	idc = 1604;
	x = 0.484531 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	action = "[5] call RPP_Phone_EnterNumber;";
};
class 6: RPP_RscButton_Hiden
{
	idc = 1605;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	action = "[6] call RPP_Phone_EnterNumber;";
};
class 7: RPP_RscButton_Hiden
{
	idc = 1606;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
	action = "[7] call RPP_Phone_EnterNumber;";
};
class 8: RPP_RscButton_Hiden
{
	idc = 1607;
	x = 0.484531 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	action = "[8] call RPP_Phone_EnterNumber;";
};
class 9: RPP_RscButton_Hiden
{
	idc = 1608;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	action = "[9] call RPP_Phone_EnterNumber;";
};
class 0: RPP_RscButton_Hiden
{
	idc = 1609;
	x = 0.484531 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	action = "[0] call RPP_Phone_EnterNumber;";
};
class call: RPP_RscButton_Hiden
{
	idc = 1610;
	x = 0.484531 * safezoneW + safezoneX;
	y = 0.61 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
};
class back: RPP_RscButton_Hiden
{
	idc = 1611;
	x = 0.432969 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
};
};
