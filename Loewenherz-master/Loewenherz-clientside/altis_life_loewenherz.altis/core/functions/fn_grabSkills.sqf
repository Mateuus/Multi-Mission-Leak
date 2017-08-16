/*
    File: fn_grabSkills.sqf
    Author: [midgetgrimm]
    diag_log format["%1",];
*/
private["_display","_lvl","_exp","_profText","_expLeft","_profName","_data","_profLevel","_nextLevel"];
disableSerialization;
_display = findDisplay 7730;
_lvl = _display displayCtrl 7732;
_exp = _display displayCtrl 7733;
_expLeft = _display displayCtrl 7734;
lbClear _lvl;
lbClear _exp;
lbClear _expLeft;
_profText = lbData[7731,(lbCurSel 7731)];
diag_log format["grabSKills_profText uncompiled : %1",_profText];
_profText = call compile format["%1", _profText];
diag_log format["grabSKills_profType compiled: %1",_profText];
_profName = [_profText] call lhm_fnc_profType;

_data = missionNamespace getVariable (_profName);
diag_log format["GSRQ2_data:%1",_data];
_profLevel = _data select 0;
diag_log format["GSRQ3_profLevel:%1",_profLevel];
_profExp = _data select 1;
diag_log format["GSRQ4_profExp:%1",_profExp];
_nextLevel = 0;
_nextLevel = _profLevel * ( _profLevel - 1) * 500 ;

if(_nextLevel < 1) then {_nextLevel = 500;};
_expLeft ctrlSetText format["%1",[_nextLevel]call lhm_fnc_numberText];
//_expLeft lbSetData [(lbSize _expLeft)-1,str(_nextLevel)];
_exp ctrlSetText format["%1",[_profExp]call lhm_fnc_numberText];
//_exp lbSetData [(lbSize _exp)-1,str(_profExp)];
if(_proflevel < 10) then {
	_lvl ctrlSetText format["0%1",_profLevel];
} else {
	_lvl ctrlSetText format["%1",_profLevel];
};

//_lvl lbSetData [(lbSize _lvl)-1,str(_profLevel)];