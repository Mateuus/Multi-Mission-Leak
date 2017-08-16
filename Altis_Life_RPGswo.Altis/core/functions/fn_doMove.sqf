/*
	File: fn_doMove.sqf
*/
private["_unit","_pos"];
_unit = param [0,ObjNull,[ObjNull]];
_pos = param [1,[0,0,0],[[]]];
if(isNull _unit) exitWith {};
systemChat format ["DEBUG: Der Fahrer hat einen Fahrbefehl bekommen. Er soll zu Coordinate %1 fahren",_pos];
[_unit] joinSilent player;
_unit doMove _pos;
//[_unit] joinSilent (createGroup civilian);