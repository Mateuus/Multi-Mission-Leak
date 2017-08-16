/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //

if((_unit getVariable "restrained")) then {
[true,"handcuffs",1] call life_fnc_handleInv;
} else {
[true,"zipties",1] call life_fnc_handleInv;
};

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["civrestrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;

[[0,"STR_NOTF_Unrestrain",true,[_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",west,FALSE] call life_fnc_MP; 