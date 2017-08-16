/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscSpeedRadar
{
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 1e+011;
	scriptName = "GTA_RscSpeedRadar";
	scriptPath = "GUI";
	onLoad = "[ _this, ""GTA_RscSpeedRadar"" ] call GTA_fnc_initDisplay";

	class Controls
	{

		class Map: GTA_RscMapControl
		{
			IDC = IDC_RSCSPEEDRADAR_MAP;
			x = "( profilenamespace getVariable [ 'IGUI_GRID_GPS_X', ( safezoneX + safezoneW - 11 * 	( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) ) ] )";
			y = "( profilenamespace getVariable [ 'IGUI_GRID_GPS_Y', ( safezoneY + safezoneH - 20.5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) ) ] ) + 1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "( profilenamespace getVariable [ 'IGUI_GRID_GPS_W', ( 10 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) ) ] )";
			h = "( profilenamespace getVariable [ 'IGUI_GRID_GPS_H', ( 10 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) ) ] ) - 1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			alphaFadeEndScale = 10;
			alphaFadeStartScale = 10;
			colorBackground[] = { 0.2, 0.2, 0.2, 0.5 };
			colorCountlines[] = { 0.2, 0.2, 0.2, 0.2 };
			colorCountlinesWater[] = { 0.95, 0.95, 0.95, 0.4 }; //--TEXT
			colorForest[] = { 0.2, 0.2, 0.2 , 0.7};
			colorForestBorder[] = { 0.2, 0.2, 0.2, 0.5 };
			colorGrid[] = { 0.95, 0.95, 0.95, 0 };
			colorGridMap[] = { 0.95, 0.95, 0.95, 0 };
			colorLevels[] = {0,0,0,0 };
			colorMainCountlines[] = { 0.2, 0.2, 0.2 , 0.6 };
			colorMainCountlinesWater[] = { 0.95, 0.95, 0.95, 0.7 };
			colorMainRoads[] = { 0.95, 0.95, 0.95, 1.0 };
			colorMainRoadsFill[] = { 0.95, 0.95, 0.95, 0.7 };
			colorPowerLines[] = { 0.95, 0.95, 0.95, 0.5 };
			colorRailWay[] = { 0.95, 0.95, 0.95, 1.0 };
			colorRoads[] = { 0.95, 0.95, 0.95, 1.0 };
			colorRoadsFill[] = { 0.95, 0.95, 0.95, 0.5 };
			colorRocks[] = { 0.95, 0.95, 0.95, 0.1 };
			colorRocksBorder[] = { 0.95, 0.95, 0.95, 0.5 };
			colorSea[] = {0,0,0,0.4 };
			colorTracks[] = { 0.95, 0.95, 0.95, 0.15 };
			colorTracksFill[] = { 0.95, 0.95, 0.95, 0.3 };
			drawObjects = 0;
			maxSatelliteAlpha = 0;
			moveOnEdges = 1;
			ptsPerSquareFor = 15;
			ptsPerSquareForEdge = 15;
			ptsPerSquareObj = 15;
			ptsPerSquareRoad = 6;
			ptsPerSquareTxt = 500;
			showCountourInterval = 0;
			sizeExGrid = 0;
			sizeExInfo = 0;
			sizeExLabel = 0;
			sizeExLevel = 0;
			sizeExNames = 0;
			sizeExUnits = 0;

			class bush: Bush
			{
				color[] = { 0.2, 0.2, 0.2, 0.4 };
			};
			class rock: Rock
			{
				color[] = { 0.2, 0.2, 0.2, 0.8 };
			};
			class smalltree: SmallTree
			{
				color[] = { 0.2, 0.2, 0.2, 0.4 };
			};
			class tree: Tree
			{
				color[] = { 0.2, 0.2, 0.2, 0.4 };
			};
			class busstop: busstop
			{
				color[] = { 0.2, 0.2, 0.2, 1 };
			};
			class fuelstation: fuelstation
			{
				color[] = { 0.2, 0.2, 0.2, 1 };
			};
			class hospital: hospital
			{
				color[] = { 0.2, 0.2, 0.2, 1 };
			};
			class church: church
			{
				color[] = { 0.2, 0.2, 0.2, 1 };
			};
			class lighthouse: lighthouse
			{
				color[] = { 0.2, 0.2, 0.2, 1 };
			};
			class power: power
			{
				color[] = { 0.2, 0.2, 0.2, 1 };
			};
			class powersolar: powersolar
			{
				color[] = { 0.2, 0.2, 0.2, 1 };
			};
			class powerwave: powerwave
			{
				color[] = { 0.2, 0.2, 0.2, 1 };
			};
			class powerwind: powerwind
			{
				color[] = { 0.2, 0.2, 0.2, 1 };
			};
			class quay: quay
			{
				color[] = { 0.2, 0.2, 0.2, 1 };
			};
			class shipwreck: Shipwreck
			{
				color[] = { 0.2, 0.2, 0.2, 1 };
			};
			class transmitter: transmitter
			{
				color[] = { 0.2, 0.2, 0.2, 1 };
			};
			class watertower: watertower
			{
				color[] = { 0.2, 0.2, 0.2, 1 };
			};
		};

	};

};
