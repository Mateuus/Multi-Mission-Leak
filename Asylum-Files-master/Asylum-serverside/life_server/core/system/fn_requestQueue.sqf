 
 
 
 
 
 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_adminLevel = [_this,1,0,[0]] call BIS_fnc_param; 
 
 
 
_unit enableSimulationGlobal false; 
 
 
{ 
_active = [_x] call ASY_fnc_isUIDActive; 
if (!_active) then 
{ 
life_join_queue = life_join_queue - [_x]; 
}; 
} foreach life_join_queue; 
 
 
_playing = 0; 
{ 
if (simulationEnabled _x) then { _playing = _playing + 1; }; 
} foreach allPlayers; 
 
 
if (_playing >= life_max_players) then 
{ 
 
if (!((getPlayerUID _unit) in life_join_queue)) then 
{ 
if (_adminLevel != 0) then { life_join_queue = [getPlayerUID _unit] + life_join_queue; } 
else { life_join_queue set [count life_join_queue, getPlayerUID _unit]; }; 
}; 
}; 
 
 
_position = -1; 
{ 
if (_x == getPlayerUID _unit) exitWith { _position = _forEachIndex; }; 
} foreach life_join_queue; 
life_queue_place = _position + 1; 
 
 
 
(_unit getVariable ["ownerID", -1]) publicVariableClient "life_queue_place";