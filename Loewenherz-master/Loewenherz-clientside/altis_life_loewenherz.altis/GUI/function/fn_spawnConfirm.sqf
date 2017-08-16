/*
	File: fn_spawnConfirm.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Spawns the player where he selected.
*/
private["_spCfg","_sp","_spawnPos","_isPlayerHouse","_isDonator","_donatorlevel"];
_isPlayerHouse = false;
_donatorlevel = (player getVariable ["LHM_Donatorlevel",0]);
if (!((typeName _donatorlevel) == "SCALAR")) then {
_donatorlevel = (parseNumber _donatorlevel);
};
diag_log format["Donator Status confirmed. Level %1 clearance!",_donatorlevel];
_isDonator = (_donatorlevel > 0);
if (!((count lhm_spawn_point) == 0)) then
{
	_isPlayerHouse = ((lhm_spawn_point select 0) in ["house_1","house_2","house_3","house_4","house_5","house_6","house_7","house_8","house_9","house_10","house_11","house_12","house_13","house_14","house_15","house_16","house_17","house_18","house_19"]);
};	
if (_isPlayerHouse && !_isDonator) exitWith {
	[] spawn {
		sleep 0.1; // important to use hintC function
		"Donator Only" hintC "Die Haus-Spawn-Funktion steht nur Spendern zur verfügung.";
	};
};
closeDialog 0;
cutText ["","BLACK IN"];
if(count lhm_spawn_point == 0) then
{
	private["_sp","_spCfg"];
	_spCfg = [playerSide] call lhm_fnc_spawnPointCfg;
	_sp = _spCfg select 0;
	
	if(playerSide == civilian) then
	{
		if(isNil {(call compile format["%1", _sp select 0])}) then {
			player setPos (getMarkerPos (_sp select 0));
		} else {
			_spawnPos = (call compile format["%1", _sp select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (_sp select 0));
	};
	titleText[format["%2 %1",_sp select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
}
	else
{
	if(playerSide == civilian) then
	{
		if(isNil {(call compile format["%1",lhm_spawn_point select 0])}) then {
			if((["house",lhm_spawn_point select 0] call BIS_fnc_inString)) then {
				private["_bPos","_house","_pos"];
				_house = nearestObjects [getMarkerPos (lhm_spawn_point select 0),["House_F"],10] select 0;
				_bPos = [_house] call lhm_fnc_getBuildingPositions;

				if(count _bPos == 0) exitWith {
					player setPos (getMarkerPos (lhm_spawn_point select 0));
				};
				
				{_bPos = _bPos - [(_house buildingPos _x)];} foreach (_house getVariable ["slots",[]]);
				_pos = _bPos call BIS_fnc_selectRandom;
				player setPosATL _pos;
			} else {
				player setPos (getMarkerPos (lhm_spawn_point select 0));
			};
		} else {
			_spawnPos = (call compile format["%1", lhm_spawn_point select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (lhm_spawn_point select 0));
	};
	titleText[format["%2 %1",lhm_spawn_point select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
};

if(lhm_firstSpawn) then {
	lhm_firstSpawn = false;
	[] call lhm_fnc_welcomeNotification;
};
//[] call lhm_fnc_hudSetup;