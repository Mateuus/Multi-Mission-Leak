scriptName "fn_finishCinematicCam";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_finishCinematicCam.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_finishCinematicCam.sqf"
_intro = ASLToAGL [0,0,0] nearestObject "#soundonvehicle";

if (!hasInterface) exitWith {};

9500 cutRsc ['Default','PLAIN'];
9501 cutRsc ['maverick_dialog_introcam_blackout','PLAIN'];

if (getNumber(MissionconfigFile >> (format["Maverick_IntroCam_%1", worldName]) >> "Info" >> "music") == 1) then {
	5 fadeMusic 0;
};

sleep 5;
mav_introcam_continue = true;
mav_introcam_object cameraEffect ["TERMINATE","BACK"];
camDestroy mav_introcam_object;
player switchCamera "INTERNAL";
5 fadeSound 0;
sleep 5;
deleteVehicle _intro;
switch (profileNamespace getVariable["Earplugs",0]) do {
	case 0: {hintSilent "Ear Plugs 90%"; 1 fadeSound 0.1; profileNamespace setVariable ["Earplugs", 10]; };
	case 10: {hintSilent "Ear Plugs 60%"; 1 fadeSound 0.4; profileNamespace setVariable ["Earplugs", 40]; };
	case 40: {hintSilent "Ear Plugs 30%"; 1 fadeSound 0.7; profileNamespace setVariable ["Earplugs", 70]; };
	case 70: {hintSilent "Ear Plugs Removed"; 1 fadeSound 1; profileNamespace setVariable ["Earplugs", 0]; };
};