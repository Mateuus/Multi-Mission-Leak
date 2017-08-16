scriptName "radsuit";

#define __filename "radsuit.sqf"

_ownsDependency1 = [life_currentExpPerks, "RadiationSuit"] call mav_ttm_fnc_hasPerk;

if (!_ownsDependency1) then {
	
};