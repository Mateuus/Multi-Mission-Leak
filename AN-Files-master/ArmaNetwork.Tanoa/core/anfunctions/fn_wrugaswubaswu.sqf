/*
	File: fn_spawnPointSelected.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sorts out the spawn point selected and does a map zoom.
*/
disableSerialization;
private _control = param [0,controlNull,[controlNull]];
private _selection = param [1,0,[0]];
life_spawn_point = _control lbData _selection;
cameratarget = getMarkerPos life_spawn_point;
private _spawnname = getText(((format["configName _x == '%1'",life_spawn_point] configClasses (missionConfigFile >> "CfgSpawnPoint" >> str(playerSide))) select 0) >> "displayName");
ctrlSetText [1002,format ["Selected: %1",_spawnname]];
