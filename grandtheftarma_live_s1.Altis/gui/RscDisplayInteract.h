/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscDisplayInteract
{
	idd = IDD_RSCDISPLAYINTERACT;
	scriptName = "GTA_RscDisplayInteract";
	scriptPath = "GUI";
	onLoad = "[ _this, ""GTA_RscDisplayInteract"" ] call GTA_fnc_initDisplay";

	class Controls
	{

		class Title: GTA_RscTitle
		{
			idc = -1;
			x = "30 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "9.6 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "10 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1.3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			sizeEx = "1.2 * 			( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			text = "Interact";
		};

		class Button0: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON;
			x = "30 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "11 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "10 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Button 0";
		};

		class Button1: Button0
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON + 1;
			y = "12.1 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";

			text = "Button 1";
		};

		class Button2: Button0
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON + 2;
			y = "13.2 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";

			text = "Button 2";
		};

		class Button3: Button0
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON + 3;
			y = "14.3 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";

			text = "Button 3";
		};

		class Button4: Button0
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON + 4;
			y = "15.4 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";

			text = "Button 4";
		};

		class Button5: Button0
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON + 5;
			y = "16.5 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";

			text = "Button 5";
		};

		class Button6: Button0
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON + 6;
			y = "17.6 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";

			text = "Button 6";
		};

		class Button7: Button0
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON + 7;
			y = "18.7 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";

			text = "Button 7";
		};

		class Button8: Button0
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON + 8;
			y = "19.8 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";

			text = "Button 8";
		};

		class Button9: Button0
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON + 9;
			y = "20.9 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";

			text = "Button 9";
		};

		class Button10: Button0
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON + 10;
			y = "22 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";

			text = "Button 10";
		};

		class Button11: Button0
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON + 11;
			y = "23.1 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";

			text = "Button 11";
		};

		class Button12: Button0
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON + 12;
			y = "24.2 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";

			text = "Button 12";
		};

		class Button13: Button0
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON + 13;
			y = "25.3 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";

			text = "Button 13";
		};

		class Button14: Button0
		{
			idc = IDC_RSCDISPLAYINTERACT_BUTTON + 14;
			y = "26.4 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";

			text = "Button 14";
		};

	};

};
