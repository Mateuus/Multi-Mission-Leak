 
 
 
 
 
 
 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
 
if (isNull _unit || !alive _unit) exitWith {}; 
 
if (([_unit,life_laser_queue] call life_fnc_index) < 0) then { life_laser_queue pushBack _unit; };