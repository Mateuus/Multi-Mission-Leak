
/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(player getVariable "zipTie") exitWith {};
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 5)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(side _unit == west) exitWith {};
if(!([false,"handCuffs",1] call life_fnc_handleInv)) exitWith {hint "You don't have any handcuffs!"};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

player say3D "cuff";

_unit setVariable["restrained",true,true];
[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
[[0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;