 /*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Cop Initialization file.
*/

life_maxTalents = 20;
if (life_coplevel > 2) then { life_maxTalents = life_maxTalents + (2 * (life_coplevel - 2)); };

player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
[] spawn life_fnc_trackMarkers;

if(life_blacklisted) exitWith
{
	["NotWhitelisted",false,false] call BIS_fnc_endMission;
};

life_track_radius = switch (true) do
{
	case (8 in life_coptalents): { 200 };
	case (7 in life_coptalents): { 300 };
	case (6 in life_coptalents): { 400 };
	case (5 in life_coptalents): { 500 };
	case (4 in life_coptalents): { 800 };
	case (3 in life_coptalents): { 900 };
	case (2 in life_coptalents): { 1000 };
	default { 1400 };
};

life_maxWeight = 90;

switch (true) do
{
	case (str(player) == "Swat_comm"):
	{
		if(life_swatlevel == 3) then {
			player setVariable["swatlevel", 3, true]; // for showing rank, etc
		} else {
			endMission "Loser";
		};
	};

	case (str(player) in ["Swat_rifle","Swat_supp","Swat_med"]):
	{
		_found = false; { if (str _x == "Swat_comm") then { _found = true; }; } foreach allPlayers;
		if((_found && life_swatlevel >= 1) || life_swatlevel == 3) then {
			player setVariable["swatlevel", 1, true]; // for showing rank, etc
		} else {
			["NotWhitelisted",false,false] call BIS_fnc_endMission;
		};
	};

	case (str(player) == "Swat_mark"):
	{
		_found = false; { if (str _x == "Swat_comm") then { _found = true; }; } foreach allPlayers;
		if((_found && life_swatlevel >= 2) || life_swatlevel == 3) then {
			player setVariable["swatlevel", 2, true]; // for showing rank, etc
		} else {
			["NotWhitelisted",false,false] call BIS_fnc_endMission;
		};
	};

	default
	{
		switch (true) do
		{
			case (life_coplevel > 0) : {}; // Do nothing
			case (life_adminlevel > 0) : {}; //Do nothing
			default {["NotWhitelisted",false,false] call BIS_fnc_endMission;};
		};
	};
};

if ((str(player) in ["cop_warrant_1","cop_warrant_2","cop_warrant_3","cop_warrant_4","cop_warrant_5","cop_drug_1","cop_drug_2","cop_drug_3","cop_drug_4","cop_medic_1","cop_medic_2","cop_medic_3","cop_medic_4","cop_detective_1","cop_detective_2","cop_detective_3"]) && (life_coplevel < 3 || !life_precinct)) then
{
	["NotWhitelisted",false,false] call BIS_fnc_endMission;
};

player setVariable["copLevel", life_coplevel, true]; // for showing rank, etc
//if(life_coplevel > 2) then {player setVariable ["swatlevel",1,true]};
//[[25, player, format["Initialized as cop of rank %1", life_coplevel]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] call life_fnc_equipGear;