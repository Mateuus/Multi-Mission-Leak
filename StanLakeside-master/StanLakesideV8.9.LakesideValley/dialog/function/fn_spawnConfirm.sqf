/*
	File: fn_spawnConfirm.sqf
	
	
	Description:
	Spawns the player where he selected.
*/
private["_spCfg","_sp","_spawnPos"];
if(count life_spawn_point == 0) then
{
	private["_sp","_spCfg"];
	_spCfg = [playerSide] call life_fnc_spawnPointCfg;
	_sp = _spCfg select 0;
	
	if(playerSide == civilian || playerSide == east) then
	{
		if(isNil {(call compile format["%1", _sp select 0])}) then {
			player setPos (getMarkerPos (_sp select 0));
			
			// Run our code for hospital spawn
			if ((!life_firstSpawn) && (_sp select 0 == "civ_spawn_1")) then 
			{
				[] call A3L_Fnc_HospitalSpawn;
			};			
			
		} else {
			_spawnPos = (call compile format["%1", _sp select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
	else
	{
		player setPos (getMarkerPos (_sp select 0));
		
		// Run our code for hospital spawn
		if ((!life_firstSpawn) && (_sp select 0 == "civ_spawn_1")) then 
		{
			[] call A3L_Fnc_HospitalSpawn;
		};					
	};
}
else
{
	if(playerSide == civilian || playerSide == east) then
	{
		if(isNil {(call compile format["%1",life_spawn_point select 0])}) then {
			if((["house",life_spawn_point select 0] call BIS_fnc_inString)) then {
				private["_bPos","_house","_pos"];
				_house = nearestObjects [getMarkerPos (life_spawn_point select 0),["House_F"],10] select 0;
				_bPos = [_house] call life_fnc_getBuildingPositions;

				if(count _bPos == 0) exitWith {
					player setPos (getMarkerPos (life_spawn_point select 0));
				};
				
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
		if((life_spawn_point select 0) in ["medic_spawn_4"]) then {
			player setPosATL [getMarkerPos (life_spawn_point select 0) select 0, getMarkerPos (life_spawn_point select 0) select 1, 6.5];
			player setDir markerDir (life_spawn_point select 0);
		} else {
			player setPos (getMarkerPos (life_spawn_point select 0));
		};
	};
};

[] spawn
{
	closeDialog 0;
	cutText ["","BLACK IN"];
	[] execVM "scripts\cameraScreen.sqf";
	private["_handle"];
	_handle = [] execVM "scripts\cameraHeight.sqf";
	waitUntil {scriptDone _handle};
	if(life_firstSpawn) then {
		life_firstSpawn = false;
	  	(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
		(findDisplay 46) displayAddEventHandler ["MouseZchanged", "_this spawn life_fnc_enableActions"];
		[] execVM "core\init_survival.sqf";
		[] call life_fnc_hudSetup;
		player setVariable ["loaded", true, true];
	};
	if(life_respawned) then {
		life_respawned = false;
	};
	["Press F10 to bring up the Location Finder!", false] spawn domsg;
};
