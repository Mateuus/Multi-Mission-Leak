/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Spawns the player in at his selected location
*/
private["_spawnLocs","_spawnPoint","_spawnPos","_tempValue"];
closeDialog 0;
cutText ["","BLACK IN"];

//Variables for whitelisted jobs

if(((DS_spawnPoint select 0) == "medic_spawn1")||((DS_spawnPoint select 0) == "medic_spawn2")||((DS_spawnPoint select 0) == "medic_spawn3"))then
	{
	[] execVM "player\whitelistcivilian\setUpMedic.sqf";
	};

if(((DS_spawnPoint select 0) == "mechanic_spawn_1")||((DS_spawnPoint select 0) == "mechanic_spawn_2")||((DS_spawnPoint select 0) == "mechanic_spawn_3")||((DS_spawnPoint select 0) == "mechanic_spawn_4"))then
	{
	[] execVM "player\whitelistcivilian\setUpMechanic.sqf";
	};
//Security markers here	
if(((DS_spawnPoint select 0) == "secSpawn1")||((DS_spawnPoint select 0) == "secSpawn2"))then
	{
	[] execVM "player\whitelistcivilian\setUpSecurity.sqf";
	};
	
if(((DS_spawnPoint select 0) == "BH_spawn_1")||((DS_spawnPoint select 0) == "BH_spawn_2")||((DS_spawnPoint select 0) == "BH_spawn_3")||((DS_spawnPoint select 0) == "BH_spawn_4"))then
	{
	[] call DS_fnc_setupBH;
	};
	
if(((DS_spawnPoint select 0) == "SG_spawn_1")||((DS_spawnPoint select 0) == "SG_spawn_2")||((DS_spawnPoint select 0) == "SG_spawn_3")||((DS_spawnPoint select 0) == "SG_spawn_4"))then
	{
	[] call life_fnc_truckerLoadout;
	};

if(count DS_spawnPoint == 0) then
{
	private["_spawnPoint","_spawnLocs"];
	_spawnLocs = [] call DS_fnc_getSpawnPoints;
	_spawnPoint = _spawnLocs select 0;
	
	if(playerSide == civilian) then
	{
		if(isNil {(call compile format["%1", _spawnPoint select 0])}) then {
			player setPos (getMarkerPos (_spawnPoint select 0));
		} else {
			_spawnPos = (call compile format["%1", _spawnPoint select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (_spawnPoint select 0));
	};
	titleText[format["You are spawning in %1",_spawnPoint select 1],"BLACK IN"];
}
	else
{
	if(playerSide == civilian) then
	{
		if(isNil {(call compile format["%1",DS_spawnPoint select 0])}) then {
			if((["property",DS_spawnPoint select 0] call BIS_fnc_inString)) then {
				private["_bPos","_house","_pos"];
				_house = nearestObjects [getMarkerPos (DS_spawnPoint select 0),["House_F"],10] select 0;
				if((_house distance getMarkerPos (DS_spawnPoint select 0)) > 5)then
					{
					_house = nearestObjects [(getMarkerPos (DS_spawnPoint select 0)), [], 10] select 0;
					};
				_bPos = [_house] call DS_fnc_houseMarkers;

				if(count _bPos == 0) exitWith {
					player setPos (getMarkerPos (DS_spawnPoint select 0));
				};
				
				_pos = _bPos call BIS_fnc_selectRandom;
				player setPosATL _pos;
			} else {
				player setPos (getMarkerPos (DS_spawnPoint select 0));
			};
		} else {
			_spawnPos = (call compile format["%1", DS_spawnPoint select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (DS_spawnPoint select 0));
	};
	titleText[format["You have spawn at %1",DS_spawnPoint select 1],"BLACK IN"];
};

if(DS_firstSpawn) then {
	DS_firstSpawn = false;
	[] spawn DS_fnc_serverIntro;
};
enableEnvironment false;
player enableFatigue false;
vehicle player switchCamera "EXTERNAL";
[] call DS_fnc_setupHud;
(findDisplay 666671) displayRemoveEventHandler ["KeyDown", DS_blockEsc];
//Martial Law Checks
if(((_spawnPoint select 0) == "civ_spawn_2")&&(miscInfoArray select 11))then
	{
	player setPos (getMarkerPos "civ_spawn_3");
	hint "Because Martial Law is currently declared in Pyrgos, you have been spawned in Athira instead";
	systemchat "Because Martial Law is currently declared in Pyrgos, you have been spawned in Athira instead";
	};
if(((_spawnPoint select 0) == "civ_spawn_4")&&(miscInfoArray select 10))then
	{
	player setPos (getMarkerPos "civ_spawn_3");
	hint "Because Martial Law is currently declared in Sofia, you have been spawned in Athira instead";
	systemchat "Because Martial Law is currently declared in Sofia, you have been spawned in Athira instead";
	};
if(((_spawnPoint select 0) == "civ_spawn_3")&&((miscInfoArray select 9)||(miscInfoArray select 12)))then
	{
	player setPos (getMarkerPos "civ_spawn_4");
	hint "Because Martial Law is currently declared in Athira or the Athira Airfield, you have been spawned in Sofia instead";
	systemchat "Because Martial Law is currently declared in Athira or the Athira Airfield, you have been spawned in Sofia instead";
	};
[] execVM "scripts\welcome.sqf";

