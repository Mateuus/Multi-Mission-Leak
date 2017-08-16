/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscDisplayInventory
{
	idd = -1;
	scriptName = "GTA_RscDisplayInventory";
	scriptPath = "GUI";
	onLoad = "[ _this, ""GTA_RscDisplayInventory"" ] call GTA_fnc_initDisplay";

	class ControlsBackground
	{

		class Tiles: GTA_RscTiles {};

	};

	class Controls
	{

		class Dummy: GTA_RscText
		{
			idc = -1;
			x = -1;
			y = -1;
			w = 0;
			h = 0;
		};

		class Title: GTA_RscTitle
		{
			idc = -1;
			x = "5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "1.5 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "30 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "INVENTORY";
		};

		class Background: GTA_RscText
		{
			idc = -1;
			x = "5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.6 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "30 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "20 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.7 };
		};

		class TabItems: GTA_RscButton
		{
			idc = IDC_RSCDISPLAYINVENTORY_TABITEMS;
			x = "5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.6 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "15 *	 			( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1.3 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorText[] = { 1, 1, 1, 1 };
			colorBackground[] = { 0, 0, 0, 1 };
			colorBackgroundActive[] = { 0, 0, 0, 1 };

			sizeEx = "0.9 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			text = "ITEMS";
		};

		class TabLicenses: TabItems
		{
			idc = IDC_RSCDISPLAYINVENTORY_TABLICENSES;
			x = "20 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.6 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "15 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1.3 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorText[] = { 1, 1, 1, 0.4 };
			colorBackground[] = { 0, 0, 0, 0.6 };
			colorBackgroundActive[] = { 0, 0, 0, 0.6 };
			colorFocused[] = { 0, 0, 0, 0.6 };

			text = "LICENSES";
		};

		class GroupItems: GTA_RscControlsGroupNoScrollbars
		{
			idc = IDC_RSCDISPLAYINVENTORY_GROUPITEMS;
			x = "5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "3.9 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "30 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "20 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{

				class HeaderName: GTA_RscText
				{
					idc = -1;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "23 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.8 };
					sizeEx = "0.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					text = "ITEM";
				};

				class HeaderQuantity: HeaderName
				{
					idc = -1;
					x = "22.25 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					w = "7.25 *		 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";

					text = "QUANTITY";
				};

				class Column1: GTA_RscText
				{
					idc = -1;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "29 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "15.9 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
				};

				class Column2: GTA_RscText
				{
					idc = -1;
					x = "22.25 *				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "7.25 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "15.9 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
				};

				class ListItems: GTA_RscListNBox
				{
					idc = IDC_RSCDISPLAYINVENTORY_LISTITEMS;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "29 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "15.1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					columns[] = { 0, 0.75 };
				};

				class ProgressLoad: GTA_RscProgress
				{
					idc = IDC_RSCDISPLAYINVENTORY_PROGRESSLOAD;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "16.9 *					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "29 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1.3 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBar[] = { 1, 1, 1, 1 };
					colorFrame[] = { 0, 0, 0, 0 };
				};

				class TextLoad: GTA_RscText
				{
					idc = IDC_RSCDISPLAYINVENTORY_TEXTLOAD;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "16.9 *					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "29 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1.3 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
					colorShadow[] = { 1, 1, 1, 1 };
					colorText[] = { 0, 0, 0, 1 };
					shadow = 0;
					sizeEx = "0.8 *	 			( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					style = 2;
					text = "0 / 64";
				};

				class ButtonDrop: GTA_RscButtonMenu
				{
					idc = IDC_RSCDISPLAYINVENTORY_BUTTONDROP;
					x = "0 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "18.8 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "9.8 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "Drop";
				};

				class ButtonGive: GTA_RscButtonMenu
				{
					idc = IDC_RSCDISPLAYINVENTORY_BUTTONGIVE;
					x = "9.9 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "18.8 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "10 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "Give";
				};

				class ButtonUse: GTA_RscButtonMenu
				{
					idc = IDC_RSCDISPLAYINVENTORY_BUTTONUSE;
					x = "20 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "18.8 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "10 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "Use";
				};

			};

		};

	};

};
