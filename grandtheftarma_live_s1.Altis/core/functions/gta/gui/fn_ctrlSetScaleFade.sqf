/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_ctrl", "_fade", "_fadeTime", "_scale", "_scaleTime" ];
disableSerialization;

_ctrl = [ _this, 0, controlNull, [controlNull] ] call GTA_fnc_param;
_fade = [ _this, 1, 0, [0] ] call GTA_fnc_param;
_fadeTime = [ _this, 2, 0, [0] ] call GTA_fnc_param;
_scale = [ _this, 3, 1, [0] ] call GTA_fnc_param;
_scaleTime = [ _this, 4, 0, [0] ] call GTA_fnc_param;

//--- Fade
_ctrl ctrlSetFade _fade;
_ctrl ctrlCommit _fadeTime;

//--- Scale
[ _ctrl, _scale, _scaleTime ] call BIS_fnc_ctrlSetScale;

true
