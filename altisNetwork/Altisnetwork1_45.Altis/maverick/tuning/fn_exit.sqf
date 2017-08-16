scriptName "fn_exit";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_exit.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_exit.sqf"

_veh = vehicle player;
_position = mav_tuning_originalPosition findEmptyPosition [0,150,typeOf _veh];

closeDialog 0;

// Load data
[(vehicle player) getVariable ["mav_tuning",[]], vehicle player] spawn mav_tuning_fnc_loadVehicleModification;

// Sleeperino
5000 cutRsc ["maverick_dialog_tuning_leaveentertransition","PLAIN"];
sleep 4;

//
_veh setPos _position;

mav_tuning_object cameraEffect ["TERMINATE","BACK"];
camDestroy mav_tuning_object;
player switchCamera "INTERNAL";

// Delete building and stuff
[vehicle player,true] remoteExec ["mav_tuning_fnc_hide",2];
deleteVehicle mav_tuning_building;

if (!isNil "mav_tuning_nightlight") then {
	deleteVehicle mav_tuning_nightlight;
};

// Save vehicle to DB
[_veh getVariable "vehicleID", _veh getVariable ["mav_tuning",[]]] remoteExec ["mav_tuning_fnc_saveTuningToDB",2];

// Show chat
showChat true;