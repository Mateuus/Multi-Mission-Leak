#include <macro.h>
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if((str(player) in ["adac_1","adac_2","adac_3","adac_4","adac_5"])) then {
	if((GETC(life_adaclevel) == 0) && (GETC(bitch_level) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		uiSleep 35;
	};
};
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)};
waitUntil{isNull (findDisplay 38500)};
player SVAR["adaclevel", GETC(life_adaclevel), true];
player SVAR["adminlevel", GETC(bitch_level), true];