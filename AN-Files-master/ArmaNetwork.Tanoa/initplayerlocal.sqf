/*
if(!hasInterface && {!isServer}) exitWith {
	[] call compile PreprocessFileLineNumbers "\life_hc\initHC.sqf";
};
*/
#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 isEqualTo "STRING") then {var2} else {str(var2)})
CONST(BIS_fnc_endMission,BIS_fnc_endMission);
