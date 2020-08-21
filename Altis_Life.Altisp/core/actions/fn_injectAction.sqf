/*
    File: fn_injectAction.sqf
    Author: Ilusionz

    Description:
	Handles the animation and script execution for medics when using Morphine on an injured person.
*/

private["_target"];

_target = cursorTarget;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

if(life_inv_morphine != 0) then {
	titleText[localize "STR_NOTF_Morphine","PLAIN"];
	[player,"AinvPknlMstpSnonWrflDnon_medic1"] remoteExec ["life_fnc_animSync",0];
	sleep 2;
	titleText[localize "STR_NOTF_MorphineInj","PLAIN"];
	[] remoteExec ["life_fnc_morphine",_target];
	[false,"morphine",1] call life_fnc_handleinv;
	player playMoveNow "AmovPercMstpSnonWnonDnon";
};