private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if(!(_unit getVariable "Escorting")) exitWith {};
if(side _unit != civilian) exitWith {};
if(isNull _unit) exitWith {};
detach _unit;
_unit setVariable["Escorting",false,true];