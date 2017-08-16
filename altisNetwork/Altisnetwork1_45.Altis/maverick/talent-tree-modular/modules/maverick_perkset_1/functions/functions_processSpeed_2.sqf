scriptName "functions_processSpeed_2";

#define __filename "functions_processSpeed_2.sqf"

_ownsDependency = [life_currentExpPerks, "perk_processing_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency) then {
	mav_ttm_var_processMultiplier = 2;
};