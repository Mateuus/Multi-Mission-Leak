#include <macro.h>
/*
	File: fn_handleCrate.sqf
	Author: Kevin Webb
	
	Description:
	Deletes the crate.
*/
private["_crate"];
_crate = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(__GETC__(life_adminlevel) > 0 || playerSide != civilian ) then
{
	deleteVehicle _crate;
};