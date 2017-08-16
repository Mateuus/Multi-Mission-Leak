 
 
 
 
 
 
 
 
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_vis = [_this,1,false] call BIS_fnc_param; 
_adminlvl = [_this, 2, 0] call BIS_fnc_param; 
 
if(_adminlvl < 1) exitWith {}; 
if(_vis) then 
{ 
_unit hideObjectGlobal true; 
_unit allowDamage false; 
} else 
{ 
_unit hideObjectGlobal false; 
_unit allowDamage true; 
};