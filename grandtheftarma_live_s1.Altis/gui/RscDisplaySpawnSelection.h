/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscDisplaySpawnSelection
{
	idd = IDD_RSCDISPLAYSPAWNSELECTION;
	scriptName = "GTA_RscDisplaySpawnSelection";
	scriptPath = "GUI";
	onLoad = "[ _this, ""GTA_RscDisplaySpawnSelection"" ] call GTA_fnc_initDisplay";

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
			x = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "38 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "SPAWN SELECTION";
		};

		class TextName: GTA_RscText
		{
			idc = IDC_RSCDISPLAYSPAWNSELECTION_TEXTNAME;
			x = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "38 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			style = 1;
			text = "";
		};

		class Background: GTA_RscText
		{
			idc = -1;
			x = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "38 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "21 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.7 };
		};

		class ListLocations: GTA_RscListBox
		{
			idc = IDC_RSCDISPLAYSPAWNSELECTION_LISTLOCATIONS;
			x = "1.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.6 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "20 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 1, 1, 1, 0.1 };
			sizeEx = "1 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			sizeEx2 = "1 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			rowHeight = "1.8 * 			( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class Map: GTA_RscMapControl
		{
			idc = IDC_RSCDISPLAYSPAWNSELECTION_MAP;
			x = "14 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.6 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "24.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "20 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			alphaFadeEndScale = 100;
			alphaFadeStartScale = 100;
			colorBackground[] = { 1, 1, 1, 1 };
			colorCountlines[] = { 0, 0, 0, 0 };
			colorCountlinesWater[] = { 0, 0, 0, 0 };
			colorForest[] = { 1, 1, 1, 1 };
			colorGrid[] = { 0, 0, 0, 0 };
			colorGridMap[] = { 0, 0, 0, 0 };
			colorMainCountlines[] = { 0, 0, 0, 0 };
			colorMainCountlinesWater[] = { 0, 0, 0, 0 };
			colorOutside[] = { 0.251, 0.275, 0.31, 1 };
			colorRocks[] = { 0, 0, 0, 0 };
			colorSea[] = { 0.467, 0.631, 0.851, 0.25 };
			drawObjects = 0;
			font = "PuristaMedium";
			fontGrid = "PuristaMedium";
			fontInfo = "PuristaMedium";
			fontLabel = "PuristaMedium";
			fontLevel = "PuristaMedium";
			fontNames = "PuristaMedium";
			fontUnits = "PuristaMedium";
			maxSatelliteAlpha = 1;
			ptsPerSquareCLn = 200;
			ptsPerSquareCost = 200;
			ptsPerSquareFor = 200;
			ptsPerSquareForEdge = 200;
			ptsPerSquareObj = 200;
			ptsPerSquareRoad = 200;
			ptsPerSquareTxt = 20;
			scaleDefault = 0.3;
			sizeExGrid = 0;
		};

		class ButtonCancel: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYSPAWNSELECTION_BUTTONCANCEL;
			x = "1 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "23.2 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "$STR_DISP_CANCEL";
		};

		class ButtonSpawn: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYSPAWNSELECTION_BUTTONSPAWN;
			x = "27 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "23.2 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Spawn";
		};

	};

};
