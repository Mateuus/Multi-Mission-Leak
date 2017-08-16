#include "..\script_macros.hpp"

private["_spawnPos"];

if(str(player) in ["civ_224","civ_223","civ_222","civ_221","civ_216","civ_217","civ_218","civ_219","civ_220","civ_212","civ_210","civ_213","civ_214","civ_215","civ_211","civ_208","civ_209","civ_206","civ_207","civ_205","civ_204","civ_203","civ_202","civ_201","civ_200"]) then {
	if((FETCH_CONST(life_donator) < 1) && (FETCH_CONST(life_adminlevel) == 0)) then {
		player enableSimulation false;
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if(life_is_arrested) then {
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
} else {
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)};
	waitUntil{isNull (findDisplay 38500)};
};

0 enableChannel false;
1 enableChannel false;
2 enableChannel false;

player addRating 9999999;

if(life_job > 0) then {
	_igiload = execVM "IgiLoad\IgiLoadInit.sqf";
	[] spawn life_fnc_placeablesInit;
};

[] call life_fnc_skin;