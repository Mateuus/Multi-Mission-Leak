/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Vehicle Garage, why did I spawn this in an action its self?
*/
private["_spawnPos","_dir","_type"];
_type = [_this,1,"",[""]] call BIS_fnc_param;
_spawnPos = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

XY_spawnVehicleOnPosition = true;
XY_garageSpawnPoints = [[ (_spawnPos modelToWorld [-10, 0, 0]), (getDir _spawnPos) - 90 ]];
XY_garage_type = _type;

[getPlayerUID player, playerSide, _type, player] remoteExec ["XYDB_fnc_getVehicles", XYDB];

createDialog "XY_dialog_impound";