/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscDisplaySelectPlayer
{
	idd = IDD_RSCDISPLAYSELECTPLAYER;
	scriptName = "GTA_RscDisplaySelectPlayer";
	scriptPath = "GUI";
	onLoad = "[ _this, ""GTA_RscDisplaySelectPlayer"" ] call GTA_fnc_initDisplay";

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
			x = "12.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "0 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "15 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "PLAYERS";
		};

		class Background: GTA_RscText
		{
			idc = -1;
			x = "12.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "1.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "15 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "23 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.7 };
		};

		class BackgroundSearch: GTA_RscText
		{
			idc = -1;
			x = "13 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "1.6 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "14 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 1, 1, 1, 0.1 };
		};

		class EditSearch: GTA_RscEdit
		{
			idc = IDC_RSCDISPLAYSELECTPLAYER_EDITSEARCH;
			x = "13 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "1.6 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "14 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			shadow = 0;
			style = "0x200";
		};

		class TextSearch: GTA_RscText
		{
			idc = IDC_RSCDISPLAYSELECTPLAYER_TEXTSEARCH;
			x = "13 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "1.6 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "14 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			shadow = 0;
			style = "0x200";
			text = "Search...";
		};

		class BackgroundFilter: GTA_RscText
		{
			idc = IDC_RSCDISPLAYSELECTPLAYER_BACKGROUNDFILTER;
			x = "13 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "3.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2.8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 1, 1, 1, 0.1 };
		};

		class Filter0: GTA_RscActivePictureKeepAspect
		{
			idc = IDC_RSCDISPLAYSELECTPLAYER_FILTER0;
			x = "13 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "3.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2.8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";


			text = "\a3\ui_f_curator\Data\Displays\RscDisplayCurator\side_unknown_ca.paa";
			tooltip = "All";
		};

		class Filter1: GTA_RscActivePictureKeepAspect
		{
			idc = IDC_RSCDISPLAYSELECTPLAYER_FILTER1;
			x = "15.8 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "3.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2.8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "\a3\ui_f_curator\Data\Displays\RscDisplayCurator\side_west_ca.paa";
			tooltip = "BLUFOR";
		};

		class Filter2: GTA_RscActivePictureKeepAspect
		{
			idc = IDC_RSCDISPLAYSELECTPLAYER_FILTER2;
			x = "18.6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "3.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2.8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "\a3\ui_f_curator\Data\Displays\RscDisplayCurator\side_east_ca.paa";
			tooltip = "OPFOR";
		};

		class Filter3: GTA_RscActivePictureKeepAspect
		{
			idc = IDC_RSCDISPLAYSELECTPLAYER_FILTER3;
			x = "21.4 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "3.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2.8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "\a3\ui_f_curator\Data\Displays\RscDisplayCurator\side_guer_ca.paa";
			tooltip = "Independent";
		};

		class Filter4: GTA_RscActivePictureKeepAspect
		{
			idc = IDC_RSCDISPLAYSELECTPLAYER_FILTER4;
			x = "24.2 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "3.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2.8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "\a3\ui_f_curator\Data\Displays\RscDisplayCurator\side_civ_ca.paa";
			tooltip = "Civilian";
		};

		class ListPlayers: GTA_RscListBox
		{
			idc = IDC_RSCDISPLAYSELECTPLAYER_LISTPLAYERS;
			x = "13 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "4.6 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "14 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "19 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 1, 1, 1, 0.1 };
			colorPictureSelected[] = { 1, 1, 1, 1 };
			colorSelect[] = { 0, 0, 0, 1 };
			colorSelect2[] = { 0, 0, 0, 1 };
			colorSelectBackground[] = { 1, 1, 1, 0.5 };
			colorSelectBackground2[] = { 1, 1, 1, 0.5 };
		};

		class ButtonCancel: GTA_RscButtonMenuCancel
		{
			x = "12.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "24.2 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Cancel";
		};

		class ButtonSelect: GTA_RscButtonMenuOK
		{
			x = "21.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "24.2 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Select";
		};

	};

};
