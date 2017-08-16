 
 
 
 
 
 
 
 
private ["_unit","_min","_max","_ranges","_bounty","_step","_set","_maxBounties"]; 
 
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param; 
_max = [_this,1,5000,[5000]] call BIS_fnc_param; 
_existing = [_this,2,[],[[]]] call BIS_fnc_param; 
_maxBounties = [_this,3,1,[1]] call BIS_fnc_param; 
 
if (count _existing >= _maxBounties) exitWith 
{ 
[[1, format["You already have your maximum of %1 active bounties.", _maxBounties]],"life_fnc_broadcast", _unit, false] spawn life_fnc_MP; 
}; 
 
_min = 2000; 
_bounty = []; 
 
_ranges = [2000000, 100000, 50000, 10000, 6000, 2000]; 
_step = (count _ranges) - 1; 
{ 
if ((_x > 2000) && (_x <= _max)) then { _step = _forEachIndex + 1; _min = _ranges select _step; }; 
} foreach _ranges; 
 
while {_step < (count _ranges)} do 
{ 
_set = [life_wanted_list, {_u = objNull; _uid = (_x select 1); { if (getPlayerUID _x == _uid) then { _u = _x }; } forEach allPlayers; (!isNull _u && (_x select 3) <= _max && (_x select 3) >= _min && (_x select 3) > 2000 && getPlayerUID _unit != (_x select 1) && side _u != west && !(_u getVariable ["prisoner",false]) && (_u distance (getMarkerPos "Respawn_west")) > 750 && !((_x select 1) in _existing) && ([_x select 1] call ASY_fnc_isUIDActive) && group _u != group _unit && (_u getVariable["gang","-1"] != _unit getVariable["gang","0"]))}] call BIS_fnc_conditionalSelect; 
if (count _set > 0) exitWith 
{ 
_bounty = _set call BIS_fnc_selectRandom;   
}; 
_step = _step + 1; 
_min = _ranges select _step; 
}; 
 
[[_bounty], "life_fnc_setBounty", _unit, false] call life_fnc_MP;