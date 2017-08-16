scriptName "functions_minespeed_2";

#define __filename "functions_minespeed_2.sqf"

_ownsDependency = [life_currentExpPerks, "miner_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency) then {
	mav_ttm_var_minespeedMultiplier = 2.0;
};