/* 
 File: marketChange.sqf 
 Author: Dirk Pitt 
 Zero-One Altis Life 
*/ 
private["_array","_item","_count","_index","_oldCount"]; 
_array =  param[0,[],[[]]]; 
diag_log format ["market change %1", _array]; 
if(typeName _array != "ARRAY" || {_array isEqualTo []}) exitWith {diag_log format ["error: market change was %1", _array]}; 
{ 
 _item = _x select 0; 
 _count = _x select 1; 
 _index = [_item,market_changes] call zero_fnc_oKzQhZKu; 
 if(_index != -1) then { 
  _oldCount = (market_changes select _index) select 1; 
  market_changes set[_index,[_item, _count + _oldCount]]; 
 }else{ 
  market_changes pushBack [_item,_count]; 
 }; 
} forEach _array; 
