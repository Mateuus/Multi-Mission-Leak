/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Receives a key from another player
*/

private["_vehicle","_list","_newOwner","_sel","_vehicle","_owners","_vehString","_unit","_uid"];

_vehicle = _this select 0;
_unit = _this select 1;
_newOwner = [];
_uid = getPlayerUID player;
_owners = _vehicle getVariable "vehicle_owners";
_newOwner pushBack (getPlayerUID player);
_newOwner pushBack (name player);
_newOwner pushBack (player);
_owners pushBack _newOwner;
_vehicle setVariable ["vehicle_owners",_owners,true];
DS_keyRing pushBack _vehicle;
_vehString = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");


hint format["%1 has given you the keys for a %2",(name _unit),_vehString];
