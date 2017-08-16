/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscInfoText
{
	idd = -1;
	fadein = 1;
	fadeout = 0;
	duration = 1e+011;
	scriptName = "GTA_RscInfoText";
	scriptPath = "GUI";
	onLoad = "[ _this, ""GTA_RscInfoText"" ] call GTA_fnc_initDisplay";

	class Controls
	{

		class TextTitle: GTA_RscText
		{
			idc = IDC_RSCINFOTEXT_TEXTTITLE;
			x = "9.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "10 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "21 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorText[] = { "( profilenamespace getVariable [ 'GUI_BCG_RGB_R', 0.77 ] )", "( profilenamespace getVariable [ 'GUI_BCG_RGB_G', 0.51 ] )", "( profilenamespace getVariable [ 'GUI_BCG_RGB_B', 0.08 ] )", 1 };
			sizeEx = "2 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			style = 2;
		};

		class TextSubtitle: GTA_RscText
		{
			idc = IDC_RSCINFOTEXT_TEXTSUBTITLE;
			x = "10.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "12.5 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "19 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			sizeEx = "1 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			style = 2;
		};

	};

};
