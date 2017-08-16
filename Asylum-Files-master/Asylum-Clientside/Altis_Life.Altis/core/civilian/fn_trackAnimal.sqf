/*
	File: fn_trackAnimal.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Search for animals within hunting zones
*/

private ["_chance","_animal","_animals","_msg","_error","_dir","_bearing","_comp","_distance","_message","_rnd"];

//if (!(121 in life_talents)) exitWith { [[0,2], "You have no idea how to track animals."] call life_fnc_broadcast; };
if (player distance (getMarkerPos "hunting") > 600) exitWith { [[0,2], "This environment is not the habitat of a hunted animal."] call life_fnc_broadcast; };
if (player distance life_last_tracked < 10) exitWith { [2, "You've already searched this area. Try elsewhere."] call life_fnc_broadcast; };

_chance = 3;
if (121 in life_talents) then { _chance = 2; };
if (122 in life_talents) then { _chance = 1; };

life_last_tracked = getPos player;

_animal = objNull;
_animals = nearestObjects [getMarkerPos "hunting", ["Goat_random_F", "Cock_random_F", "Hen_random_F", "Sheep_random_F","Alsatian_Random_F"], 600];
if (count _animals > 0) then { _animal = _animals select 0 };
_rnd = random _chance;
if (_rnd > 1 || isNull _animal) exitWith { [[0,2], "You fail to find animal tracks in this area."] call life_fnc_broadcast; };

_vd = getPosASL _animal vectorDiff getPosASL player;
_dir = (_vd select 0) atan2 (_vd select 1);
if (_dir < 0) then {_dir = 360 + _dir}; 
_comp = ["north", "north east", "east", "south east", "south", "south west", "west", "north west", "north"];
_bearing = _comp select (round (_dir / 45));

if (122 in life_talents) then
{
	_error = floor (random 10);
	if (random 2 < 1) then { _error = _error * -1; };
	_distance = floor ((player distance _animal) + _error);
	_message = format["You've picked up the tracks of a %1 approximately %2 metres to the %3.", getText(configFile >> "CfgVehicles" >> (typeOf _animal) >> "displayName"), _distance, _bearing];
}
else
{
	_error = floor (random 40);
	if (random 2 < 1) then { _error = _error * -1; };
	_distance = floor ((player distance _animal) + _error);
	_message = format["You've picked up the tracks of an unknown animal roughly %1 metres to the %2.", _distance, _bearing];
};

[[0,2], _message] call life_fnc_broadcast;