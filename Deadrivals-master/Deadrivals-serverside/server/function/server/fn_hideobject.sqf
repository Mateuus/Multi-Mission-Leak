private["_unit","_bool"]; 
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_bool = [_this,1,false,[false]] call BIS_fnc_param; 
 
_unit hideobjectglobal _bool;