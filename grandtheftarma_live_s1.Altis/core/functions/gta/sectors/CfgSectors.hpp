/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_CfgSectors
{

	class Gang_Hideout_01
	{
		name = "Gang Hideout 1";
		logic = "sector_gang_hideout_01";
		captureFactions[] = { "civ" };
		captureType = "group_g";
		captureTime = 60;
		marker = 1;
		markerType = "hd_flag";
		markerColor = "ColorOrange";
	};

	class Lab_01
	{
		name = "Altis Laboratory";
		logic = "sector_lab_01";
		captureFactions[] = { "civ", "cop", "mil" };
		captureType = "side";
		captureTime = 420;
		marker = 1;
		markerType = "hd_flag";
		markerColor = "ColorGreen";
		markerText = "Controlled by %1";
		persistent = 1;
	};

	class Capture_Event_01
	{
		name = "Event Flag";
		logic = "sector_capture_event_01";
		captureFactions[] = { "civ" };
		captureType = "group_g";
		captureTime = 300;
		marker = 0;
	};

};
