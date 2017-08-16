 
 
 
 
 
 
 
 
_event = ceil (random 6); 
life_active_event = [_event, time, true]; 
life_event_queue = []; 
publicVariable "life_active_event"; 
sleep 300; 
life_active_event = [_event, time, false]; 
publicVariable "life_active_event"; 
if (_event < 6) then  
{ 
if (worldName != "Australia" && _event == 5) then { _event = 1; };  
life_event_vehicles = []; 
_position = 1; 
_moved = []; 
{ 
if (vehicle _x == _x) then 
{ 
_startMarker = if (_position < 11) then { format["race_%1_pos_%2", _event, _position] }  else { format["race_%1_pos_10", _event] }; 
_pos = getMarkerPos _startMarker; 
_vClass = if (surfaceIsWater (getMarkerPos format["race_%1_start", _event])) then { "C_Scooter_Transport_01_F" } else { "C_Hatchback_01_sport_F" }; 
_v = _vClass createVehicle _pos; 
_v setVariable ["owner", _x, true]; 
_v setVariable ["temporary" ,true, true]; 
_v setDir (markerDir _startMarker); 
_v setPos _pos; 
_v setFuel 0; 
_v setVariable ["idleTime", time]; 
life_event_vehicles pushBack _v; 
_x setPos _pos; 
_x action ["getInDriver", _v]; 
_position = _position + 1; 
_moved pushBack _x; 
} 
else 
{ 
[[1,format["You were unable to join the race when it started because you were already inside a vehicle.", name player]],"life_fnc_broadcast",_x,false] spawn life_fnc_MP; 
}; 
} forEach life_event_queue; 
 
sleep 6; 
{ 
[[nil,nil,nil,_event],"life_fnc_joinRace",_x,false] spawn life_fnc_MP; 
} forEach _moved; 
};