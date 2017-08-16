/*
    File: fn_profSetUp.sqf
    Original Author: Jacob "PapaBear" Tyler
    rewritten for list display by [midgetgrimm]
    Description:Opens GUI menu, but now is structured and pulls in lhm_prof based on having any and is selectable to view
*/


private ["_dialog","_Names","_lvl","_exp","_expLeft","_flag","_profText","_profTextGER","_data","_profLevel","_profExp"];
createDialog "lhm_prof_dialog";
disableSerialization;
_dialog = findDisplay 7730;
_Names = _dialog displayCtrl 7731;
_lvl = _dialog displayCtrl 7732;
_exp = _dialog displayCtrl 7733;
_expLeft = _dialog displayCtrl 7734;
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"sec"};};

_lvl ctrlSetText "0";
_exp ctrlSetText "0";
_expLeft ctrlSetText "0";
lbClear _Names;
 ctrlSetText[7858,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];
{
    _profText = [_x select 0] call lhm_fnc_profType;
    _profTextGER = [_x select 0] call lhm_fnc_profTranslate;
    _data = missionNamespace getVariable (_x select 0);
    _profLevel = _data select 0;
    _profExp = _data select 1;
    if(_profExp > 0 || _profLevel >= 1) then {
        if(_x select 1 == _flag) then {
            _Names lbAdd format["%1",_profTextGER];
            _Names lbSetData [(lbSize _Names)-1,str(_profText)];
        };
    };
} foreach lhm_prof;