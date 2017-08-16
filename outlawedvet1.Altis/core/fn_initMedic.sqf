#include "..\script_macros.hpp"
/*
    File: fn_initMedic.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the medic..
*/
private["_end"];
player addRating 99999999;
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if(life_permban) exitWith
{
["PERMBAN",false,true] call BIS_fnc_endMission;
uiSleep 5;
};

if(life_dayban) exitWith
{
["DAYBAN",false,true] call BIS_fnc_endMission;
uiSleep 5;
};

if(life_tempban) exitWith
{
["TEMPBAN",false,true] call BIS_fnc_endMission;
uiSleep 5;
};

if((str(player) in ["medic_6"])) then {
	if(FETCH_CONST(life_mediclevel) < 3) then {
		["MED3NOT",false,true] call BIS_fnc_endMission;
		uiSleep 5;
	};
};

if((str(player) in ["medic_1","medic_2"])) then {
	if(FETCH_CONST(life_donorlevel) < 1) then {
		["NotDonator",false,true] call BIS_fnc_endMission;
		uiSleep 5;
	};
};

if (LIFE_SETTINGS(getNumber,"restrict_medic_weapons") isEqualTo 1) then {
    [] spawn {
        for "_i" from 0 to 1 step 0 do {
            waitUntil {uiSleep 2; currentWeapon player != ""};
            removeAllWeapons player;
        };
    };
};

player setVariable["donrank",(FETCH_CONST(life_donorlevel)),true];
player setVariable["medicrank",(FETCH_CONST(life_mediclevel)),true];
player setVariable["adminrank",(FETCH_CONST(life_adminlevel)),true];
player setVariable["rank",0,true];
player setVariable["swatrank",0,true];
player setVariable["dearank",0,true];
player setVariable["combatlog",life_combatlog,true];

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
} else {
	if (life_combatlog) then {
				life_combatlog = false;
				[player,true] spawn life_fnc_combatlog;
		} else {
			[] call life_fnc_spawnMenu;
			waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
			waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
		};
};
