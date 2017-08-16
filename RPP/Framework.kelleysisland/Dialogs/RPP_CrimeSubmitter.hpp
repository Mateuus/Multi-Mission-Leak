class RPP_CrimeSubmitter
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_CrimeSubmitter', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.4 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.1875 * safezoneW;
	h = 0.22 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Name:"; //--- ToDo: Localize;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.42 * safezoneH + safezoneY;
	w = 0.0375 * safezoneW;
	h = 0.02 * safezoneH;
};
class players: RPP_RscCombo
{
	idc = 2100;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.42 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Reason:"; //--- ToDo: Localize;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.46 * safezoneH + safezoneY;
	w = 0.0375 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Race:"; //--- ToDo: Localize;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0375 * safezoneW;
	h = 0.02 * safezoneH;
};
class race: RPP_RscCombo
{
	idc = 2101;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1003: RPP_RscText
{
	idc = 1003;
	text = "Submit by:"; //--- ToDo: Localize;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.54 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.02 * safezoneH;
};
class txt_reason: RPP_RscEdit
{
	idc = 1400;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.46 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class txt_submit: RPP_RscEdit
{
	idc = 1401;
	x = 0.4625 * safezoneW + safezoneX;
	y = 0.54 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Submit Crime Record"; //--- ToDo: Localize;
	x = 0.425 * safezoneW + safezoneX;
	y = 0.58 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.02 * safezoneH;
};
class header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.4 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.1875 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1004: RPP_RscText
{
	idc = 1004;
	text = "Crime Submitter"; //--- ToDo: Localize;
	x = 0.4 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.1125 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
