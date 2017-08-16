scriptName "functions_minespeed_1";

#define __filename "functions_minespeed_1.sqf"


_ownsDependency1 = [life_currentExpPerks, "miner_2"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "miner_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency1 && !_ownsDependency2) then {
	mav_ttm_var_minespeedMultiplier = 1.2;
};
