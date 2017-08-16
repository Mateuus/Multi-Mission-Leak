#include "..\..\script_macros.hpp"
/*
    File: fn_revivePlayer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the revive process on the player.
*/
private ["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title","_reviveCost"];
_target = param [0,objNull,[objNull]];
if (isNull _target) exitWith {};
_reviveCost = LIFE_SETTINGS(getNumber,"revive_fee");

_revivable = _target getVariable ["Revive",false];
if (_revivable) exitWith {};
if (_target getVariable ["Reviving",objNull] isEqualTo player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
if (player distance _target > 5) exitWith {}; //Not close enough.

//Fetch their name so we can shout it.
_targetName = _target getVariable ["name","Unknown"];
_title = format [localize "STR_Medic_Progress",_targetName];
life_action_inUse = true; //Lockout the controls.

_target setVariable ["Reviving",player,true];
//Setup our progress bar
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_t2 = "Fertig";
//Lets reuse the same thing!
for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };

    sleep .15;
    _cP = _cP + .01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if (_cP >= 1 || !alive player) exitWith {};
    if (player getVariable ["istazed",false]) exitWith {_t2 = "Abgebrochen";}; //Tazed
    if (life_isknocked) exitWith {_t2 = "Abgebrochen";}; //Knocked
    if (life_interrupted) exitWith {_t2 = "Abgebrochen";};
    if (player getVariable ["restrained",false]) exitWith {_t2 = "Abgebrochen";};
    if (player distance _target > 4) exitWith {_badDistance = true; _t2 = "Abgebrochen";};
    if (_target getVariable ["Revive",false]) exitWith {_t2 = "Abgebrochen";};
    if (_target getVariable ["Reviving",objNull] != player) exitWith {_t2 = "Abgebrochen";};
	if(player getVariable["esg_bewusstlos",false])exitWith {_t2 = "Abgebrochen";};
};

//Kill the UI display and check for various states
for "_i" from 0 to 1 step 0 do {
	sleep .0006;
	_cP = _cP - .01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format ["%1 (%2)",_title,_t2];
	if (_cP <= 0 || !alive player) exitWith {};
};
"progressBar" cutFadeOut 1;
player playActionNow "stop";

if (_target getVariable ["Reviving",objNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving"};
_target setVariable ["Reviving",NIL,true];

if (!alive player || (player getVariable ["istazed",false]) || life_isknocked) exitWith {life_action_inUse = false;};
if (_target getVariable ["Revive",false]) exitWith {hint localize "STR_Medic_RevivedRespawned"};
if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;};
if (!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(player getVariable["esg_bewusstlos",false])exitWith {life_action_inUse = false;};

_dice = random(100);
if(_dice < 20) then {
	BANK = BANK + _reviveCost;
	[1] call SOCK_fnc_updatePartial;
	life_action_inUse = false;
	_target setVariable ["Revive",true,true];
	[profileName] remoteExecCall ["life_fnc_revived",_target];
	titleText[format [localize "STR_Medic_RevivePayReceive",_targetName,[_reviveCost] call life_fnc_numberText],"PLAIN"];
} else {
	hint "Der Patient konnte nicht wiederbelebt werden und verstirbt nun!";
	[player getVariable ["realname",name player]] remoteExec ["ESG_fnc_respawnhim",_target];
};

sleep .6;
player reveal _target;