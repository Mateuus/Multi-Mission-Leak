#include "..\..\script_macros.hpp"
/*
	Author: Fresqo
	
	Description:
	Tortures a player using pliers while they are restrained
*/
private["_unit","_mod","_value","_newDamage","_dist","_inRad"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !(_unit GVAR["civrestrained",FALSE])) exitWith {}; //Error check?
if(_unit GVAR ["tortured",false]) exitWith {hint "You can't torture someone again so soon you monster!"};
if(life_inv_pliers < 1) exitWith {hint "You need pliers to torture someone"};
titleText[format["Stay close to use the pliers on %1",name _unit],"PLAIN"];

sleep 6;
if(player distance _unit > 2) exitWith { hint "You need to stay within 2m of the person to torture!" };
	_dist = 400;
	_inRad = [];
	{if (player distance _x < _dist) then {_inRad pushBack _x};}forEach playableUnits;
	[_unit,"scream",_dist] remoteExec ["life_fnc_playSound",_inRad];
[0,format["%1 is being tortured.",name _unit]] remoteExec ["life_fnc_broadcast",RCLIENT];

_unit SVAR["tortured",TRUE,TRUE];

_newDamage = (damage _unit) + 0.16;
_unit setdamage _newDamage;
_value = 100;
_mod = _newDamage * 100;
_newDamage = round (_value - _mod);

hint format ["%1 has %2 health left",name _unit,_newDamage];

sleep 10;
hint "You have been added to the wanted list for torturing";
[getPlayerUID player,player GVAR ["realname",name player],"300",player] remoteExec ["life_fnc_wantedAdd",RSERV];
sleep 50; 
_unit SVAR["tortured",FALSE,TRUE];



