// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_lastAutosave"];

_lastAutosave = time;
while {true} do {

    sleep 1;
    if( time - XY_lastSave > 600 && { time - _lastAutosave > 900 } ) then {

        _lastAutosave = time;
        [] call XY_fnc_updateRequest;
    };

    if( XY_forceSaveTime > 0 && { time >= XY_forceSaveTime } ) then {

        XY_forceSaveTime = 0;
        [1] call XY_fnc_updatePartial;
    };
};