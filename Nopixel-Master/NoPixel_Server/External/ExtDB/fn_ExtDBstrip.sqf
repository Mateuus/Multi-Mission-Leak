 
 
 
 
 
 
 
 
 
 
 
 
 
 
private["_string","_array"]; 
 
_string = (_this select 0); 
 
_array = toArray _string; 
 
_stripThese = [58, 47, 92, 124, 59, 123, 125, 60, 62, 96, 39]; 
{ 
if (_x in _stripThese) then 
{ 
_array set[_forEachIndex, -1]; 
}; 
} foreach _array; 
_array = _array - [-1]; 
_string = toString _array; 
_string 
