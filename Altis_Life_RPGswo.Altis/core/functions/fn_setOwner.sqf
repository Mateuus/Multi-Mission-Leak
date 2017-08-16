/*
	File: fn_doMove.sqf
*/
private["_unit","_owner"];
_unit = param [0,ObjNull,[ObjNull]];
_owner = param [1,0,[0]];
if(isNull _unit) exitWith {};
systemChat "DEBUG: Es wurde ein neuer Owner für ein Object gesetzt";
_unit setOwner _owner;