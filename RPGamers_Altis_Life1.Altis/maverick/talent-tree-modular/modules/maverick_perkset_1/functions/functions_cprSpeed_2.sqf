scriptName "functions_cprSpeed_2";

#define __filename "functions_cprSpeed_2.sqf"

_ownsDependency = [life_currentExpPerks, "perk_cpr_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency) then {
	mav_ttm_var_cprMultiplier = 2;
};