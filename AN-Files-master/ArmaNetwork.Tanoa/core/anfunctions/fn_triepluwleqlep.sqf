#include <macro.h>
/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the revive process on the player.
*/
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title"];
_target = param [0,ObjNull,[ObjNull]];
_distance = param [1,false,[false]];
//if(alive _target) exitWith {};
if(isNull _target) exitWith {deleteVehicle _target;};

_revivable = _target getVariable ["Revive",false];
if(_revivable) exitWith {};
if(_target getVariable ["Reviving",ObjNull] isEqualTo player) exitWith {hintSilent localize "STR_Medic_AlreadyReviving";};
if(_target getVariable "eg_cancelRevive") exitWith {hintSilent "You cannot revive that player";};
if!(_distance) then {
	if(player distance _target > 4) exitWith {life_action_inUse = false; life_interrupted = false; hintSilent "Not close enough to start reviving";};
};
_targetName = "Deadman";
_title = format[localize "STR_Medic_Progress",_targetName];
life_action_inUse = true;
_target setVariable ["Reviving",player,true];
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText format["Reviving %1...",_targetName];
_anim = ["medic"] call life_fnc_yufanuyaw;
_progressTime = (20 / (1 / 0.006));
for [{_i = 0},{_i < 1},{_i = _i + 0.006}] do {
	_progress progressSetPosition _i;
	sleep _progressTime;
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable ["restrained",false])) exitWith {};
	if!(_distance) then {
		if(player distance _target > 4) exitWith {_badDistance = true;};
	};
	if(_target getVariable ["Revive",false]) exitWith {};
	if(_target getVariable ["Reviving",ObjNull] != player) exitWith {};
};
[false] call life_fnc_tufruxatra;
terminate _anim;
player playActionNow "stop";
if(_target getVariable ["Reviving",ObjNull] != player) exitWith {life_action_inUse = false; hintSilent localize "STR_Medic_AlreadyReviving"};
_target setVariable ["Reviving",nil,true];
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if(_target getVariable ["Revive",false]) exitWith {life_action_inUse = false; hintSilent localize "STR_Medic_RevivedRespawned"};
if(player getVariable ["restrained",false]) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
[(getNumber(missionConfigFile >> "Life_Settings" >> "revive_fee")),1,0] call life_fnc_sewawruk;
life_action_inUse = false;
_target setVariable ["Revive",TRUE,TRUE];
//_target setpos (getpos player);
[] remoteExecCall ["life_fnc_ciawluswleyour",_target];
titleText[format[localize "STR_Medic_RevivePayReceive",_targetName,[(getNumber(missionConfigFile >> "Life_Settings" >> "revive_fee"))] call life_fnc_rupadudejat],"PLAIN"];
sleep .6;
player reveal _target;
_target setpos player;
if(!alive _target) then {deleteVehicle _target};
