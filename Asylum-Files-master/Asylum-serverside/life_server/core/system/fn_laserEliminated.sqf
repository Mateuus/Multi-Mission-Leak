 
 
 
 
 
 
 
 
private ["_unit","_living"]; 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
 
 
{ 
if ((_x select 0) == _unit && (_x select 2)) then 
{ 
life_laser_players set [_forEachIndex, [_x select 0, _x select 1, false]]; 
}; 
} forEach life_laser_players; 
 
 
 
_living = []; 
{ if ((_x select 2) && ((_x select 0) distance (getMarkerPos "lasertag")) < 35) then { _living pushBack _x; }; } forEach life_laser_players; 
 
_blueAlive = 0; 
_redAlive = 0; 
{ if ((_x select 1) == 1) then { _blueAlive = _blueAlive + 1; } else { _redAlive = _redAlive + 1; }; } forEach _living; 
 
 
if (_blueAlive == 0 || _redAlive == 0) then 
{ 
sleep 5;  
life_laser_inprogress = false; 
{ ((_x select 0) getVariable ["ownerID", -1]) publicVariableClient "life_laser_inprogress"; } forEach life_laser_players; 
} 
else  
{ 
life_laser_blue = _blueAlive; 
life_laser_red = _redAlive; 
{ 
((_x select 0) getVariable ["ownerID", -1]) publicVariableClient "life_laser_blue"; 
((_x select 0) getVariable ["ownerID", -1]) publicVariableClient "life_laser_red"; 
} forEach _living; 
};