private["_strTwo","_array","_strOne"]; 
_array = _this select 0; 
_strTwo = ""; 
 
 
if (typeName _array == "ARRAY") then 
{ 
for "_i" from 0 to (count _array) -1 do 
{ 
if (_i == ((count _array) -1)) then 
{ 
_strOne = format ["%1", _array select _i]; 
_strTwo = _strTwo + _strOne; 
}else  
{ 
_strOne = format ["%1`", _array select _i]; 
_strTwo = _strTwo + _strOne; 
}; 
}; 
} else { 
_strTwo = _array; 
}; 
 
_strTwo