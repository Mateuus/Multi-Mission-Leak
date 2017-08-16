/*
	File: fn_trackAnimal.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Search for animals within hunting zones
*/

private ["_chance","_animal","_animals","_msg","_error","_dir","_bearing","_comp","_distance","_message","_rnd"];

//if (!(121 in ES_talents)) exitWith { [[0,2], "You have no idea how to track animals."] call ES_fnc_broadcast; };
if (player distance (getMarkerPos "hunting_marker") > 600) exitWith { [[0,2], "Diese Umgebung ist nicht der Lebensraum für gejagte Tiere."] call ES_fnc_broadcast; };
if (player distance ES_let_tracked < 25) exitWith { [2, "Sie haben diesen Bereich schon abgesucht , hir sind keine fährten zu finden. Versuchen Sie es wo anders."] call ES_fnc_broadcast; };

_chance = 3;
if (ES_xp_lvl > 1) then { _chance = 2; };
if (ES_xp_lvl > 6) then { _chance = 1; };

ES_let_tracked = getPos player;
_animal = objNull;
_animals = nearestObjects [getMarkerPos "hunting_marker", ["Goat_random_F", "Cock_random_F", "Hen_random_F", "Sheep_random_F","Alsatian_Random_F"], 600];
if (count _animals > 0) then { _animal = _animals select 0 };
_rnd = random _chance;
if (_rnd > 1 || isNull _animal) exitWith { [[0,2], "Sie scheitern sie haben keine Tierspuren in diesem Gebiet finden können."] call ES_fnc_broadcast; };

_vd = getPosASL _animal vectorDiff getPosASL player;
_dir = (_vd select 0) atan2 (_vd select 1);
if (_dir < 0) then {_dir = 360 + _dir}; 
_comp = ["Nord", "Nord Osten", "Osten", "Süden Osten", "Süden", "Süden Westen", "Westen", "Nord Westen", "Nord"];
_bearing = _comp select (round (_dir / 45));

if (ES_xp_lvl > 6) then
{
	_error = floor (random 10);
	if (random 2 < 1) then { _error = _error * -1; };
	_distance = floor ((player distance _animal) + _error);
	_message = format["Du hast Fährten gefunden von einem/einer %1 ca %2 meter in Richtung %3.", getText(configFile >> "CfgVehicles" >> (typeOf _animal) >> "displayName"), _distance, _bearing];
}
else
{
	_error = floor (random 40);
	if (random 2 < 1) then { _error = _error * -1; };
	_distance = floor ((player distance _animal) + _error);
	_message = format["Sie haben die Spuren eines unbekannten Tieres aufgenommen grob %1 meter in the %2.", _distance, _bearing];
};

[[0,2], _message] call ES_fnc_broadcast;