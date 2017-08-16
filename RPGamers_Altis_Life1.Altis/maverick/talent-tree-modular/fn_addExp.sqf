scriptName "fn_addExp";
/*--------------------------------------------------------------------
    Author: Maverick (ofpectag: MAV)
    File: fn_addExp.sqf

    <Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_addExp.sqf"

params [
    ["_action", "", [""]]
];

scopeName "main";

private _baseConfig = missionConfigFile >> "Maverick_TTM";
private _actionConfig = _baseConfig >> "Actions" >> _action;
private _expGained = getNumber (_actionConfig >> "expToAdd");
private _messageEntry = _actionConfig >> "message";
private _message = getText _messageEntry;
private _level = life_currentExpLevel;
private _levelConfigBase = _baseConfig >> "Levels";
private _currentExpLevelConfig = _levelConfigBase >> format["Level_%1", life_currentExpLevel];
private _nextLevelConfig = _levelConfigBase >> format["Level_%1", _level + 1];

// Max level
if (!isClass _nextLevelConfig) exitWith {};

private _nextLevelExp =  getNumber (_nextLevelConfig >> "expRequired");
private _nextLevelPerkPoints =  getNumber (_nextLevelConfig >> "perkPointsOnUnlock");
private _dif = _expGained;
private _gainedPerkPoints = 0;
private _iteratedExp = life_currentExp;
private _progressData = [];

while {_dif > 0} do {

    scopeName "iteration";

    private "_iteratedLevelExp";
    private "_iteratedPerkPoints";
    private "_iteratedLevelConfig";
    private "_iteratedCurrentConfig";
    if !(_level isEqualTo life_currentExpLevel) then {
        _iteratedLevelConfig = _levelConfigBase >> format["Level_%1", (_level + 1)];
        if (!isClass _iteratedLevelConfig) then {
            //Must be max level
            hint "Trying to break out..";
            breakOut "iteration";
        };
        _iteratedLevelExp =  getNumber (_iteratedLevelConfig >> "expRequired");
        _iteratedPerkPoints =  getNumber (_iteratedLevelConfig >> "perkPointsOnUnlock");
        _iteratedCurrentConfig = _levelConfigBase >> format["Level_%1", _level];
    } else {
        _iteratedLevelConfig = _nextLevelConfig;
        _iteratedLevelExp = _nextLevelExp;
        _iteratedPerkPoints = _nextLevelPerkPoints;
        _iteratedCurrentConfig = _currentExpLevelConfig;
    };

    private _expGap = _iteratedLevelExp - _iteratedExp;
    _dif = _dif - _expGap;

    if (_dif < 0) exitWith {
        _progressData pushBack [_iteratedCurrentConfig, _iteratedLevelConfig, _iteratedExp, _dif + _expGap, false];
    };

    _level = _level + 1;
    _gainedPerkPoints = _gainedPerkPoints + _iteratedPerkPoints;

    _progressData pushBack [_iteratedCurrentConfig, _iteratedLevelConfig, _iteratedExp, _expGap, true];

    if (_dif isEqualTo 0) exitWith {};

    _iteratedExp = _iteratedLevelExp;
};

life_currentExpLevel = _level;
life_currentExp = life_currentExp + _expGained;
life_currentPerkPoints = life_currentPerkPoints + _gainedPerkPoints;

// -- Save to the database
[0] call mav_ttm_fnc_clientSendUpdateToServer;
[1] call mav_ttm_fnc_clientSendUpdateToServer;
[2] call mav_ttm_fnc_clientSendUpdateToServer;
[3] call mav_ttm_fnc_clientSendUpdateToServer;

// -- Display
[_progressData, _message] spawn TTM_GUI_function_experienceAdded;