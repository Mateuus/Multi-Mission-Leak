/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscSoundStatus
{
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 1e+011;
	scriptName = "GTA_RscSoundStatus";
	scriptPath = "GUI";
	onLoad = "[ _this, ""GTA_RscSoundStatus"" ] call GTA_fnc_initDisplay";

	class Controls
	{

		class PictureStatus: GTA_RscPictureKeepAspect
		{
			idc = IDC_RSCSOUNDSTATUS_PICTURESTATUS;
			x = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "22 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0.95, 0.95, 0.95, 1 };
			text = "gui\data\RscSoundStatus\icon_mute.paa";
		};

	};
};
