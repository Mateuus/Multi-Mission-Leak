/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscDisplayMessageType
{
	idd = IDD_RSCDISPLAYMESSAGETYPE;
	scriptName = "RscDisplayMessageType";
	scriptPath = "GUI";
	onLoad = "[ _this, ""RscDisplayMessageType"" ] call GTA_fnc_initDisplay";

	class ControlsBackground
	{

		class Tiles: GTA_RscTiles {};

	};

	class Controls
	{

		class Title: GTA_RscTitle
		{
			idc = -1;
			x = "14 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "3.7 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "12 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "MESSAGE TYPE";
		};

		class Background: GTA_RscText
		{
			idc = -1;
			x = "14 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "4.8 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "12 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "15.4 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.7 };
		};

		class ListTypes: GTA_RscListBox
		{
			idc = IDC_RSCDISPLAYMESSAGETYPE_LISTTYPES;
			x = "14.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "5.3 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "11 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "14.4 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 1, 1, 1, 0.1 };
			colorPictureSelected[] = { 1, 1, 1, 1 };
			colorSelect[] = { 0, 0, 0, 1 };
			colorSelect2[] = { 0, 0, 0, 1 };
			colorSelectBackground[] = { 1, 1, 1, 0.5 };
			colorSelectBackground2[] = { 1, 1, 1, 0.5 };
			rowHeight = "1.8 * 			( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class ButtonClose: GTA_RscButtonMenuCancel
		{
			x = "14 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "20.3 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "5.95 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Cancel";
		};

		class ButtonSelect: GTA_RscButtonMenuOK
		{
			x = "20.05 *				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "20.3 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "5.95 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Select";
		};

	};

};
