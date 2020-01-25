#include <macro.h>
/*
	File: fn_initCop.sqf
	
	
	Description:
	Cop Initialization file.
*/

// TFR Variables API
tf_no_auto_long_range_radio = true; 
player setVariable ["copLevel",1,true]; 
TF_terrain_interception_coefficient = 1;

private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	uiSleep 30;
};

if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	uiSleep 35;
};
command = false;
if(__GETC__(life_coplevel) > 5) then {
	command = true;
};
player setVariable["rank",(__GETC__(life_coplevel)),true];

if(life_is_arrested) then
{
	jail_money_init = false;
	[false,false,life_arrestMinutes,life_arrestReason] call life_fnc_jailSetup;
} else {
	jail_money_init = true;
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};

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


player setUnitRecoilCoefficient 2.8;
uiSleep 2;
["EMS FREQ: 33.1 / CO FREQ: 33.2 / POLICE FREQ: 33.3 / EMS D: 33.5", false] spawn domsg;

player unassignItem "tf_fadak_1";
player removeItem "tf_fadak_1";

player removeitem "tf_rf7800str";
player unassignItem "tf_rf7800str";

player removeitem "tf_anprc152";
player unassignItem "tf_anprc152";

player additem "tf_anprc152";
player assignitem "tf_anprc152";
