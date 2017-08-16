#include "..\..\script_macros.hpp"
/*
    File: fn_defuseKit.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Defuses blasting charges for the cops?
*/
private["_vault","_ui","_title","_progressBar","_cP","_titleText","_time","_bad"];
_vault = param [0,objNull,[objNull]];
_bad = 0;

if (isNull _vault) exitWith {};
if (typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint localize "STR_ISTR_defuseKit_NotNear"};
if (!(_vault getVariable ["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Defuse_Nothing"};

life_action_inUse = true;
//Setup the progress bar
disableSerialization;

_time = 0.1;
if(playerSide isequalto west) then {
		switch (FETCH_CONST(life_coplevel)) do
				{
					case 0: {_time = 0.0035;};
					case 1: {_time = 0.0045;};
					case 2: {_time = 0.0055;};
					case 3: {_time = 0.0065;};
					case 4: {_time = 0.0075;};
					case 5: {_time = 0.0085;};
					case 6: {_time = 0.0095;};
					case 7: {_time = 0.0105;};
					case 8: {_time = 0.0115;};
					case 9: {_time = 0.0125;};
				};
};

_title = localize "STR_ISTR_Defuse_Process";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    sleep 0.26;
    if (isNull _ui) then {
        5 cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + _time;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(player distance _vault > 12) exitWith {_bad = 1;};
    if (_cP >= 1 || !alive player) exitWith {_bad = 1;};
    if (life_interrupted) exitWith {_bad = 1;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(_bad isequalto 1) exitWith {titleText[localize "STR_NOTF_FRDefuse_fail","PLAIN"]; life_action_inUse = false; 5 cutText ["","PLAIN"];};

if (!alive player) exitWith {life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

life_action_inUse = false;
_vault setVariable ["chargeplaced",false,true];
deleteMarker "markerblast";
[0,localize "STR_ISTR_Defuse_Success"] remoteExecCall ["life_fnc_broadcast",west];