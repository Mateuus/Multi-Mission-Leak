/*
	File: fn_loginText.sqf
	Author: Blackd0g
	
	Description:
	Show a Message after Login with various informations
*/
private["_closesttown","_town_name","_town_pos"];

_closesttown = (nearestLocations [player,["NameCityCapital","NameCity","NameVillage"],1000]) select 0;
_town_name = text _closesttown;
_town_pos = position _closesttown;

[lhm_versionInfo ,"Time: " + str(date select 3) + ":" + str(date select 4), _town_name] spawn BIS_fnc_infoText;