/*
	fn_radioMenu.sqf
*/

disableSerialization;

waitUntil {!isNull findDisplay 37500};
_display = findDisplay 37500;
_Btn1 = _display displayCtrl 37551;
_Btn2 = _display displayCtrl 37552;

if(isNil {call TFAR_fnc_activeSWRadio}) then { 
	_Btn1 ctrlEnable false;
};

if(isNil {profileNamespace getVariable "TFAR_savedSettings"}) then { 
	_Btn2 ctrlEnable false;
};
