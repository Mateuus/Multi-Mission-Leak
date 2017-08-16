#include "script_macros.hpp"
/*
	File: initPlayerLocal.sqf
	Author:

	Description:
	Starts the initialization of the player.
*/
if (!hasInterface && !isServer) exitWith {
	[] call compile PreprocessFileLineNumbers "\life_hc\initHC.sqf";
}; //This is a headless client.

#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)

CONST(BIS_fnc_endMission,BIS_fnc_endMission);
if(EQUAL(LIFE_SETTINGS(getNumber,"spyglass_init"),1)) then {[] execVM "SpyGlass\fn_initSpy.sqf";};

[] execVM "core\init.sqf";

//Paintball Spawns
pb_positionen = [[20999.7,19287.6,0.00143814],[20941.2,19322.9,0.0014782],[20918.2,19179.9,0.00142956],[20877.8,19306.1,0.00169849],[20873,19273.3,0.00144196],[20888.9,19227.3,0.00144196]];
joinmode = 0;

// disable random radio chatter
enableRadio false;
enableSentences false;