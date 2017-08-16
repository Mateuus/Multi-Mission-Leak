/*
	Author: Bryan "Tonic" Boardwine
	Description:
	Vehicle Garage, why did I spawn this in an action its self?
*/
private["_spawnPos","_dir","_type"];
_params = (_this select 3);
_garageType = _params param[0,"",[""]];
_spawnPoint = _params param[1,"",["",[]]];
if(dialog) exitWith {};
if(_garageType isEqualTo "") exitWith {};
life_garage_sp = _spawnPoint;
life_garage_type = _garageType;
[getPlayerUID player,playerSide,_garageType,player] remoteExec ["TON_fnc_getVehicles",2];
