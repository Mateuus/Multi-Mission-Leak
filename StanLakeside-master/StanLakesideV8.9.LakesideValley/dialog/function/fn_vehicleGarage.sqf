/*
	
	
	Description:
	Vehicle Garage, why did I spawn this in an action its self?
*/

params [["_type", "", [""]], ["_spawnPos", objNull, [objNull]]];

life_garage_sp = [(_spawnPos modelToWorld [-10,0,0]),(getDir _spawnPos)-90];
life_garage_type = _type;
[getPlayerUID player,playerSide,_type,player] remoteExecCall ["TON_fnc_getVehicles",(call life_fnc_HCC)];
createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];