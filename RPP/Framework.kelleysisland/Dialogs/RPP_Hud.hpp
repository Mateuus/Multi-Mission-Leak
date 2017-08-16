class RPP_HudDialog
{
	idd=-1;
	movingEnable=0;
	fadein=0;
	duration = 99999999999999999999999999999999999999999999;
	fadeout=0;
	name="RPP_HudDialog";
    onLoad = "uiNamespace setVariable ['RPP_HudDialog', (_this select 0)]";
	
	class Controls
	{


class RscText_1000: RPP_RscStructuredText
{
	idc = 1000;
	text = "Test"; //--- ToDo: Localize;
	x = 0.1125 * safezoneW + safezoneX;
	y = -1.63913e-008 * safezoneH + safezoneY;
	w = 0.7875 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscPicture_1200: RPP_RscPicture
{
	idc = 1200;
	text = "RPP_Image\Dialogs\logo.paa";
	x = -2.45869e-008 * safezoneW + safezoneX;
	y = 0.94 * safezoneH + safezoneY;
	w = 0.0375 * safezoneW;
	h = 0.06 * safezoneH;
};
};
};
