scriptName "functions_farmspeed_2";

#define __filename "functions_farmspeed_2.sqf"

_ownsDependency = [life_currentExpPerks, "farmer_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency) then {
	mav_ttm_var_farmspeedMultiplier = 4;
};