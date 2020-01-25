#include <macro.h>
/*
	File: fn_initMedic.sqf
	
	
	Description:
	Initializes the medic..
*/

// TFR Variables API
tf_no_auto_long_range_radio = true; 

TF_terrain_interception_coefficient = 1;
player setVariable ["copLevel",1,true];

private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};



if((__GETC__(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	uiSleep 35;
};

[] call life_fnc_spawnMenu;
//[] execVM "core\welcomemedic.sqf";
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

if(life_karma > 999) then {
	karma_level = life_karma / 400;
	karma_level = floor (karma_level);
} else {
	karma_level = 0;	
};

if(karma_level > 80) then {
	karma_level = 80;
};
[format["Masz %1 poziom reputacji!",karma_level], false] spawn domsg;

uiSleep 2;
["EMS FREQ: 33.1 / CO FREQ: 33.2 / POLICE FREQ: 33.3 / EMS D: 33.5", false] spawn domsg;
