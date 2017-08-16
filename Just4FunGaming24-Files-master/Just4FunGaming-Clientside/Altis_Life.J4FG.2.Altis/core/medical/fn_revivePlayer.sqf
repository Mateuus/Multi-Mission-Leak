// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
private["_target","_revivable","_targetName","_duration","_ui","_progress","_progressText","_cp","_startTime","_timeOut","_interrupted","_animTarget"];

_target = [ _this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;

if(isNull _target) exitWith {};

_revivable = _target getVariable["revive",false];
if(_revivable) exitWith {};
if(_target getVariable ["reviving",ObjNull] == player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
if(player distance _target > 5) exitWith {}; //Not close enough.

XY_interrupted = false;
XY_actionInUse = true;
_target setVariable["reviving", player, true];

disableSerialization;
_duration = 30;

_cp = 0;
_startTime = time;
_timeOut = _startTime + _duration;
_animTarget = time;
_interrupted = true;

5 cutRsc ["XY_progressBar", "PLAIN"];
_ui = uiNamespace getVariable "XY_progressBar";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;

_animCounter = 0;
while { alive player && !XY_isTazed && !XY_interrupted && !(player getVariable["restrained", false]) && !(_target getVariable["revive", false]) && _target getVariable["reviving", ObjNull] == player } do {

    if( _animTarget <= time ) then {
        _animTarget = time + 2;
        [player, "AinvPknlMstpSnonWnonDnon_medic_1"] remoteExec ["XY_fnc_animSync", -2];
    };

    _cp = (time - _startTime) / (_timeOut - _startTime);
    _progressBar progressSetPosition _cp;
    _titleText ctrlSetText format[ "%1 (%2%3)", localize "STR_Medic_Progress", round(_cp * 100), "%" ];

    if( _cp >= 1 ) exitWith {
        _interrupted = false;
    };
    uisleep 0.25;
};

5 cutText ["", "PLAIN"];

XY_interrupted = false;
XY_actionInUse = false;

private _targetName = _target getVariable ["realName", "ERROR"];
private _targetUID = _target getVariable ["steam64ID", "ERROR"];

[getPlayerUID player, 22, format ["Wiederbelebung von %1 (%2) @ %3", _targetName, _targetUID, mapGridPosition player ]] remoteExec ["XYDB_fnc_log", XYDB];
[_targetUID, 22, format ["Wiederbelebt von %1 (%2) @ %3", profileName, getPlayerUID player, mapGridPosition player ]] remoteExec ["XYDB_fnc_log", XYDB];

_target setVariable["reviving", nil, true];

if( _interrupted ) exitWith {
    if( _target getVariable["revive", false] ) then {
        hint localize "STR_Medic_RevivedRespawned"
    } else {
        hint localize "STR_NOTF_ActionCancel";
    };
};

switch (playerSide) do {
    case west: {
        player removeItem "MediKit";
    };
    case civilian: {
        player removeItem "MediKit";
    };
    case independent: {
    };
	case east: {
	    player removeItem "MediKit";
    };	
};


_target setVariable["revive", true, true];

if( playerSide == independent ) then {
    XY_CA = XY_CA + 25000;
    hint "Du hast 25,000€ für deine Hilfe erhalten";
};

[profileName] remoteExec ["XY_fnc_revived", _target];