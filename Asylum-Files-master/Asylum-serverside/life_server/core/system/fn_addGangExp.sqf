 
 
 
 
 
 
 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_gang = [_this,1,"",[""]] call BIS_fnc_param; 
_exp = [_this,2,0,[0]] call BIS_fnc_param; 
 
systemChat format["Adding %1 exp to gang %2 from %3.", _exp, _gang, name _unit]; 
 
if (isNull _unit || _exp == 0) exitWith {}; 
 
_row = []; 
_index = -1; 
{ 
if (_x select 0 == _gang) exitWith { _index = _forEachIndex; _row = _x; }; 
} forEach life_server_gangs; 
if (_index < 0) exitWith {}; 
 
_exp = _exp + (_row select 7); 
_row set [7, _exp]; 
life_server_gangs set [_index, _row]; 
life_server_gangs_queue pushBackUnique _row; 
 
life_gangexp = _exp; 
{ 
if (_exp == life_gangexp && _x getVariable ["gang","0"] == _gang) then 
{ 
(_x getVariable ["ownerID", -1]) publicVariableClient "life_gangexp"; 
}; 
} forEach allPlayers;