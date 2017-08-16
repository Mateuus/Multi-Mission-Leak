/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscDisplayLicenseShop
{
	idd = IDD_RSCDISPLAYLICENSESHOP;
	scriptName = "GTA_RscDisplayLicenseShop";
	scriptPath = "GUI";
	onLoad = "[ _this, ""GTA_RscDisplayLicenseShop"" ] call GTA_fnc_initDisplay";

	class ControlsBackground
	{

		class Tiles: GTA_RscTiles {};

	};

	class Controls
	{

		class Dummy: GTA_RscText
		{
			idc = -1;
		};

		class Title: GTA_RscTitle
		{
			idc = -1;
			x = "7.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "25 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "LICENSING";
		};

		class Background: GTA_RscText
		{
			idc = -1;
			x = "7.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "25 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "20.8 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.7 };
		};

		class TextLicense: GTA_RscText
		{
			idc = -1;
			x = "8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.6 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "16.8 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 1 };
			text = "License";
		};

		class TextCost: GTA_RscText
		{
			idc = -1;
			x = "24.8 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.6 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "7.2 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 1 };
			text = "Cost";
		};

		class BackgroundLicenses: GTA_RscText
		{
			idc = -1;
			x = "8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "3.6 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "24 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "18.8 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 1, 1, 1, 0.1 };
		};

		class ListLicenses: GTA_RscListNBox
		{
			idc = IDC_RSCDISPLAYLICENSESHOP_LISTLICENSES;
			x = "8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "3.6 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "24 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "18.8 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			columns[] = { 0, 0.7 };
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;
			colorSelect[] = { 1, 1, 1, 1 };
			colorSelect2[] = { 1, 1, 1, 1 };
			colorSelectBackground[] = { 1, 1, 1, 0.5 };
			colorSelectBackground2[] = { 1, 1, 1, 0.5 };
			rowHeight = "2 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			sizeEx = "1 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class ButtonExit: GTA_RscButtonMenuOK
		{
			x = "7.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "23 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Exit";
		};

		class ButtonTrain: GTA_RscButtonMenuOK
		{
			idc = IDC_RSCDISPLAYLICENSESHOP_BUTTONTRAIN;
			x = "26.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "23 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Train";
		};

	};

};
