/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian.
*/
private["_spawnPos","_lastPos"];
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],100];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if(life_is_arrested) then {
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
} else {
	rulesok = false;
	if(!createDialog "agb") exitWith {};
	waitUntil{!isNull (findDisplay 32154)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 32154)}; //Wait for the spawn selection to be done.
	if(!rulesok)then {
		player enableSimulation false;
		["Aborted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
	rulesok = false;
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};
[0] call life_fnc_updateEXP;
player addRating 9999999;
[] spawn {
	while{true} do {
		sleep(10*60);
		life_civTime = life_civTime + 1;
		civ_position = getPos player;[9] call SOCK_fnc_updatePartial;
	};
};

dokeyCheck={	private ["_r"] ;	_r = false ; 	if ((_this select 1) in (actionKeys "TacticalView")) then {		hint "Commandermodus deaktiviert" ;		_r=true;	};  _r;} ;(FindDisplay 46) displaySetEventHandler [     "keydown",     "_this call dokeyCheck"     ];