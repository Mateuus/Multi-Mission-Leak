scriptName "functions_farmspeed_1";

#define __filename "functions_farmspeed_1.sqf"


_ownsDependency1 = [life_currentExpPerks, "farmer_2"] call mav_ttm_fnc_hasPerk;
_ownsDependency2 = [life_currentExpPerks, "farmer_3"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency1 && !_ownsDependency2) then {
	mav_ttm_var_farmspeedMultiplier = 2;
};
