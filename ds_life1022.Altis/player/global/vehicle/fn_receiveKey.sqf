/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Receives a key from another player
*/

private["_vehicle","_unit","_vehString"];

_vehicle = _this select 0;
_unit = _this select 1;

DS_keyRing pushBack _vehicle;
_vehString = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
hint format["%1 has given you the keys for a %2",(name _unit),_vehString];