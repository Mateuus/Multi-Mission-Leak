/*
	Filename: fn_LoSCheck.sqf

	Description: checks if player is in sight of an other player/AI

	Author: SaOk, mod. Blackd0g

	Usage: [player,target] call lhm_fnc_LoSCheck;

	Returns: true if target is in LOS, false if not
*/
private ["_a","_b","_dirTo","_eyeD","_eyePb","_eyePa","_eyeDV"];

_a = param [0,ObjNull,[ObjNull]]; //Player
_b = param [1,ObjNull,[ObjNull]]; //AI to see or not
if(_a isEqualTo ObjNull || _b isEqualTo objNull) exitWith {};

_return = false;

_eyeDV = eyeDirection _b;
_eyeD = ((_eyeDV select 0) atan2 (_eyeDV select 1));
if (_eyeD < 0) then {
	_eyeD = 360 + _eyeD
};

_dirTo = [_b, _a] call BIS_fnc_dirTo;
_eyePb = eyePos _b;
_eyePa = eyePos _a;

if ((abs(_dirTo - _eyeD) >= 90 && (abs(_dirTo - _eyeD) <= 270)) || (lineIntersects [_eyePb, _eyePa]) ||(terrainIntersectASL [_eyePb, _eyePa])) then {
	//hintsilent "NOT IN SIGHT";
	_return = false;
} else {
	//hintsilent "IN SIGHT";
	_return = true;
};
_return