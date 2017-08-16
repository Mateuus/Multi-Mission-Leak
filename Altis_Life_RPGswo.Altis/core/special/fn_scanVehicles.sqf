#include "..\..\macros.hpp"
/*
	File: scanVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
	edit by Division-wolf.de
*/
private["_display","_list","_objects"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	_display = findDisplay 3494;
	_list = _display displayCtrl 2902;
	lbClear _list;
	nn_last_vehicles = [];
	_objects = nearestObjects [player, ["Air"], 300];
	{
		if(vehicle player != _x) then {
			_color = ((M_CONFIG(getArray,"LifeCfgVehicles",(typeOf _x),"textures") select (_x getVariable "DWEV_VEH_color")) select 0);
			_text = format["(%1)",_color];
			_list lbAdd format ["%1 - %2 (%3)", getText(configFile >> "cfgVehicles" >> typeOf _x >> "DisplayName"), _text, round(player distance _x)];
			nn_last_vehicles pushBack _x;
		};
	} foreach _objects;
};