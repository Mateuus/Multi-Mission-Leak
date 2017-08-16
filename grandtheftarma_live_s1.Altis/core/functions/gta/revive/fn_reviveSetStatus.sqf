/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_unit", "_status"];
_unit = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_status = [_this, 1, "", [""]] call GTA_fnc_param;
_status = toUpper _status;

//--- Error checks
if (isNull _unit) exitWith {false};
if !(_status in ["KILLED", "ALIVE", "INCAPACITATED"]) exitWith {false};

if (_status in ["KILLED", "INCAPACITATED"]) then {
	//--- Set incapacitated
	_unit setVariable ["incapacitated", true, isServer];

	if (_status == "INCAPACITATED") then {
		//--- Add unit to revive array
		GTA_revive_units = GTA_revive_units + [_unit];
	};
} else {
	//--- Set incapacitated
	_unit setVariable ["incapacitated", false, isServer];

	//--- Remove unit from revive array
	GTA_revive_units = GTA_revive_units - [_unit];
};

if (isServer) then {
	publicVariable "GTA_revive_units";
} else {
	//--- Sync
	[[_unit, _status], _fnc_scriptName, false] call GTA_fnc_remoteExec;
};
