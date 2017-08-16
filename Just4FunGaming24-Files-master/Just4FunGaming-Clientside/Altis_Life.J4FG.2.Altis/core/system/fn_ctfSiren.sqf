// CTF start module
// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_flagpole", "_city"];

_flagpole = [ _this, 0, ObjNull, [ObjNull] ] call BIS_fnc_param;
_city =     [ _this, 3, "",      [""]      ] call BIS_fnc_param;

if( isNull _flagpole || _city == "" ) exitWith {};

if( playerSide != west ) exitWith {};

if( XY_actionInUse ) exitWith {};
XY_actionInUse = true;

// Send CTF request to server...
[player, _flagpole, "start", _city] remoteExec ["XY_fnc_ctf", 2];

sleep 2;
XY_actionInUse = false;