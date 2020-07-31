class a3l_jail_timer {
	idd = 5536;
	duration = 1e+012;
	onLoad = "uiNamespace setVariable [""a3ljailtimer"", _this select 0];";
	class controls {
class blackground: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(0,0,0,0)";
	x = -0.00531252 * safezoneW + safezoneX;
	y = 0.049 * safezoneH + safezoneY;
	w = 1.00547 * safezoneW;
	h = 0.077 * safezoneH;
};
class timer: RscStructuredText
{
	idc = 1100;
	text = "<t font='EtelkaNarrowMediumPro' color='#327aad' align='center' size='1.5'></t>"; //--- ToDo: Localize;
	x = -0.000156274 * safezoneW + safezoneX;
	y = 0.049 * safezoneH + safezoneY;
	w = 1.00031 * safezoneW;
	h = 0.039 * safezoneH;
};
class reason: RscStructuredText
{
	idc = 1101;
	text = "<t font='EtelkaNarrowMediumPro' color='#ffffff' align='center' size='0.6'></t>"; //--- ToDo: Localize;
	x = -0.000156274 * safezoneW + safezoneX;
	y = 0.07538 * safezoneH + safezoneY;
	w = 1.00031 * safezoneW;
	h = 0.023 * safezoneH;
};

};
};