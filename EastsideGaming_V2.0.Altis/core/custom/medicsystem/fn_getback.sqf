#include "..\..\..\script_macros.hpp"
private ["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_opfer = param [0,objNull,[objNull]];
life_interrupted = false;

if (life_action_inUse) exitWith {};
if (isNull _opfer) exitWith {}; //Bad type
if (player distance _opfer > 5) exitWith {}; //Too far
if(_opfer getVariable ["esg_stabinpro",false]) exitWith {hint "Diese Person wird gerade stabilisiert!"};

_title = format ["Wende Herzdruckmassage an %1 an",_opfer getVariable ["realname","ERROR"]];
life_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_t2 = "Fertig";
_opfer setVariable ["esg_stabinpro",true,true];
_time = ["revive"]call ESG_fnc_skilltime;
for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };

    sleep _time;

    if (isNull _ui) then {
        "progressBar" cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + 0.01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];

    if (_cP >= 1 || !alive player) exitWith {};
    if (player getVariable ["istazed",false]) exitWith {_t2 = "Abgebrochen";}; //Tazed
    if (life_isknocked) exitWith {_t2 = "Abgebrochen";}; //Knocked
    if (life_interrupted) exitWith {_t2 = "Abgebrochen";};
    if (player getVariable ["restrained",false]) exitWith {_t2 = "Abgebrochen";};
    if (player distance _opfer > 5) exitWith {_badDistance = true; _t2 = "Abgebrochen";};
	if (!(_opfer getVariable ["esg_bewusstlos",false])) exitWith {_t2 = "Abgebrochen";};
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

if (!alive player || (player getVariable ["istazed",false]) || life_isknocked) exitWith {life_action_inUse = false; _opfer setVariable ["esg_stabinpro",false,true];};
if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false; _opfer setVariable ["esg_stabinpro",false,true];};
if (!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false; _opfer setVariable ["esg_stabinpro",false,true];};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false; _opfer setVariable ["esg_stabinpro",false,true];};
if (!(_opfer getVariable ["esg_bewusstlos",false])) exitWith {life_action_inUse = false; _opfer setVariable ["esg_stabinpro",false,true];};
_opfer setVariable ["esg_stabinpro",false,true];

[player]remoteExec["ESG_fnc_clientgetback",_opfer];
_opfer setUnconscious false;
hint format["Du hast erfolgreich eine Herzmassage an %1 angewendet!",_opfer getVariable ["realname",name _opfer]];
["revive",1]call ESG_fnc_skilladd;

life_action_inUse = false;
