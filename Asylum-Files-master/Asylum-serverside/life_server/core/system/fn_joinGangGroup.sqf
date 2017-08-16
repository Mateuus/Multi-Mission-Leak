 
 
 
 
 
 
 
 
_gang = [_this,0,"0",["0"]] call BIS_fnc_param; 
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param; 
 
_gangRow = []; 
{ if (_gang == (_x select 0)) then { _gangRow = _x; }; } foreach life_server_gangs; 
if (count _gangRow == 0) exitWith {}; 
 
if (!isnil "_gangRow") then { [[_gangRow select 5],"life_fnc_forceJoinGroup",_unit,false] spawn life_fnc_MP; };