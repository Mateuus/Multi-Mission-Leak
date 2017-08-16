/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscDisplayLoading
{
	idd = IDD_RSCDISPLAYLOADING;
	scriptName = "GTA_RscDisplayLoading";
	scriptPath = "GUI";
	onLoad = "[ _this, ""GTA_RscDisplayLoading"" ] call GTA_fnc_initDisplay";

	class ControlsBackground
	{

		class Tiles: GTA_RscTiles {};

	};

	class Controls
	{

		class Background: GTA_RscText
		{
			idc = -1;
			x = "12.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "8.5 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "15 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.8 };
		};

		class TextWait: GTA_RscText
		{
			idc = -1;
			x = "12.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "8.5 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "15 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.8 };
			shadow = 0;
			text = "PLEASE WAIT...";
		};

		class Ring0: GTA_RscPictureKeepAspect
		{
			idc = IDC_RSCDISPLAYLOADINGRING;
			x = "18 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "11 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "4 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "gui\data\RscHUD\ring_0.paa";
		};

		class Ring1: GTA_RscPictureKeepAspect
		{
			idc = IDC_RSCDISPLAYLOADINGRING + 1;
			x = "18 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "11 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "4 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "gui\data\RscHUD\ring_1.paa";
		};

		class Ring2: GTA_RscPictureKeepAspect
		{
			idc = IDC_RSCDISPLAYLOADINGRING + 2;
			x = "18 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "11 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "4 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "gui\data\RscHUD\ring_2.paa";
		};

		class Ring3: GTA_RscPictureKeepAspect
		{
			idc = IDC_RSCDISPLAYLOADINGRING + 3;
			x = "18 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "11 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "4 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "gui\data\RscHUD\ring_3.paa";
		};

		class Ring4: GTA_RscPictureKeepAspect
		{
			idc = IDC_RSCDISPLAYLOADINGRING + 4;
			x = "18 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "11 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "4 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "gui\data\RscHUD\ring_4.paa";
		};

		class Ring5: GTA_RscPictureKeepAspect
		{
			idc = IDC_RSCDISPLAYLOADINGRING + 5;
			x = "18 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "11 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "4 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "gui\data\RscHUD\ring_5.paa";
		};

		class Ring6: GTA_RscPictureKeepAspect
		{
			idc = IDC_RSCDISPLAYLOADINGRING + 6;
			x = "18 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "11 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "4 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "gui\data\RscHUD\ring_6.paa";
		};

		class Ring7: GTA_RscPictureKeepAspect
		{
			idc = IDC_RSCDISPLAYLOADINGRING + 7;
			x = "18 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "11 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "4 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "gui\data\RscHUD\ring_7.paa";
		};

		class Ring8: GTA_RscPictureKeepAspect
		{
			idc = IDC_RSCDISPLAYLOADINGRING + 8;
			x = "18 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "11 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "4 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "gui\data\RscHUD\ring_8.paa";
		};

	};

};
