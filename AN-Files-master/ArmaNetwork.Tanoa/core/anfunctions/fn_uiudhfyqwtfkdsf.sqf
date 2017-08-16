/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
params [
	["_string","",[""]],
	["_array",[],[[]]]
];

//diag_log format ["STRING: %1 --- ARRAY: %2",_string,_array];

private _result = -1;

if(count _array isEqualTo 0) exitWith 
{
	_result
};

{
  	private _stringMatch = _x select 0;
  	if (_string isEqualTo _stringMatch) exitWith 
  	{
  		_result = _forEachIndex;
  	};
} forEach _array;

//diag_log format ["ARRAY RESULT: %1",_result];

_result
