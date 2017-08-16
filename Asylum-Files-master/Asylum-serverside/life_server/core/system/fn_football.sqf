 
 
 
 
 
 
 
 
_active = [_this,0,false,[false]] call BIS_fnc_param; 
_trigger = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
_ball = [_this,2,objNull,[objNull]] call BIS_fnc_param; 
_centerPos = getPos _trigger; 
 
if (isServer && ASY_UsingHeadless) exitWith {}; 
 
if (count _centerPos == 0) exitWith {}; 
if (!_active) exitWith 
{ 
if (_ball in life_active_football) then { life_active_football = life_active_football - [_ball]; }; 
_ball setVelocity [0,0,0]; 
_ball setPos _centerPos; 
}; 
 
 
[_trigger, _ball, _centerPos] spawn 
{ 
_trigger = _this select 0; 
_ball = _this select 1; 
_centerPos = _this select 2; 
life_active_football pushBack _ball; 
 
while { _ball in life_active_football } do  
{ 
_players = []; 
{ if (_x isKindOf "Man") then { _players pushBack _x } } forEach (list _trigger); 
{ 
 
if (_x distance _ball < 1 && currentWeapon _x == "") then 
{ 
_vector = (((((getPos _ball) select 0) - ((getPos _x) select 0)) atan2 (((getPos _ball) select 1) - ((getPos _x) select 1))) + 360) % 360; 
if ([getPos _x, getDir _x, 70, getPos _ball] call BIS_fnc_inAngleSector) then  
{ 
_speed = (speed _x) / 2; 
if (_speed < 1) then { _speed = 1 }; 
if (_speed > 7) then { _speed = 10 }; 
_ball setVelocity [ 
(sin _vector * _speed),  
(cos _vector * _speed),  
(random 3) + 3 
]; 
sleep 1; 
}; 
}; 
} forEach _players; 
 
 
if !(_ball in (list _trigger)) then 
{ 
_ball setVelocity [0,0,0]; 
_ball setPos _centerPos; 
}; 
}; 
diag_log format["[football] DONE! life_active_football = %1", life_active_football]; 
}; 
