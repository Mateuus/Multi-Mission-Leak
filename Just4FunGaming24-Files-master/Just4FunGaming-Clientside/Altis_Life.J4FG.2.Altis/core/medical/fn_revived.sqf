// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
private["_medic", "_dir", "_pos"];

_medic = [ _this, 0, "Unknown Medic", [""]] call BIS_fnc_param;

// Kupferkarpfen: Workaround for strange bug that executes this function on the server...
if( isNil("XY_corpse") ) exitWith {
    diag_log("fn_revived had null corpse?");
};

_oldGear = [XY_corpse] call XY_fnc_fetchDeadGear;
[_oldGear] spawn XY_fnc_loadDeadGear;

_dir = getDir XY_corpse;
_pos = visiblePositionASL XY_corpse;
deleteVehicle XY_corpse;
XY_corpse = nil;

closeDialog 0;

XY_deathCamera cameraEffect ["TERMINATE", "BACK"];
camDestroy XY_deathCamera;

// Bring me back to life
player setDir _dir;
player setPosASL _pos;

// Set damage so the player requires painkillers from the medic
player setDamage 0.15 + (random 0.1);

player setVariable["revive", nil, true];
player setVariable["name", nil, true];
player setVariable["reviving", nil, true];

[1] call XY_fnc_updatePartial;

[ _medic ] spawn {
    sleep 4;
    hint format[ "Du wurdest von %1 reanimiert, bitte gebe dem Sanitäter eine angemessene Spende", _this select 0 ];
};

if( XY_hudON ) then {
    2 cutRsc ["XY_HUD", "PLAIN", 4, false];
};