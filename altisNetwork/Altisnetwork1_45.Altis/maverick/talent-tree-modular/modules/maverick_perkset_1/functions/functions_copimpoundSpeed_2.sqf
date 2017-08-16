scriptName "functions_copimpoundSpeed_2";

#define __filename "functions_copimpoundSpeed_2.sqf"

_ownsDependency = [life_currentExpPerks, "perk_CopImpounding_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency) then {
	mav_ttm_var_copimpoundingMultiplier = 10;
};