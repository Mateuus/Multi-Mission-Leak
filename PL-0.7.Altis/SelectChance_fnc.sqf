#include "script_macros.hpp"
// ------------------------------------------------------------------------------
//	
//			Functions
//	
//			Author: Skrow & Skyfezzer
//   	
//------------------------------------------------------------------------------	
//-------------------------------------------------------------
// Combine Elements
//-------------------------------------------------------------
LB_CombineArrayElements = {
	_in = _this select 0;
	_out = [];
	{
		_out pushBackUnique _x;
		true
	}count _in;

	_out = _out apply {	
		_element = _x;
		_count = {_element == _x} count _in;
		[_x,_count];
	};
	_out;
};
//------------------------------------------------------------
// Alternative method, does the same thing but abit slower for 
// larger arrays, pretty pointless but hey
//------------------------------------------------------------
LB_CombineArrayElementsAlternate = {
	_in = _this select 0;
	_uniqueElements = [];
	_out = [];
	{
		if !(_x in _uniqueElements) then {
			_uniqueElements pushBack _x;
		};
	}forEach _in;

	{	
		_type = _x;
		_count = {_x == _type} count _in;
		_out pushBack [_x,_count];
	} forEach _uniqueElements;
	_out;
};
//------------------------------------------------------------
// Selects an element from array based on chance
//------------------------------------------------------------
LB_SelectByChance = {
	private ["_in","_randomVal","_range","_index"];
	_in = [_this,0,[],[[]]] call BIS_fnc_param;
	_range = 0;
	{
		_range = _range + (_x select 1);
	} forEach _in;
	_randomVal = round(random _range);

	_int = 0;
	{
		_int = _int + (_x select 1);
		if (_randomVal < _int) exitWith {_index = _forEachIndex};
	}forEach _in;
	_out = (_in select _index) select 0;
	_out;
};

