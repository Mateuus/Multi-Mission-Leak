scriptName "fn_updateCinematicStatus";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_updateCinematicStatus.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_updateCinematicStatus.sqf"

if (!hasInterface) exitWith {};

// Parameters
_mode = param[0,0,[0]];
_text = param[1,"",[""]];

// Exceptions
disableSerialization;

// Thanks arma..
0 cutFadeOut 0;

// Code
if (_mode == 1) then {
	mav_introcam_keyhandler = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 57) then {
		[] spawn mav_introcam_fnc_finishCinematicCam;
		(findDisplay 46) displayRemoveEventHandler ['KeyDown',mav_introcam_keyhandler];
		terminate mav_introcam_scripthandle;
	};"];
};
_ctrl = (uiNamespace getVariable "maverick_introcam_statuslabel") displayCtrl 0;
if (!isNil "_ctrl") then {
	_ctrl ctrlSetText _text;
};