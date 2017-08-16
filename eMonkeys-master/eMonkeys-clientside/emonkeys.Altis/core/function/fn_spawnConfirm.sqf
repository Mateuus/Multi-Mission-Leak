/*
	File: fn_spawnConfirm.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Spawns the player where he selected.
*/
private["_spCfg","_sp","_spawnPos"];
closeDialog 0;
1000 cutText ["","BLACK FADED"];
if(count EMonkeys_spawn_point == 0) then
{
	private["_sp","_spCfg"];
	_spCfg = [playerSide] call EMonkeys_fnc_spawnPointCfg;
	_sp = _spCfg select 0;
	
	if(side player in [east,civilian]) then
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
	//titleText[format["%2 %1",_sp select 1,"Du bist gespawnt in"],"BLACK IN"];
}
	else
{
	if(side player in [east,civilian]) then
	{
		if(isNil {(call compile format["%1",EMonkeys_spawn_point select 0])}) then {
			player setPos (getMarkerPos (EMonkeys_spawn_point select 0));
		} else {
			_spawnPos = (call compile format["%1", EMonkeys_spawn_point select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (EMonkeys_spawn_point select 0));
	};
	//titleText[format["%2 %1",EMonkeys_spawn_point select 1,"Du bist gespawnt in"],"BLACK IN"];
};
if(!EMonkeys_firstSpawn) then {[] spawn EMonkeys_fnc_IntroCam};
eM_serverSpawn = true;
[] call EMonkeys_fnc_hudSetup;

/*
emonkeys_ColorCorrections1500 = ppEffectCreate ["colorCorrections", 1500];
emonkeys_ColorCorrections1500 ppEffectAdjust [1, 1.1, -0.05, [0.4, 0.2, 0.3, -0.1], [0.79, 0.72, 0.62, 1], [0.5,0.5,0.5,0], [0,0,0,0,0,0,4]];
emonkeys_ColorCorrections1500 ppEffectCommit 0;
emonkeys_ColorCorrections1500 ppEffectEnable true;
*/