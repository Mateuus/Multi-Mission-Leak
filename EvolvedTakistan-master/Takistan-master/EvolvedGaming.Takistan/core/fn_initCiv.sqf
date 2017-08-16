/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/

// TFR Variables API
tf_no_auto_long_range_radio = true; 

TF_terrain_interception_coefficient = 1;

private["_spawnPos"];
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_House_C_10_EP1","Land_House_C_9_EP1","Land_House_C_3_EP1","Land_House_C_11_EP1"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_House_C_10_EP1","Land_House_C_9_EP1","Land_House_C_3_EP1","Land_House_C_11_EP1"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_House_C_10_EP1","Land_House_C_9_EP1","Land_House_C_3_EP1","Land_House_C_11_EP1"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_House_L_4_EP1","Land_House_L_6_EP1"],250];
reb_spawn_1 = nearestObjects[getMarkerPos  "reb_spawn_1", ["Land_House_C_10_EP1","Land_House_C_9_EP1","Land_House_C_3_EP1","Land_House_C_11_EP1"],250];
waitUntil {!(isNull (findDisplay 46))};

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
	else
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};
player addRating 9999999;
