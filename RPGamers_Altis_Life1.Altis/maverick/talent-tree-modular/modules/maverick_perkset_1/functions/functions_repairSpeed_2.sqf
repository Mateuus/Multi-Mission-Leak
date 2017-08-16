scriptName "functions_repairSpeed_2";

#define __filename "functions_repairSpeed_2.sqf"

_ownsDependency = [life_currentExpPerks, "perk_repair_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency) then {
	mav_ttm_var_repairMultiplier = 3;
};