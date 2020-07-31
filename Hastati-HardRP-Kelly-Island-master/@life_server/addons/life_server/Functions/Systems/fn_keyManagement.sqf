/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Keeps track of an array locally on the server of a players keys.
*/
private["_uid","_side","_input","_mode","_arr"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[sideUnknown]] call BIS_fnc_param;
_mode = [_this,3,0,[0]] call BIS_fnc_param;

if(_uid == "" OR _side == sideUnknown) exitWith {}; //BAAAAAAAAADDDDDDDD

switch(_mode) do {
	case 0: {
		_input = [_this,2,[],[[]]] call BIS_fnc_param;
		_arr = [];
		{
			if(!isNull _x && {!(_x isKindOf "House")}) then {
				_arr pushBack _x;
			};
		} foreach _input;
		
		_arr = _arr - [ObjNull];
		missionNamespace setVariable[format["%1_KEYS_%2",_uid,_side],_arr];
	};
	
	case 1: {
		_input = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
		if(isNull _input OR _input isKindOf "House") exitWith {};
		_arr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]];
		_arr pushBack _input;
		_arr = _arr - [ObjNull];
		missionNamespace setVariable[format["%1_KEYS_%2",_uid,_side],_arr];
	};
	
	case 2: {
		_arr = missionNamespace getVariable[format["%1_KEYS_%2",_uid,_side],[]];
		_arr = _arr - [ObjNull];
		missionNamespace setVariable[format["%1_KEYS_%2",_uid,_side],_arr];
	};
};