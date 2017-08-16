/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Vehicle Garage, why did I spawn this in an action its self?
*/
private["_spawnPos","_dir","_type"];
_type = param [1,"",[""]];
_spawnPos = param [0,ObjNull,[ObjNull]];

DWEV_garage_sp = [(_spawnPos modelToWorld [-11.5,0,0]),(getDir _spawnPos)-90];
DWEV_garage_type = _type;
[getPlayerUID player,(side player),_type,player] remoteExec ["DWF_fnc_getVehicle",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
createDialog "DWEV_impound_menu";
disableSerialization;
ctrlSetText[2802,"Parke Fahrzeug aus...."];