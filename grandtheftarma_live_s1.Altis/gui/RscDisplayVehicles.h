/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscDisplayVehicles
{
	idd = IDD_RSCDISPLAYVEHICLES;
	scriptName = "GTA_RscDisplayVehicles";
	scriptPath = "GUI";
	onLoad = "[ _this, ""GTA_RscDisplayVehicles"" ] call GTA_fnc_initDisplay";

	class ControlsBackground
	{

		class Tiles: GTA_RscTiles {};

	};

	class Controls
	{

		class GroupVehicles: GTA_RscControlsGroupNoScrollbars
		{
			idc = IDC_RSCDISPLAYMESSAGING_GROUPVEHICLS;
			x = "1.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "0 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "16 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "22.1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{

				class Title: GTA_RscTitle
				{
					idc = -1;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "16 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "VEHICLES";
				};

				class Background: GTA_RscText
				{
					idc = -1;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "16 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "21 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.7 };
				};

				class ListVehicles: GTA_RscListBox
				{
					idc = IDC_RSCDISPLAYVEHICLESHOP_LISTVEHICLES;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.6 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "15 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "20 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
					colorPictureSelected[] = { 1, 1, 1, 1 };
					colorSelect[] = { 0, 0, 0, 1 };
					colorSelect2[] = { 0, 0, 0, 1 };
					colorSelectBackground[] = { 1, 1, 1, 0.5 };
					colorSelectBackground2[] = { 1, 1, 1, 0.5 };
					rowHeight = "1.4 * 			( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

			};

		};

		class GroupVehicle: GTA_RscControlsGroupNoScrollbars
		{
			idc = IDC_RSCDISPLAYMESSAGING_GROUPVEHICLE;
			x = "18.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "0 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "20 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "22.1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{

				class Title: GTA_RscTitle
				{
					idc = -1;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "20 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "VEHICLE";
				};

				class Background: GTA_RscText
				{
					idc = -1;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "20 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "21 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.7 };
				};

				class PictureVehicle: GTA_RscPictureKeepAspect
				{
					idc = -1;
					x = "5.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.6 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "9 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "9 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "\A3\soft_f_gamma\SUV_01\Data\UI\portrait_suv_01_CA.paa";
				};

				class Stat1Text: GTA_RscText
				{
					idc = -1;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "11.6 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "6 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
					colorShadow[] = { 1, 1, 1, 1 };
					shadow = 0;
					sizeEx = "0.8 *	 			( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					text = "Buy Price";
				};

				class Stat1: GTA_RscText
				{
					idc = IDC_RSCDISPLAYVEHICLESHOP_STAT1;
					x = "6.6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "11.6 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "12.9 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
					colorShadow[] = { 1, 1, 1, 1 };
					shadow = 0;
					sizeEx = "0.8 *	 			( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					text = "£20,000";
				};

				class Stat2Text: Stat1Text
				{
					idc = -1;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "13.1 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "6 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "Rental Price";
				};

				class Stat2: Stat1
				{
					idc = IDC_RSCDISPLAYVEHICLESHOP_STAT2;
					x = "6.6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "13.1 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "12.9 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "£5,000";
				};

				class Stat3Text: Stat1Text
				{
					idc = -1;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "14.6 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "6 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "Seats";
				};

				class Stat3: Stat1
				{
					idc = IDC_RSCDISPLAYVEHICLESHOP_STAT3;
					x = "6.6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "14.6 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "12.9 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "6";
				};

				class Stat4Text: Stat1Text
				{
					idc = -1;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "16.1 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "6 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "Trunk Capacity";
				};

				class Stat4: Stat1
				{
					idc = IDC_RSCDISPLAYVEHICLESHOP_STAT4;
					x = "6.6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "16.1 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "12.9 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "500";
				};

				class BarStat1: GTA_RscProgress
				{
					idc = IDC_RSCDISPLAYVEHICLESHOP_BARSTAT1;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "17.6 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "19 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBar[] = { 1, 1, 1, 1 };
					colorFrame[] = { 0, 0, 0, 0 };
				};

				class BarStat2: BarStat1
				{
					idc = IDC_RSCDISPLAYVEHICLESHOP_BARSTAT2;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "19.1 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "19 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

				class BarStat3: BarStat1
				{
					idc = IDC_RSCDISPLAYVEHICLESHOP_BARSTAT3;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "20.6 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "19 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

				class BarStatText1: GTA_RscText
				{
					idc = -1;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "17.6 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "19 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
					colorShadow[] = { 1, 1, 1, 1 };
					colorText[] = { 0, 0, 0, 1 };
					shadow = 0;
					sizeEx = "0.8 *	 			( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					text = "Top Speed";
				};

				class BarStatText2: BarStatText1
				{
					idc = -1;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "19.1 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "19 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "Fuel";
				};

				class BarStatText3: BarStatText1
				{
					idc = -1;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "20.6 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "19 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "Armor";
				};

			};

		};

		class GroupTextures: GTA_RscControlsGroupNoScrollbars
		{
			idc = IDC_RSCDISPLAYMESSAGING_GROUPTEXTURES;
			x = "39.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "0 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "13 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "22.1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{

				class Title: GTA_RscTitle
				{
					idc = -1;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "13 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "RESPRAY";
				};

				class Background: GTA_RscText
				{
					idc = -1;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "13 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "21 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.7 };
				};

				class ListVehicles: GTA_RscListBox
				{
					idc = IDC_RSCDISPLAYVEHICLESHOP_LISTTEXTURES;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.6 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "12 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "20 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
					colorPictureSelected[] = { 1, 1, 1, 1 };
					colorSelect[] = { 0, 0, 0, 1 };
					colorSelect2[] = { 0, 0, 0, 1 };
					colorSelectBackground[] = { 1, 1, 1, 0.5 };
					colorSelectBackground2[] = { 1, 1, 1, 0.5 };
					rowHeight = "1.4 * 			( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

			};

		};

		class ButtonClose: GTA_RscButtonMenuOK
		{
			x = "1.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "22.2 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "7 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			shortcuts[] = {};
			default = 0;
			text = "Close";
		};

		class ButtonRent: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYVEHICLESHOP_BUTTONRENT;
			x = "24.4 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "22.2 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "7 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Rent";
		};

		class ButtonBuy: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYVEHICLESHOP_BUTTONBUY;
			x = "31.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "22.2 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "7 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Buy";
		};

	};

};
