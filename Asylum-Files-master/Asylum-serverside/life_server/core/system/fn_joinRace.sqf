 
 
 
 
 
 
 
 
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_raceId = [_this,1,0,[0]] call BIS_fnc_param; 
 
if(_raceId < 1) exitWith {}; 
_startPos = getMarkerPos format["race_%1_start", _raceId]; 
if (_vehicle distance _startPos > 15) exitWith {}; 
if (!alive _vehicle) exitWith {}; 
 
_start = call compile (format ["life_race%1", _raceId]); 
(life_racers select (_raceId - 1)) set [count (life_racers select (_raceId - 1)), _vehicle]; 
if (count (life_racers select (_raceId - 1)) == 1) then 
{ 
[_raceId] spawn 
{ 
private ["_start","_raceId"]; 
_raceId = _this select 0; 
_startPos = getMarkerPos format["race_%1_start", _raceId]; 
sleep 40; 
{ 
if (alive _x) then 
{ 
_vehicle = _x; 
{ 
[[[0,1,2],"THE RACE BEGINS IN: 3"],"life_fnc_broadcast",_x,false] spawn life_fnc_MP; 
} forEach (crew _vehicle); 
}; 
} forEach (life_racers select (_raceId - 1)); 
sleep 1; 
{ 
if (alive _x) then 
{ 
_vehicle = _x; 
{ 
[[[0,1,2],"THE RACE BEGINS IN: 2"],"life_fnc_broadcast",_x,false] spawn life_fnc_MP; 
} forEach (crew _vehicle); 
}; 
} forEach (life_racers select (_raceId - 1)); 
sleep 1; 
{ 
if (alive _x) then 
{ 
_vehicle = _x; 
{ 
[[[0,1,2],"THE RACE BEGINS IN: 1"],"life_fnc_broadcast",_x,false] spawn life_fnc_MP; 
} forEach (crew _vehicle); 
}; 
} forEach (life_racers select (_raceId - 1)); 
sleep 1; 
{ 
if (alive _x) then 
{ 
_vehicle = _x; 
if (_vehicle distance _startPos > 15) then 
{ 
{ 
[[[0,1,2],"The race has begun but you moved too far from the starting position.  Disqualified."],"life_fnc_broadcast",_x,false] spawn life_fnc_MP; 
if (count life_active_event > 0 && !isNil life_event_startpos) then 
{ 
_t = +life_active_event; 
life_active_event = []; 
(_x getVariable ["ownerID", -1]) publicVariableClient "life_active_event"; 
life_active_event = +_t; 
}; 
 
} forEach (crew _vehicle); 
} 
else 
{ 
{ 
[[[0,1,2],"GO GO GO!"],"life_fnc_broadcast",_x,false] spawn life_fnc_MP; 
} forEach (crew _vehicle); 
[[_raceId],"life_fnc_startRace",(driver _vehicle),false] spawn life_fnc_MP; 
}; 
}; 
} forEach (life_racers select (_raceId - 1)); 
call compile format["life_race%1 = %2", _raceId, time]; 
publicVariable format["life_race%1", _raceId]; 
waitUntil { sleep 5; _startTime = call compile (format ["life_race%1", _raceId]); (_startTime == 0 || _startTime < (time - 300) ) }; 
if ((call compile (format ["life_race%1", _raceId])) > 0) then 
{ 
call compile format["life_race%1 = 0", _raceId]; 
publicVariable format["life_race%1", _raceId]; 
{ 
_vehicle = _x; 
{ 
[[[0,1,2],"The race has expired without a winner."],"life_fnc_broadcast",_x,false] spawn life_fnc_MP; 
} forEach (crew _vehicle); 
} forEach (life_racers select (_raceId - 1)); 
_newRacers = []; 
for "_i" from 0 to (count life_racers)-1 do 
{ 
if ((_i + 1) == _raceId) then { _newRacers set [_i, []]; } 
else { _newRacers set [_i, life_racers select _i]; }; 
}; 
life_racers = _newRacers; 
}; 
}; 
};