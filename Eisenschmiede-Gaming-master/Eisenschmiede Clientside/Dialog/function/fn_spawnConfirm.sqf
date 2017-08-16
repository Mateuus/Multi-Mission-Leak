/*
	File: fn_spawnConfirm.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Spawns the player where he selected.
*/
private["_spCfg","_sp","_spawnPos"];
closeDialog 0;
cutText ["","BLACK IN"];
if (playerSide == civilian) then
{
	if(ES_spawn_point find "house_spawn_" != -1) then 
	{
		if (["house",ES_spawn_point] call BIS_fnc_inString) then 
		{
			private["_bPos","_house","_pos"];
			_house = nearestObjects [getMarkerPos ES_spawn_point,["House_F"],10] select 0;
			_bPos = [_house] call ES_fnc_getBuildingPositions;

			if(count _bPos == 0) exitWith
			{
				player setPos (getMarkerPos ES_spawn_point);
			};

			{_bPos = _bPos - [(_house buildingPos _x)];} foreach (_house getVariable ["slots",[]]);
			_pos = _bPos call BIS_fnc_selectRandom;
			player setPosATL _pos;
		}
		else
		{
			player setPos (getMarkerPos ES_spawn_point);
		};
	} 
	else 
	{
		if (typeName (missionNamespace getVariable[ES_spawn_point,""]) == typeName []) then
		{
			_spawnPos = (missionNamespace getVariable ES_spawn_point) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
		}
		else
		{
			_spawnPos = getMarkerPos ES_spawn_point;

		};

		player setPos _spawnPos;
	};
}
else
{
	player setPos (getMarkerPos ES_spawn_point);
};

if(ES_firstSpawn) then {
	[] spawn ES_fnc_IntroCam;
	[] spawn ES_fnc_Infos;
};

ES_DialogSpawn = false;
ES_StartDia = false;

[] spawn { sleep 0.4;

	showChat true;
	ES_vdFoot = 950;
	ES_vdCar = 950;
	ES_vdAir = 950;
	[] call ES_fnc_updateViewDistance;
	"DynamicBlur" ppEffectEnable false; 
};

{ deleteMarkerLocal format["house_spawn_%1",_forEachIndex]; } foreach ES_houses;

[] call ES_fnc_hudSetup;
if (isClass(configFile >> "CfgPatches" >> "EisenschmiedeHighTextures")) then { [] spawn ES_fnc_updateClothing; }else{ [] spawn ES_fnc_updateClothing; };