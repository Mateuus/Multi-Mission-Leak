/*
	Author: UpperM

	Description:
	Show some infos with slide move.
	You can edit the script whitout my permission but you are not allow to remove the credit (but you can add "Edit by : Your Name" )
	You are not allowed to sall my script !

	Contact : uppperm@gmail.com
	Youtube : upperm.fr/youtube

	Parameter(s): -

	Returns: -
*/

class RscStructuredText
	{
		access = 0;
		type = 13;
		idc = -1;
		style = 0;
		colorText[] ={1,1,1,1};
		class Attributes
		{
			font = RobotoCondensed;
			color = "#ffffff";
			align = "left";
			shadow = 1;
		};
		x = 0;
		y = 0;
		h = 0.035;
		w = 0.1;
		text = "";
		size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		shadow = 1;
	};
class RscText
	{
	    x = 0;
	    y = 0;
	    h = 0.037;
	    w = 0.3;
	    type = 0;
	    style = 0;
	    shadow = 1;
	    colorShadow[] = {0, 0, 0, 0.5};
	    font = "RobotoCondensed";
	    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	    text = "";
	    colorText[] = {1, 1, 1, 1.0};
	    colorBackground[] = {0, 0, 0, 0};
	    linespacing = 1;
	    tooltipColorText[] = {1,1,1,1};
	    tooltipColorBox[] = {1,1,1,1};
	    tooltipColorShade[] = {0,0,0,0.65};
	};

class RscNotification {
	name = "RscNotification";
	idd = 38500;
	movingEnable = true;
	enableSimulation = true;
	duration = 15;
    onLoad = "uiNamespace setVariable ['RscNotification',_this select 0]";
	class controlsBackground {


		class STRIP: RscText {
			idc = 38502;
			x = -0.16618509 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.003 * safezoneW;
			h = 0 * safezoneH;
		};
		class TEXT_ZONE: RscStructuredText {
			idc = 38501;
			text = "";
			x = -0.17031 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};

	};
};