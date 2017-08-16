/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Vehicle Garage, why did I spawn this in an action its self?
*/
private["_spawnPos","_dir","_type","_offset","_dirplus"];
_dirplus = (_this select 3);
_offset = (_this select 2);
_type = [_this,1,"",[""]] call BIS_fnc_param;
_spawnPos = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

life_garage_sp = [(_spawnPos modelToWorld _offset),(getDir _spawnPos) + _dirplus];
life_garage_type = _type;
[getPlayerUID player,playerSide,_type,player] remoteExec ["TEX_fnc_getVehicles", 2, false];
createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];