#include <macro.h>
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};
if((GETC(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	uiSleep 35;
};
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)};
waitUntil{isNull (findDisplay 38500)};