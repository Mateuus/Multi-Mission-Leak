/*
	File: fn_catchTurtle.sqf
	
	
	Description:
	Catches a dead turtle?
*/
private["_obj"];
_obj = param [0,ObjNull,[ObjNull]];
if(isNull _obj) exitWith {}; //Not valid
if(alive _obj) exitWith {}; //It's alive, don't take it charlie!

if(([true,"turtle",1] call life_fnc_handleInv)) then
{
	deleteVehicle _obj;
	[localize "STR_NOTF_CaughtTurtle", false] spawn domsg;
};

_chance = round (random 100);
if(_chance > 85) then {
	["danimal", false] remoteExec ["fnc_dispatch",west];	
};