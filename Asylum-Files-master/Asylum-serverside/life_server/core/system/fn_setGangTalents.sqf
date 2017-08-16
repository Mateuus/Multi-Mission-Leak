 
 
 
 
 
 
 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_gang = [_this,1,"",[""]] call BIS_fnc_param; 
_talents = [_this,2,[],[[]]] call BIS_fnc_param; 
 
if (isNull _unit || _gang == "") exitWith {}; 
 
_query = format["UPDATE `asylumlife%1`.`gangs` SET `talents`='%2' WHERE `id`='%3'", life_server_instance, _talents, _gang]; 
[_query] call DB_fnc_asyncQuery; 
 
{ 
if (_x getVariable ["gang","0"] == _gang && _x != _unit) then 
{ 
life_gangtalents = _talents; 
(_x getVariable ["ownerID", -1]) publicVariableClient "life_gangtalents"; 
}; 
} forEach allPlayers; 
 
_row = []; 
_index = -1; 
{ 
if (_x select 0 == _gang) exitWith { _index = _forEachIndex; _row = _x; }; 
} forEach life_server_gangs; 
if (_index < 0) exitWith {}; 
 
_row set [8, _talents]; 
life_server_gangs set [_index, _row];