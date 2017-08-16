#include "..\script_macros.hpp"
/*
	File: fn_initArmer.sqf
	Author: BlackScaryZ

	Description:
	Ininialisation de l'armer
*/
private "_end";
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;



	if((FETCH_CONST(life_armerlevel) == 0) && (FETCH_CONST(life_adminlevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};

{_x setMarkerAlphaLocal 0} forEach [
			"heroin_area",
			"heroin_1",
			"cocaine_1",
			"weed_1",
			"cocaine_processing",
			"heroin_p",
			"weed_p_1",
			"weed_area",
			"crack_processing",
			"cocaine processing",
			"Dealer_1",
			"Dealer_2",
			"Gen_3_1_5",
			"Dealer_1_1",
			"gold_bar_dealer",
			"coke_area",
			"gang_1_1",
			"gang_1","gang_2","gang_3","gang_4",
			"chop_shop_1","chop_shop_2","chop_shop_3","chop_shop_4",
			"rebelzone1_1","reb_spawn",
			"gang_6",
			"Paper_p_4",
			"Paper_3",
			"Dealer_1_1",
			"Dealer_1_2"
];


0 enableChannel false;
1 enableChannel false;
2 enableChannel false;

switch (FETCH_CONST(life_armerlevel)) do {
	case 1: {life_paycheck = 30000;}; // Rank 1
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
