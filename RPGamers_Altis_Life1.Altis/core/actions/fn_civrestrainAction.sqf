#include "..\..\script_macros.hpp"
/*
    File: fn_restrainAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Retrains the target.
*/
private["_unit"];
_unit = cursorObject;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if((_unit getVariable "restrainedz")) exitWith {};
if(player isEqualTo _unit) exitWith {};
if( animationState _unit != "Incapacitated" && animationState _unit != "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon" ) exitwith {};
if(life_inv_zipties < 1) exitWith { ["You need a zip tie to zip tie someone.",5,"gray"] call RPG_Fnc_Msg; };
life_inv_zipties = life_inv_zipties - 1;
["You have ziptied him",5,"blue"] call RPG_Fnc_Msg;

if(!isPlayer _unit) exitWith {};
//Broadcast!


[_unit,"ziptie"] spawn life_fnc_nearestSound;
_unit setVariable ["playerSurrender",false,true];
_unit setVariable["restrainedz",true,true];
[player] remoteExec ["life_fnc_civrestrain",_unit];
//[0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];