#include "..\..\script_macros.hpp"
/*
    File: fn_safeFix.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Piece of functionality for the cops to close the safe (lock it)
*/
private "_vault";
_vault = _this select 0;
if (!(_vault getVariable ["safe_open",false])) exitWith {hint localize "STR_Cop_VaultLocked"};

life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_Cop_RepairVault";
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_t2 = "Fertig";
for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };

    sleep 0.26;

    if (isNull _ui) then {
        "progressBar" cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + .012;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if (_cP >= 1) exitWith {};
	if (!alive player) exitWith {_t2 = "Abgebrochen";};
    if (life_interrupted) exitWith {_t2 = "Abgebrochen";};
	if(player getVariable["esg_bewusstlos",false])exitWith {_t2 = "Abgebrochen";};
	if((player distance _vault) > 4)exitWith {_t2 = "Abgebrochen";};
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
if (!alive player) exitWith {life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(player getVariable["esg_bewusstlos",false])exitWith {life_action_inUse = false;};
if((player distance _vault) > 4)exitWith {life_action_inUse = false;};

life_action_inUse = false;

_vault setVariable ["safe_open",false,true];
hint localize "STR_Cop_VaultRepaired";