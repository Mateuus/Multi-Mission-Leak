 
 
 
 
 
 
 
private["_talents","_ret"]; 
_talents = [_this,0,0,[0]] call BIS_fnc_param; 
 
_ret = (sqrt(_talents) + _talents ^ 2) * 18; 
_ret;