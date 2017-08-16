 
 
 
 
 
 
 
 
private["_house","_name","_unit"]; 
_name = [_this,0,"",[""]] call BIS_fnc_param; 
_house = [_this,1,objNull,[objNull]] call BIS_fnc_param; 
_unit = [_this,2,objNull,[objNull]] call BIS_fnc_param; 
 
[_name, _house, _unit] spawn DB_fnc_insertGang;