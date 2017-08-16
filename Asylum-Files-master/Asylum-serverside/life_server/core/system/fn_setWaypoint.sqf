 
 
 
 
 
 
 
 
private["_unit","_pos","_i"]; 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_pos = [_this,1,[0,0,0],[[]]] call BIS_fnc_param; 
_remove = [_this,2,false,[false]] call BIS_fnc_param; 
 
_toRemove = []; 
{ 
if (isNull (_x select 0)) then { 
_toRemove pushBack _forEachIndex; 
}; 
} forEach life_dispatchWaypoints; 
{ 
life_dispatchWaypoints set [_x, "DIE"]; 
life_dispatchWaypoints = life_dispatchWaypoints - ["DIE"]; 
} forEach _toRemove; 
 
_i = -1; 
{ 
if (_x select 0 == _unit) exitWith { _i = _forEachIndex; }; 
} forEach life_dispatchWaypoints; 
 
if (_i > -1) then 
{ 
life_dispatchWaypoints set [_i, "DIE"]; 
life_dispatchWaypoints = life_dispatchWaypoints - ["DIE"]; 
}; 
 
if (!_remove) then { life_dispatchWaypoints pushBack [_unit, _pos] }; 
 
(life_dispatcher getVariable ["ownerID", -1]) publicVariableClient "life_dispatchWaypoints"; 
 
[[_pos, _remove], "life_fnc_newWaypoint", _unit, false] spawn life_fnc_MP;