#define SEL(ARRAY,INDEX) (ARRAY select INDEX)
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
/*
File: fn_mresToArray.sqf
Author: Bryan "Tonic" Boardwine";

Description:
Acts as a mres (MySQL Real Escape) for arrays so they
can be properly inserted into the database without causing
any problems. The return method is 'hacky' but it's effective.
*/
private "_array";
_array = [_this,0,"",[""]] call BIS_fnc_param;
if(EQUAL(_array,"")) exitWith {[]};
_array = toArray(_array);

/* Array Validation, if the string is not equal to an array format then return an empty array to stop the calling and compiling of a code injection */
if(!(EQUAL(SEL(_array,0),91)) OR !(EQUAL(SEL(_array,(count _array)-1),93))) exitWith {[]};

for "_i" from 0 to (count _array)-1 do {
_sel = _array select _i;
if(_sel == 96) then {
_array set[_i,39];
};
};

_array = call compile format["%1",toString(_array)];
_array;