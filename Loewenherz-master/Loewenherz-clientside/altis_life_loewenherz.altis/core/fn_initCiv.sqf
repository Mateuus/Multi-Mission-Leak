/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian.
*/
private["_spawnPos"];

civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if((lhm_is_arrested isEqualTo 1 && (call lhm_adminlevel) isEqualTo 0) || (lhm_is_arrested isEqualTo 2 && (call lhm_adminlevel) isEqualTo 0)) then
{
	if(lhm_is_arrested isEqualTo 1 ) then
	{
		lhm_is_arrested = 0;
		[player,true] spawn lhm_fnc_jail;

	} else
	{
		lhm_is_arrested = 0;
		[player] spawn lhm_fnc_jailCombatlog;

	};
}
	else
{
	waitUntil {lhm_lastPositionLoaded};
	if((count lhm_lastPosition) > 0) then
	{
		_mkName = "last_spawnpos_marker";
		createMarkerLocal [_mkName, (lhm_lastPosition select 1)];
		lhm_spawn_point = [_mkName, format ["Last Position"], "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];

		player setPos (lhm_lastPosition select 1);
		player setDir (lhm_lastPosition select 0);
		if(([player] call lhm_fnc_playerInBuilding) && (getpos player select 2) < 4) then {
			player setpos [getpos player select 0,getpos player select 1,1.1];
		};

		0 cutText ["locate last position...","BLACK FADED"];
		0 cutFadeOut 3;
	} else {
		[] call lhm_fnc_spawnMenu;
		waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
		waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	};
};

player addRating 9999999;

if((call lhm_adminlevel) > 0) then {
	lhm_is_arrested = 0;
};

{
	_obj = call compile format["T_%1",_x];
	waitUntil {!isnull _obj};
	if((_obj getVariable["Kaeufer",""]) == name player) then {
		LHM_gastations_owned pushBack _obj;
	};
} foreach [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];

if(count(LHM_gastations_owned) > 0) then {
	[] spawn lhm_fnc_LHM_stations_getmoney;
};

if(LHM_Abzeichen != 0) then {
	player setVariable["Abzeichen",LHM_Abzeichen,true];
};