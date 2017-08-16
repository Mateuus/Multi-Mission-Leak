private ["_control","_pagerselect","_var"];
disableSerialization;
_control = ((findDisplay 5689) displayCtrl 8256);
_pagerselect = _control lbData (lbCurSel _control);

_var = getText (missionConfigFile >> "CfgPager" >> "cops" >> "pager" >> _pagerselect >> "var");

player setVariable ["pager",_var,true];

closedialog 0;
[] spawn ES_fnc_pagermenu;