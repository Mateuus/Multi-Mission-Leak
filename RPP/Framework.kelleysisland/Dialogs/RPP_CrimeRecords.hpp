class RPP_CrimeRecords
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_CrimeRecords', (_this select 0)]";
	
	class Controls
	{

class background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.2875 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.425 * safezoneW;
	h = 0.42 * safezoneH;
};
class crime_records: RPP_RscListbox
{
	idc = 1500;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.1875 * safezoneW;
	h = 0.28 * safezoneH;
};
class crime_details: RPP_RscListbox
{
	idc = 1501;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.28 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "View Crime Records"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.64 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1601: RPP_RscButton
{
	idc = 1601;
	text = "Revoke Crime Record"; //--- ToDo: Localize;
	x = 0.325 * safezoneW + safezoneX;
	y = 0.68 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscButton_1602: RPP_RscButton
{
	idc = 1602;
	text = "Close"; //--- ToDo: Localize;
	x = 0.625 * safezoneW + safezoneX;
	y = 0.68 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Crime Records"; //--- ToDo: Localize;
	x = 0.3625 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1001: RPP_RscText
{
	idc = 1001;
	text = "Crime Details"; //--- ToDo: Localize;
	x = 0.575 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.075 * safezoneW;
	h = 0.02 * safezoneH;
};
class Header: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.2875 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.425 * safezoneW;
	h = 0.06 * safezoneH;
};
class RscText_1002: RPP_RscText
{
	idc = 1002;
	text = "Crime Records Database"; //--- ToDo: Localize;
	x = 0.2875 * safezoneW + safezoneX;
	y = 0.24 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};