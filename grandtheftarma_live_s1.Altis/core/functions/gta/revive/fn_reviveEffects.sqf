/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

disableSerialization;
private ["_enable", "_display", "_keyDownEH", "_keyUpEH"];
_enable = [_this, 0, true, [true]] call GTA_fnc_param;
_display = [] call BIS_fnc_displayMission;

//--- Error checks
if (!isNil "GTA_fnc_reviveEffects_enabled" && {GTA_fnc_reviveEffects_enabled isEqualTo _enable}) exitWith {};
GTA_fnc_reviveEffects_enabled = _enable;

if (_enable) then {
	//--- Create PP effects
	if (isNil "GTA_revive_ppColor") then {GTA_revive_ppColor = ppEffectCreate ["ColorCorrections", 1632]};
	if (isNil "GTA_revive_ppBlur") then {GTA_revive_ppBlur = ppEffectCreate ["DynamicBlur", 525]};
	if (isNil "GTA_revive_ppAber") then {GTA_revive_ppAber = ppEffectCreate ["ChromAberration", 125]};

	//--- Adjust PP effects
	GTA_revive_ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]];
	GTA_revive_ppBlur ppEffectAdjust [3];
	GTA_revive_ppAber ppEffectAdjust [0.01, 0.01, true];

	//--- Commit and enable PP effects
	{_x ppEffectCommit 0; _x ppEffectEnable true} forEach [GTA_revive_ppColor, GTA_revive_ppBlur, GTA_revive_ppAber];
} else {
	//--- Disable PP effects
	{_x ppEffectEnable false} forEach [GTA_revive_ppColor, GTA_revive_ppBlur, GTA_revive_ppAber];
};
