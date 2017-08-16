/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscDisplayPerks
{
	idd = IDD_RSCDISPLAYPERKS;
	scriptName = "GTA_RscDisplayPerks";
	scriptPath = "GUI";
	scriptIsInternal = 1;
	onLoad = "[ _this, ""GTA_RscDisplayPerks"", true ] call GTA_fnc_initDisplay";

	class ControlsBackground
	{

		class Vignette: GTA_RscVignette
		{
			idc = 114998;
		};

		class Tiles: GTA_RscTiles {};

	};

	class Controls
	{

		class Title: GTA_RscTitle
		{
			idc = -1;
			x = "5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "30 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "PERKS";
		};

		class TextPerkCount: GTA_RscText
		{
			idc = IDC_RSCDISPLAYPERKS_TEXTPERKCOUNT;
			x = "5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "30 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			style = 1;
			text = "";
		};

		class Background: GTA_RscText
		{
			idc = -1;
			x = "5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "30 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "21 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.7 };
		};

		class BackgroundList: GTA_RscText
		{
			idc = -1;
			x = "5.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.6 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "20 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 1, 1, 1, 0.1 };
		};

		class ButtonRemovePerk: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYPERKS_BUTTONREMOVEPERK;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "-1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "-";

			class Attributes
			{
				font = "PuristaMedium";
				color = "#ffffff";
				align = "center";
				shadow = "0";
			};
			class TextPos
			{
				left = 0;
				top = 0;
				right = 0;
				bottom = 0;
			};
		};

		class ButtonAddPerk: ButtonRemovePerk
		{
			idc = IDC_RSCDISPLAYPERKS_BUTTONADDPERK;
			x = "11 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "-1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "+";
		};

		class ListPerks: GTA_RscListNBox
		{
			idc = IDC_RSCDISPLAYPERKS_LISTPERKS;
			x = "5.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.6 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "20 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			columns[] = { 0.07, 0.15, 0.75 };
			drawSideArrows = 1;
			idcLeft = IDC_RSCDISPLAYPERKS_BUTTONREMOVEPERK;
			idcRight = IDC_RSCDISPLAYPERKS_BUTTONADDPERK;
			sizeEx = "1 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class PictureIcon: GTA_RscPictureKeepAspect
		{
			idc = IDC_RSCDISPLAYPERKS_PICTUREICON;
			x = "22.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "4 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "7 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "7 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "";
		};

		class TextRanks: GTA_RscText
		{
			idc = IDC_RSCDISPLAYPERKS_TEXTRANKS;
			x = "18 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "13.35 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "8.15 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 1, 1, 1, 0.1 };
			text = "";
		};

		class TextLevel: GTA_RscText
		{
			idc = IDC_RSCDISPLAYPERKS_TEXTLEVEL;
			x = "26.35 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "13.35 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "8.15 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 1, 1, 1, 0.1 };
			text = "";
		};

		class TextDescription: GTA_RscStructuredText
		{
			idc = IDC_RSCDISPLAYPERKS_TEXTDESCRIPTION;
			x = "18 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "14.6 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "16.5 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 1, 1, 1, 0.1 };
			text = "";

			class Attributes
			{
				font = "PuristaMedium";
				color = "#ffffff";
				align = "left";
				shadow = 0;
			};
		};

		class Button: GTA_RscButtonMenuCancel
		{
			x = "5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "23.2 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class ButtonReset: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYPERKS_BUTTONRESET;
			x = "22.9 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "23.2 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Reset";
		};

		class ButtonDone: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYPERKS_BUTTONDONE;
			x = "29 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "23.2 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Done";
		};

	};

};
