scriptName "fn_startCinematicCam";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_startCinematicCam.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_startCinematicCam.sqf"

if (!hasInterface) exitWith {};

// Close all dialogs
closeDialog 0;

// Create cam
mav_introcam_object = "camera" camCreate (getPos player);
mav_introcam_object cameraEffect ["Internal", "Back"];
mav_introcam_object camSetFOV .65;
mav_introcam_object camSetFocus [2, 1];
mav_introcam_object camCommit 0;

[] spawn {sleep 0.1;showCinemaBorder false};

// Let main script init wait until the player continued
mav_introcam_continue = false;
// In case the player enabled music
playSound "cam_intro";
// Display status bar
9500 cutRsc["maverick_dialog_introcam_status","PLAIN"];

// Load first and start the loop
mav_introcam_scripthandle = [] spawn {
	_time = getNumber(MissionconfigFile >> (format["Maverick_IntroCam_%1", worldName]) >> "Info" >> "secondsPerCam");
	_firstData = (getArray(MissionconfigFile >> (format["Maverick_IntroCam_%1", worldName]) >> "Positions" >> "data")) select 0;

	// Black in screen
	9501 cutRsc["maverick_dialog_introcam_blackin","PLAIN"];

	while {true} do {
		// Load new position
		_newData = [];
		if ((getNumber(MissionconfigFile >> (format["Maverick_IntroCam_%1", worldName]) >> "Info" >> "selectRandom")) == 1) then {
			_newData = (getArray(MissionconfigFile >> (format["Maverick_IntroCam_%1", worldName]) >> "Positions" >> "data")) call BIS_fnc_selectRandom;
		} else {
			if (isNil "mav_introcam_lastindex") then {
				mav_introcam_lastindex = -1;
			};

			mav_introcam_lastindex = mav_introcam_lastindex + 1;
			if (isNil {(getArray(MissionconfigFile >> (format["Maverick_IntroCam_%1", worldName]) >> "Positions" >> "data")) select mav_introcam_lastindex}) then {
				mav_introcam_lastindex = 0;
			};

			_newData = (getArray(MissionconfigFile >> (format["Maverick_IntroCam_%1", worldName]) >> "Positions" >> "data")) select mav_introcam_lastindex;
		};

		mav_introcam_object camSetPos (_newData select 0);
		mav_introcam_object camSetTarget (_newData select 1);
		mav_introcam_object camPreparePos (_newData select 2);
		mav_introcam_object camPrepareTarget (_newData select 3);
		mav_introcam_object camsetFocus [(_newData select 4),0.7];
		mav_introcam_object camCommit 0;
		showCinemaBorder false;
		mav_introcam_object camCommitPrepared (_time);
		sleep (_time - 4);
		9501 cutRsc["maverick_dialog_introcam_transition","PLAIN"];
		sleep 4;
	};
};