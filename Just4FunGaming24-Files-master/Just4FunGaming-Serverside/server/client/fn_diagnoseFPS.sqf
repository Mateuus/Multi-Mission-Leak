// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

scriptName "XY_fnc_diagnoseFPS";
uisleep 30;

private _i = 0;
private _samples = [];
private _maxSamples = 30;
private _nextReport = time + 300;

while { true } do {

    uisleep 1;

    _samples set [_i, diag_fps];
    _i = _i + 1;

    if( _i >= _maxSamples ) then {
        _i = 0;
    };

    private _avgFPS = 0;
    {
        _avgFPS = _avgFPS + _x;
    } forEach _samples;

    _avgFPS = round(_avgFPS / _maxSamples);

    if( _nextReport < time ) then {
        _nextReport = time + 300;
		[ player, _avgFPS ] remoteExec [ "XYDB_fnc_fpsLog", XYDB ];
    };
};