#include "..\script_macros.hpp"
/*
    File: fn_initCiv.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the civilian.
*/
private["_spawnPos"];
//city_georgetown = nearestObjects[getMarkerPos  "city_georgetown", ["land_Hotel_01_F","land_Hotel_02_F"],250]; 
//city_lijnhaven = nearestObjects[getMarkerPos  "city_lijnhaven", ["land_Hotel_01_F","land_Hotel_02_F","land_Shed_07_F","land_Shed_05_F","land_Shed_03_F"],250]; 
//city_oumere = nearestObjects[getMarkerPos  "city_oumere", ["land_Hotel_01_F","land_Hotel_02_F","land_Shed_07_F","land_Shed_05_F","land_Shed_03_F"],250]; 
//city_la_rochelle = nearestObjects[getMarkerPos  "city_la_rochelle", ["land_Hotel_01_F","land_Hotel_02_F","land_Shed_07_F","land_Shed_05_F","land_Shed_03_F"],250]; 

civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_5 = nearestObjects[getMarkerPos  "civ_spawn_5", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_6 = nearestObjects[getMarkerPos  "civ_spawn_6", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_7 = nearestObjects[getMarkerPos  "civ_spawn_7", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_safe = nearestObjects[getMarkerPos  "civ_spawn_safe", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],200];
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

if((str(player) in ["civ_11","civ_2","civ_3","civ_4","civ_5","civ_6","civ_7","civ_8","civ_9","civ_10"])) then {
	if(FETCH_CONST(life_donorlevel) < 1) then {
		["NotDonator",false,true] call BIS_fnc_endMission;
		uiSleep 5;
	};
};

player setVariable["donrank",(FETCH_CONST(life_donorlevel)),true];
player setVariable["adminrank",(FETCH_CONST(life_adminlevel)),true];
player setVariable["rank",0,true];
player setVariable["swatrank",0,true];
player setVariable["dearank",0,true];
player setVariable["combatlog",life_combatlog,true];

if (life_is_alive && !life_is_arrested && !life_combatlog) then {
    /* Spawn at our last position */
    player setVehiclePosition [life_civ_position, [], 0, "CAN_COLLIDE"];
	playSound "Intro";
} else {
    if (!life_is_alive && !life_is_arrested && !life_combatlog) then {
        if (LIFE_SETTINGS(getNumber,"save_civilian_positionStrict") isEqualTo 1) then {
            _handle = [] spawn life_fnc_civLoadout;
            waitUntil {scriptDone _handle};
            CASH = 0;
            [0] call SOCK_fnc_updatePartial;
        };
        [] call life_fnc_spawnMenu;
        waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
        waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
    } else {
        if (life_is_arrested && !life_combatlog) then {
            life_is_arrested = false;
            [player,true] spawn life_fnc_jail;
        } else {
            life_combatlog = false;
            [player,true] spawn life_fnc_combatlog;
        };
    };
};


//fuck all the detail cop markers off for civie scrubs
{_x setMarkerAlphaLocal 0;} forEach [
"p_car_1","p_car_2","p_bus_1","p_heli_1","p_heli_2","p_boat_1"
];
									
life_is_alive = true;
player addRating 9999999;
