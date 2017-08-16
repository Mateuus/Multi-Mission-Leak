 
 
 
 
 
 
 
 
diag_log format["Gold bar spawning is initialized."]; 
_maxBars = 15; 
if (worldName != "Altis") then { _maxBars = 8; }; 
while {true} do 
{ 
sleep ((2+(floor random 3)) * 60); 
if (worldName != "Tanoa") then 
{ 
waitUntil {!life_bank_inProgress}; 
_valid = []; 
_occupied = 0; 
{ 
_bar = nearestObjects [ASLToAGL _x, ["Land_Suitcase_F"], 5]; 
if (count _bar == 0) then { _valid pushBack _x; } 
else { _occupied = _occupied + 1; }; 
} forEach life_bank_spawns; 
 
if (_occupied < _maxBars) then 
{ 
_location = _valid call BIS_fnc_selectRandom; 
diag_log format["Spawning a gold bar at %1", _location]; 
_bar = "Land_Suitcase_F" createVehicle [0,0,0]; 
_bar setPosASL _location; 
_bar setVariable["item",["goldbar",1],true]; 
_bar setVariable["owner", objNull, true]; 
[_bar] call life_fnc_simDisable; 
}; 
}; 
 
 
 
_tapePositions = switch (worldName) do 
{ 
case "Altis": { [[16785.91,13641.38,0.9141],[16752.1,13628.3,1.1]] }; 
case "Tanoa": { [[11145.9,11489.8,0.5],[11013.2,11510,0.841614]] }; 
default { [] }; 
}; 
if (count _tapePositions > 0) then 
{ 
_tapePos = _tapePositions call BIS_fnc_selectRandom; 
if (isNull (_tapePos nearestObject "Land_DuctTape_F") && floor (random 5) == 0) then 
{ 
_bar = "Land_DuctTape_F" createVehicle _tapePos; 
_bar setPosATL _tapePos; 
_bar setVariable["item",["ducttape",1],true]; 
_bar setVariable["owner", objNull, true]; 
[_bar] call life_fnc_simDisable; 
};  
}; 
};