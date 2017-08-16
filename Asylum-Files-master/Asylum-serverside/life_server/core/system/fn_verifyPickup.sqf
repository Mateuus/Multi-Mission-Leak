 
 
 
 
 
 
 
 
private["_obj","_unit","_return"]; 
 
_obj = [_this,0,"",[""]] call BIS_fnc_param; 
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
 
if (_obj in life_item_pickups) then 
{ 
diag_log format["Player %1 may be trying to dupe %2", name _unit, _obj]; 
_return = "1"; 
} 
else 
{ 
[_obj] spawn { 
private["_object","_remove"]; 
_object = _this select 0; 
life_item_pickups set [count life_item_pickups, _object]; 
sleep 2; 
_remove = [_object]; 
life_item_pickups = life_item_pickups - _remove; 
}; 
_return = "0"; 
}; 
 
[[_return],"life_fnc_setReturnValue",_unit,false] call life_fnc_MP;