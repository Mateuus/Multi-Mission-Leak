 
 
 
 
 
 
 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_add = [_this,1,true,[true]] call BIS_fnc_param; 
 
if (isNull _unit) exitWith {}; 
 
if (_add) then 
{ 
if (!(_unit in life_event_queue)) then 
{ 
life_event_queue pushBack _unit; 
}; 
} 
else 
{ 
life_event_queue = life_event_queue - [_unit]; 
};