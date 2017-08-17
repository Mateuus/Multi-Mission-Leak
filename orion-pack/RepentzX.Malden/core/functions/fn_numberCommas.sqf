/*
    Convert numbers to a string representation with commas.
*/


_numArr = toArray (_this call BIS_fnc_numberText); 
_numArr = _numArr apply {[_x,44] select (_x / 32 isEqualTo 1)}; 
toString _numArr
