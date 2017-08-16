/*
	RandomRound
	Original Author: Unknown
	Was part of the dynamic Market System!
	---------------------------------------
	HACK THE BANK!
	Autor: stolzerrabe

	This script returns a random value, selected of 2 Values
	
	_randomValue = [_var1,_var2] call ES_fnc_randomRound; 
	example:
	_randomValue = [10,100] call ES_fnc_randomRoundM;
	
	Returns a value between 10 and 100
	
*/

private["_var1", "_var2", "_ret"];

_var1 = _this select 0;
_var2 = _this select 1;
_ret = _var1 + random (_var2 - _var1);
_ret = round _ret;
_ret;