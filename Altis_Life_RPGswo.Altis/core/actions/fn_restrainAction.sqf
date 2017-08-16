#include "..\..\macros.hpp"
/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
//if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!
player say3D "cuff"; 	//cuff sound

_unit setVariable["restrained",true,true];
[player] remoteExec ["DWEV_fnc_restrain", _unit]; // !! KEIN remoteExec erlaubt !!!

if((side player) == west) then 
{
	format["%1 wurde von %2 festgenommen.",getPlayerDName(_unit), getMyDName] remoteExec ["systemChat",-2];
};

if((side player)== east) then 
{
	format["%1 wurde von %2 festgenommen.",getPlayerDName(_unit), getMyDName] remoteExec ["systemChat",-2];
	};

if((side player)== civilian) then 
{
	format["%2 hat %1 gefesselt und geknebelt.",getPlayerDName(_unit), getMyDName] remoteExec ["systemChat",-2];
};