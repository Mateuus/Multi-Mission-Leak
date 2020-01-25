/*
	File: fn_robAction.sqf
	
	
	Description:
	Starts the robbing process?
*/
private["_target"];
_target = cursorTarget;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

player switchMove "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";
[player,"amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon"] remoteExecCall ["life_fnc_animSync"];

if(_target getVariable["robbed",false]) exitWith {};
[player] remoteExecCall ["life_fnc_robPerson",_target];
_reason = "212";

_target setVariable["robbed",TRUE,TRUE];
[player,player,_reason] spawn life_fnc_createEvidence;