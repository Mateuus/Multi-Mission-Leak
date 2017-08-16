 
 
 
 
 
 
 
 
_raceId = [_this,0,0,[0]] call BIS_fnc_param; 
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
_ticks = [_this,2,0,[0]] call BIS_fnc_param; 
 
if ((call compile format["life_race%1", _raceId]) == 0) exitWith {}; 
 
{ 
_veh = _x; 
{ 
[[_raceId,_vehicle,_ticks],"life_fnc_raceWon",_x,false] spawn life_fnc_MP; 
} forEach (crew _veh); 
} forEach (life_racers select (_raceId - 1)); 
 
_newRacers = []; 
for "_i" from 0 to (count life_racers)-1 do 
{ 
if ((_i + 1) == _raceId) then { _newRacers set [_i, []]; } 
else { _newRacers set [_i, life_racers select _i]; }; 
}; 
life_racers = _newRacers; 
 
call compile format["life_race%1 = 0", _raceId]; 
publicVariable format["life_race%1", _raceId]; 
 
if (count life_active_event > 0) then  
{ 
if (_raceId == life_active_event select 0) then 
{ 
{ 
_x setFuel 0; 
} forEach life_event_vehicles; 
sleep 15; 
{ 
deleteVehicle _x; 
} forEach life_event_vehicles; 
life_event_vehicles = []; 
life_active_event = []; 
publicVariable "life_active_event"; 
}; 
}; 
 
if (worldName == "Stratis") then { _raceId = _raceId + 9; }; 
if (worldName == "Tanoa") then { _raceId = _raceId + 18; }; 
 
_query = format["INSERT INTO races (raceid, playerid, vehicle, ticks) VALUES ('%1', '%2', '%3', '%4')",_raceId,getPlayerUID (driver _vehicle),typeOf _vehicle,_ticks]; 
[_query] call DB_fnc_asyncQuery;