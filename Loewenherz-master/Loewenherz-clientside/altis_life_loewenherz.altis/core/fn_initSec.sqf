#include <macro.h>
/*
	File: fn_initSec.sqf
	Author: Blackd0g

	Description:
	Security Initialization file.
*/
private["_end","_mkName"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;

if((__GETC__(lhm_seclevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call LHM_fnc_endMission;
	sleep 35;
};

player setVariable["ranksec",(__GETC__(lhm_seclevel)),true];
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
	((uinamespace getvariable "BIS_dynamicText") displayctrl 9999) ctrlsetfade 1;
	((uinamespace getvariable "BIS_dynamicText") displayctrl 9999) ctrlcommit 0;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

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