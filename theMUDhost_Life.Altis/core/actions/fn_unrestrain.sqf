/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

if(player getVariable["restrained",false]) exitWith {hint localize "STR_ISTR_Restrained"};
if(player getVariable["Escorting",false]) exitWith {hint localize "STR_ISTR_Restrained"};
if(player getVariable["transporting",false]) exitWith {hint localize "STR_ISTR_Restrained"};
if(player getVariable["zipTie",false]) exitWith {hint localize "STR_ISTR_Restrained"};
if(life_inv_handCuffKey == 0) exitWith { hint "You don't have handcuff keys!";};

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;

player say3D "cuff";

[true,"handCuffs",1] call life_fnc_handleInv;
[[0,"STR_NOTF_Unrestrain",true,[_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",west,FALSE] call life_fnc_MP;