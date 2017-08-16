 
 
 
 
 
 
 
private ["_id","_amount"]; 
 
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
_id = [_this,1,"0",["0"]] call BIS_fnc_param; 
 
_gangRow = []; 
{ if (_id == (_x select 0)) then { _gangRow = _x; }; } foreach life_server_gangs; 
if (count _gangRow == 0) exitWith {}; 
_amount = _gangRow select 5; 
 
[[_amount],"life_fnc_gangBank",_unit,false] spawn life_fnc_MP;