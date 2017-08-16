#include "script_macros.hpp"
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/


private["_spawnPos","_marker"];

if (CurrentMode == "Altis") then {

	civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
	civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
	civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
	civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];

};
waitUntil {!(isNull (findDisplay 46))};

if(str(player) in ["civ_86","civ_87","civ_88","civ_89","civ_90","civ_91","civ_92","civ_93","civ_94","civ_95","civ_96","civ_97","civ_98","civ_99","civ_100","civ_101","civ_102","civ_103","civ_104","civ_105"]) then {
	if((FETCH_CONST(ES_donator) < 1) && (FETCH_CONST(ES_adminlevel) == 0)) then {
		player enableSimulation false;
		["NotPremium",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

if(ES_is_arrested) then {
	ES_is_arrested = false;
	[player,true] spawn ES_fnc_jail;
} else {
	[] call ES_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};

(finddisplay 46) displayAddEventHandler ["MouseButtonDown",{if(dialog)exitWith{};if(_this select 1!=0)exitWith{};if(ES_siren_active)exitWith{};if(visibleMap)exitWith{};if(isNull(objectParent player))exitWith{};if((driver(objectParent player))!=player)exitWith{};if(((objectParent player)getVariable["Horn",0])<1)exitWith{};switch(((objectParent player)getVariable["Horn",0]))do{case 1:{[]spawn{ES_siren_active=true;sleep 15;ES_siren_active=false};[(vehicle player),"hlacucaracha"]remoteExec["ES_fnc_say3D",0]};case 2:{[]spawn{ES_siren_active=true;sleep 15;ES_siren_active=false};[(vehicle player),"hmel"]remoteExec["ES_fnc_say3D",0]}};false}];

player addRating 9999999; 

[] spawn ES_fnc_IgiLoadcivInit;
[] spawn ES_fnc_fastrope;

save_veh_gear = false;