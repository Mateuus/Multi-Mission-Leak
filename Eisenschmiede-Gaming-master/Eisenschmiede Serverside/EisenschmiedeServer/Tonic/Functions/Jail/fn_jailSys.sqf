#include "\EisenschmiedeServer\Tonic\script_macros.hpp"
/*
	File: fn_jailSys.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	I forget?
*/
private["_unit","_bad","_id","_ret"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_id = owner _unit;

_ret = [_unit] call ES_fnc_wantedPerson;
[_ret,_bad] remoteExec ["ES_fnc_jailMe",_id];