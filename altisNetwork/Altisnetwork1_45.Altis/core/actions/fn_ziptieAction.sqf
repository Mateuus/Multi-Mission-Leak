#include "..\..\script_macros.hpp"
/*
	File: fn_ziptieAction.sqf
	Author: [RGN] noms

	TODO: FINISH THIS
		- ADD KEYHANDLER EVENT
		- CHECK FOR ZIPTIE IN INVENTORY & REMOVE


	Description:
	Zipties the target.
*/
/*private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit GetVariable "restrained")) exitWith {};
if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

_unit SetVariable["restrained",true,true];
[player] remoteExec ["life_fnc_restrain",_unit];
[0,"STR_NOTF_Ziptied",true,[_unit GetVariable["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
[0,"STR_NOTF_ZiptiedCiv",true,[_unit GetVariable["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",civilian];
[getPlayerUID _robber,_robber GetVariable ["realname",name _robber],"203"] remoteExecCall ["life_fnc_wantedAdd",RSERV];*/

private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "restrained")) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};

_unit setVariable["restrained",true,true];
_unit setVariable["restrainedType","zip",true];
[player] remoteExec ["life_fnc_zipTie",_unit];
//[[getPlayerUID player,player getVariable["realname",profileName],"203"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
hint "You have been added to the wanted list for kidnapping";
[0,"STR_NOTF_Ziptied",true,[_unit GetVariable["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
[0,"STR_NOTF_ZiptiedCiv",true,[_unit GetVariable["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",civilian];
