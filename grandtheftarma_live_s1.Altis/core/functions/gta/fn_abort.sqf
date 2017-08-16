/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

with missionNamespace do {

	[ "Aborting..." ] call GTA_fnc_log;

	//--- Get highlight colour
	_colorHighlight = [ "GUI", "BCG_RGB" ] call BIS_fnc_displayColorGet;
	_colorHighlight = _colorHighlight call GTA_fnc_colorRGBtoHTML;

	//--- Give the player immunity
	player allowDamage false;

	//--- Disable user input
	disableUserInput true;

	//--- Hide chat
	showChat false;

	//--- Hide hint
	hint "";

	//--- Disable name tags
	[false] call GTA_fnc_nameTags;

	//--- Fade volume
	1 fadeSound 0;
	1 fadeMusic 0;
	1 fadeRadio 0;
	1 fadeSpeech 0;

	//--- Sync user data
	[] call GTA_fnc_updatePlayer;

	//--- Fade screen
	cutText [ "", "BLACK", 1 ];
	sleep 1;

	//--- Show sync screen
	_effectID = 1 + floor random 3;
	_videoFile = "A3\Missions_F_Bootcamp\video\VR_GenericTransition_" + str _effectID + ".ogv";
	_video = [ _videoFile ] spawn BIS_fnc_playVideo;
	playSound ( "Transition" + str _effectID );
	sleep 1;
	0 = [ format [ "<br/><t color='%4'>%3</t><br/><br/><t size='0.7'>%1 %2.</t>", "We hope to see you again soon", profileName, "SYNCING DATA WITH SERVER", _colorHighlight ], 0, 0.2, 2, 0.5, 0, 1000 ] spawn BIS_fnc_dynamicText;

	//--- Check if player has not been arrested
	if !( life_is_gta_arrested ) then {

		//--- Move the player
		//player setPos ( getMarkerPos "abort" );

	};

	//--- Lobby log
	[ [ 0, [ "STR_GTA_MISC_DISCONNECTED_LOBBY", profileName ] ], "GTA_fnc_broadcast" ] call GTA_fnc_remoteExec;

	sleep 4;

	//--- Enable user input
	disableUserInput false;

	//--- Re-enable chat
	showChat true;

	//--- Abort the mission
	[ "Abort", true, false ] call BIS_fnc_endMission;

	[ "Aborted." ] call GTA_fnc_log;

};
