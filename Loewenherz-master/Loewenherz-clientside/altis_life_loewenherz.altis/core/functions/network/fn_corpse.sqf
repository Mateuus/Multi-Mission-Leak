/*
	File: fn_corpse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Hides dead bodies.
*/
private["_corpse"];
_corpse = param [0,ObjNull,[ObjNull]];
if(isNull _corpse) exitWith {};
if(alive _corpse) exitWith {}; //Stop script kiddies.

_corpse hideObject true;