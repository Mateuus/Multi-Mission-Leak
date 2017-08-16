 
 
 
 
 
 
 
private["_id","_desc","_value","_chance"]; 
 
_id = [_this,0,0,[0]] call BIS_fnc_param; 
_desc = [_this,1,"",[""]] call BIS_fnc_param; 
_value = [_this,2,0,[0]] call BIS_fnc_param; 
_chance = [_this,3,0,[0]] call BIS_fnc_param; 
_maxCops = [_this,4,4,[0]] call BIS_fnc_param; 
_position = [_this,5,[0,0,0],[[]]] call BIS_fnc_param; 
_unitUID = [_this,6,"",[""]] call BIS_fnc_param; 
 
if (isNull life_dispatcher && _unitUID == "") then 
{ 
{ 
if (side _x == west) then 
{ 
if ((random _chance) < 1) then 
{ 
[[_id,_desc,_value], "life_fnc_newDispatch", _x, false] spawn life_fnc_MP; 
}; 
}; 
} forEach allPlayers; 
}; 
 
 
life_dispatchTasks pushBack [_id,_desc,_value,_maxCops,[],_position,_unitUID]; 
if (!isNull life_dispatcher) then { (life_dispatcher getVariable ["ownerID", -1]) publicVariableClient "life_dispatchTasks" };