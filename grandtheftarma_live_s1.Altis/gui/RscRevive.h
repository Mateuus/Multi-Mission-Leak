/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscRevive
{
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 1e+011;
	scriptName = "GTA_RscRevive";
	scriptPath = "GUI";
	onLoad = "[ _this, ""GTA_RscRevive"" ] call GTA_fnc_initDisplay";

	class Controls
	{

		class Background: GTA_RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY + safezoneH - 7 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "safezoneW";
			h = "5 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0.2, 0.2, 0.2, 0.7 };
		};

		class TextStatus: GTA_RscText
		{
			idc = IDC_RSCREVIVE_TEXTSTATUS;
			x = "10 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "safezoneY + safezoneH - 6.5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "20 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			style = 2;
		};

		class TextAction: GTA_RscStructuredText
		{
			idc = IDC_RSCREVIVE_TEXTACTION;
			x = "10 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "safezoneY + safezoneH - 3.5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "20 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Attributes
			{
				font = "PuristaMedium";
				color = "#ffffff";
				align = "center";
				size = 1;
				shadow = 1;
			};
		};

		class TextMedic: GTA_RscText
		{
			idc = IDC_RSCREVIVE_TEXTMEDIC;
			x = "safezoneX + safezoneW - 10.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "10 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			style = 1;
			text = "MEDIC: 12000m";
		};

		class BackgroundProgressBlood: GTA_RscText
		{
			idc = -1;
			x = "10 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "safezoneY + safezoneH - 5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "20 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.7 };
		};

		class ProgressBlood: GTA_RscProgress
		{
			idc = IDC_RSCREVIVE_PROGRESSBLOOD;
			x = "10 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "safezoneY + safezoneH - 5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "20 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

	};
};
