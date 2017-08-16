#include "..\..\macros.hpp"
/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?
if((player distance _unit > 3)) exitWith {};

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;
player say3D "cuff"; 	//cuff sound

format["%1 wurden die Handschellen von %2 abgenommen.",getPlayerDName(_unit), getMyDName] remoteExec ["systemChat",-2];