class RPP_Anims
{
    idd = 30045;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RPP_Anims', (_this select 0)]";
	
	class Controls
	{

class Background: RPP_RscPicture
{
	idc = 1800;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.356771 * safezoneW + safezoneX;
	y = 0.26909 * safezoneH + safezoneY;
	w = 0.275 * safezoneW;
	h = 0.351863 * safezoneH;
};
class Anim_list: RPP_RscListbox
{
	idc = 1500;
	x = 0.3625 * safezoneW + safezoneX;
	y = 0.34606 * safezoneH + safezoneY;
	w = 0.257813 * safezoneW;
	h = 0.219914 * safezoneH;
};
class RscButton_1600: RPP_RscButton
{
	idc = 1600;
	text = "Use"; //--- ToDo: Localize;
	x = 0.454167 * safezoneW + safezoneX;
	y = 0.57697 * safezoneH + safezoneY;
	w = 0.0802083 * safezoneW;
	h = 0.0329871 * safezoneH;
};
class RscPicture_1200: RPP_RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,0,0,1.0,CO)";
	x = 0.356771 * safezoneW + safezoneX;
	y = 0.26909 * safezoneH + safezoneY;
	w = 0.275 * safezoneW;
	h = 0.0329871 * safezoneH;
};
class RscText_1000: RPP_RscText
{
	idc = 1000;
	text = "Animations"; //--- ToDo: Localize;
	x = 0.459896 * safezoneW + safezoneX;
	y = 0.313073 * safezoneH + safezoneY;
	w = 0.0572917 * safezoneW;
	h = 0.0329871 * safezoneH;
};
};
};
