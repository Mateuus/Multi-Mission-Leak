/*
	File: fn_spawnConfirm.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Spawns the player where he selected.
*/
private["_spCfg","_sp","_spawnPos","_marker"];
closeDialog 0;

if (!life_swatSpawn) then
{
	if(count life_spawn_point == 0) then
	{
		private["_sp","_spCfg"];
		_spCfg = [playerSide] call life_fnc_spawnPointCfg;
		_sp = _spCfg select 0;
		
		if(playerSide == civilian) then
		{
			_spawnPos = [];
			switch (true) do
			{
				case ( (_sp select 0) in ["turf_label_1","turf_label_2","turf_label_3"] || worldName in ["Tanoa","Australia"]) : 
				{
					_spawnPos = getMarkerPos (_sp select 0);
				};
				case ( (_sp select 0) in ["civ_spawn_1","civ_spawn_2","civ_spawn_3","civ_spawn_4","donor_town"] ) : 
				{
					_spawnPos = (call compile format["%1", _sp select 0]) call BIS_fnc_selectRandom;
					_spawnPos = _spawnPos buildingPos 0;
				};
				default
				{
					_spawnPos = nearestObject [(getMarkerPos (_sp select 0)), "House_F"];
					_spawnPos = _spawnPos buildingPos 0;
				};
			};

			player setPos _spawnPos;
		}
		else
		{
			_marker = _sp select 0;
			_zOffset = 0;
			if (_marker == "cop_spawn_4") then { life_last_airhq = time; if (worldName == "Australia") then { _zOffset = 7; }; };
			if (playerSide == west) then { _marker = format["%1_%2", _marker, floor random 4]; };
			_pos = getMarkerPos _marker;
			if (_zOffset > 0) then { _pos set [2, _zOffset] };
			player setPosATL _pos;
		};
		titleText[format["You have spawned at %1",_sp select 1],"BLACK IN"];
	}
	else
	{
		if(playerSide == civilian) then
		{
			switch (true) do
			{
				case ( (life_spawn_point select 0) in ["turf_label_1","turf_label_2","turf_label_3"] || worldName in ["Tanoa","Australia"] ) : 
				{
					_spawnPos = getMarkerPos (life_spawn_point select 0);
				};
				case ( (life_spawn_point select 0) in ["civ_spawn_1","civ_spawn_2","civ_spawn_3","civ_spawn_4","donor_town"] ) : 
				{
					_spawnPos = (call compile format["%1", life_spawn_point select 0]) call BIS_fnc_selectRandom;
					_spawnPos = _spawnPos buildingPos 0;
				};
				default
				{
					_spawnPos = nearestObject [(getMarkerPos (life_spawn_point select 0)), "House_F"];
					_spawnPos = _spawnPos buildingPos 0;
				};
			};
			
			player setPos _spawnPos;
		}
		else
		{			
			_marker = life_spawn_point select 0;
			_zOffset = 0;
			if (_marker == "cop_spawn_4") then { life_last_airhq = time; if (worldName == "Australia") then { _zOffset = 7; }; };
			if (playerSide == west) then { _marker = format["%1_%2", _marker, floor random 4]; };
			_pos = getMarkerPos _marker;
			if (_zOffset > 0) then { _pos set [2, _zOffset] };
			player setPosATL _pos;
		};
		titleText[format["You have spawned at %1",life_spawn_point select 1],"BLACK IN"];
	};
}
else
{
	if (!life_activeSWAT) exitWith {};
	titleText[format["Your team is being deployed at %1.",life_spawn_point select 0],"BLACK IN"];
	life_deploySWAT = life_spawn_point select 1;
	publicVariable "life_deploySWAT";
};

if (playerSide == civilian) then { 
	//check for bad position, and under the right conditions DON'T wipe gear!
	//First time spawning? Position was bugged? Gear isn't empty? And finally, we said we were alive when we logged out! Thus, don't wipe gear.
	if(isNil "life_firstSpawn" && {!isNil "life_badPosition"} && {count civ_gear > 0} && {life_badPosition}) exitWith {};
	[] call life_fnc_civDefault; 
};

0 cutText ["","PLAIN"];

[] call life_fnc_hudSetup;
if(isNil "life_firstSpawn") then {life_firstSpawn = true};