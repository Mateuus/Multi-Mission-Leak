/*
	File: fn_spawnConfirm.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Spawns the player where he selected.
*/
private["_spCfg","_sp","_spawnPos"];
closeDialog 0;
cutText ["","BLACK IN"];
if(count life_spawn_point == 0) then
{
	private["_sp","_spCfg"];
	_spCfg = [playerSide] call life_fnc_spawnPointCfg;
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
		if(isNil {(call compile format["%1",life_spawn_point select 0])}) then {
			if((["house",life_spawn_point select 0] call BIS_fnc_inString)) then {
				private["_bPos","_house","_pos"];
				_house = nearestObjects [getMarkerPos (life_spawn_point select 0),["House_F"],10] select 0;
				_bPos = [_house] call life_fnc_getBuildingPositions;

				if(count _bPos == 0) exitWith {
					player setPos (getMarkerPos (life_spawn_point select 0));
				};

				{_bPos = _bPos - [(_house buildingPos _x)];} foreach (_house getVariable ["slots",[]]);
				_pos = _bPos call BIS_fnc_selectRandom;
				player setPosATL _pos;
			} else {
				player setPos (getMarkerPos (life_spawn_point select 0));
			};
		} else {
			_spawnPos = (call compile format["%1", life_spawn_point select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (life_spawn_point select 0));
	};
	titleText[format["%2 %1",life_spawn_point select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
};

//HSD system
if (playerSide == independent) then {
	life_hsd = life_spawn_point select 3;
	player setVariable ["hsd", life_hsd, true];
	
	switch (life_hsd) do {
		case "med": {
			if((!isNil "PG_groupMedic") && {!isNull PG_groupMedic}) then {
				[player] join PG_groupMedic;
			} else {
				[player] join (createGroup independent);
				PG_groupMedic = group player;
				publicVariable "PG_groupMedic";
			};
		};
		case "alac": {
			if((!isNil "PG_groupAlac") && {!isNull PG_groupAlac}) then {
				[player] join PG_groupAlac;
			} else {
				[player] join (createGroup independent);
				PG_groupAlac = group player;
				publicVariable "PG_groupAlac";
			};
		};
		case "thw": {
			if((!isNil "PG_groupThw") && {!isNull PG_groupThw}) then {
				[player] join PG_groupThw;
			} else {
				[player] join (createGroup independent);
				PG_groupThw = group player;
				publicVariable "PG_groupThw";
			};
		};
		case "event": {
			if((!isNil "PG_groupEvent") && {!isNull PG_groupEvent}) then {
				[player] join PG_groupEvent;
			} else {
				[player] join (createGroup independent);
				PG_groupEvent = group player;
				publicVariable "PG_groupEvent";
			};
		};
	};
};

if (_this select 0) then {
	[] spawn PG_fnc_skySpawn;
} else {
	if(life_firstSpawn) then {
		if (PG_newbie) then {
			[] spawn PG_fnc_IntroCam;
			//_handle = [] spawn PG_fnc_newbieIntro;
		} else {
			if (!isServer && !(life_skipIntro)) then {
				[] spawn PG_fnc_IntroCam;
			};
		};
		life_firstSpawn = false;
	} else {
		[] call life_fnc_welcomeNotification;
	};
};

[]call PG_fnc_clothing;
{_unit = _x; {_unit setObjectTexture [_forEachIndex,_x]} foreach getObjectTextures _unit;} forEach allPlayers;

[[0,format["%1 ist gerade aufgestanden",profileName],false],"life_fnc_broadcast",true,false] spawn life_fnc_MP;