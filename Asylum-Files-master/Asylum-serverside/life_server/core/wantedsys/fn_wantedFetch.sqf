 
 
 
 
 
 
 
 
 
private["_ret"]; 
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
if(isNull _ret) exitWith {}; 
 
[[life_wanted_list],"life_fnc_wantedList",_ret,false] spawn life_fnc_MP;