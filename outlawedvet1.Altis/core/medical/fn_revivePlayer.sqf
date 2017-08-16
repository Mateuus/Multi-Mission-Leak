#include "..\..\script_macros.hpp"
/*
    File: fn_revivePlayer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the revive process on the player.
*/
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title","_reviveCost","_time","_bad"];
_target = param [0,objNull,[objNull]];
if (isNull _target) exitWith {};
_reviveCost = LIFE_SETTINGS(getNumber,"revive_fee");
_time = 0.1;
_bad = 0;
if(playerSide isequalto independent) then {
		switch (FETCH_CONST(life_mediclevel)) do
				{
					case 0: {_time = 0.025;};
					case 1: {_time = 0.0275;};
					case 2: {_time = 0.0300;};
					case 3: {_time = 0.0325;};
					case 4: {_time = 0.0350;};
					case 5: {_time = 0.0375;};
				};
};


_revivable = _target getVariable ["Revive",false];
if (_revivable) exitWith {};
if (_target getVariable ["Reviving",objNull] isEqualTo player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
if (player distance _target > 5) exitWith {}; //Not close enough.

//Fetch their name so we can shout it.
_targetName = _target getVariable ["name","Unknown"];
_title = format[localize "STR_Medic_Progress",_targetName];
life_action_inUse = true; //Lockout the controls.

_target setVariable ["Reviving",player,true];
//Setup our progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

//Lets reuse the same thing!
for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };

    UiSleep .15;
    _cP = _cP + _time;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if (_cP >= 1 || !alive player) exitWith {};
    if (life_istazed) exitWith {_bad = 1;}; //Tazed
    if (life_isknocked) exitWith {_bad = 1;}; //Knocked
    if (life_interrupted) exitWith {_bad = 1;};
    if (player getVariable ["restrained",false]) exitWith {_bad = 1;};
    if (player distance _target > 5.5) exitWith {_bad = 1;};
    if (_target getVariable ["Revive",false]) exitWith {_bad = 1;};
    if (_target getVariable ["Reviving",objNull] != player) exitWith {_bad = 1;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(_bad isequalto 1) exitWith {titleText["Too far away from the victim!","PLAIN"]; life_action_inUse = false;};

if (_target getVariable ["Reviving",objNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving"};
_target setVariable ["Reviving",NIL,true];

if (!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;};
if (_target getVariable ["Revive",false]) exitWith {hint localize "STR_Medic_RevivedRespawned"};
if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;};
if (!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

BANK = BANK + _reviveCost;
[1] call SOCK_fnc_updatePartial;
[] call life_fnc_playerSkins;

life_action_inUse = false;
_target setVariable ["Revive",true,true];
[profileName] remoteExecCall ["life_fnc_revived",_target];
titleText[format[localize "STR_Medic_RevivePayReceive",_targetName,[_reviveCost] call life_fnc_numberText],"PLAIN"];

UiSleep .6;
player reveal _target;