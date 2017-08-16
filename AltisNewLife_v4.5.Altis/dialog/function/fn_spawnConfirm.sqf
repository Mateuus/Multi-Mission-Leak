#define GETC(var) (call var)
private["_spCfg","_sp","_spawnPos","_retext"];
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
	titleText[format["\n\n\n\n\n\n\n\n\n\n\n\n%2 %1",_sp select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
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
	titleText[format["\n\n\n\n\n\n\n\n\n\n\n\n%2 %1",life_spawn_point select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
};

[] spawn {
    cutText ["","BLACK IN"]; 
    if(life_firstSpawn) then {
        private["_handle"];
        _handle = [] spawn life_fnc_initIntro;
        waitUntil {scriptDone _handle};
        life_firstSpawn = false;
	};
[] call life_fnc_hudSetup;
if(GETC(life_tafflevel) > 0) then {life_companyID pushBack 1};
_retext = 0;
{	if((playerSide == _x select 2) && ((uniform player) == _x select 0)) then {	_retext = 1;};
} foreach ANL_uniforme;
if (_retext > 0) then { [] call life_fnc_uniform; };
};