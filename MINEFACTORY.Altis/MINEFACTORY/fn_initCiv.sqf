#include "..\script_macros.hpp"
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian.
*/
private["_spawnPos"];
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if(!license_civ_Eingeburgert) then
{
	[] spawn life_fnc_ErsterText;

	//Hallo invictus-load ;) 
	[] spawn {
        while {true} do {
        	removeAllActions player;
			[] call life_fnc_setupActions;
        	sleep 2.5;
        };
	}; 
} else {
	if(life_is_alive && !life_is_arrested) then {
		/* Spawn at our last position */
		player setPosWorld life_civ_position;
	} else {
		if(!life_is_alive && !life_is_arrested) then {
			if(EQUAL(LIFE_SETTINGS(getNumber,"save_civ_positionStrict"),1)) then {
				_handle = [] spawn life_fnc_civLoadout;
				waitUntil {scriptDone _handle}; CASH = 0;
			};
			[] call life_fnc_spawnMenu;
			waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
			waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
		} else {
			if(life_is_arrested) then {
				life_is_arrested = false;
				[player,true] spawn life_fnc_jail;
			};
		};
	};
};
life_is_alive = true;
player addRating 9999999;

//License Plates 
if(license_civ_donator && playerSide == civilian) then {
	[] execVM "MINEFACTORY\Nummernschild\createlicenseplate.sqf";
	[] execVM "MINEFACTORY\Nummernschild\licenseplateset.sqf";
	[] execVM "MINEFACTORY\Nummernschild\loadlicenseplates.sqf";
};

[player, uniform player] call life_fnc_equipGear;