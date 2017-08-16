/*
	File: fn_radarFalleMenu.sqf
	Author: Skrow & Skyfezzer
	
	Description:
	Replaces the mass addactions for various vehicle actions
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_name","_name1","_limit","_limit1"];
if(!dialog) then {
	createDialog "radarfalle";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_isradarfalle = if(_curTarget isKindOf "Land_Runway_PAPI_4") then {true} else {false};
if(!_isradarfalle) exitWith {closeDialog 0;};
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_display = findDisplay 61000;
_Btn1 = _display displayCtrl 61003;
_Btn2 = _display displayCtrl 61004;
_Btn3 = _display displayCtrl 61005;
_Btn4 = _display displayCtrl 61006;
_Btn5 = _display displayCtrl 61007;
_name = _display displayCtrl 61001;
_limit = _display displayCtrl 61002;
life_stnact_curTarget = _curTarget;
_name1 = life_stnact_curTarget getVariable ["speedtrap_name", false];
_name ctrlSetStructuredText parseText format["<t align='center'>%1</t></t>",_name1];

_limit1 = life_stnact_curTarget getVariable ["speedtrap_speedlimit", false];
_limit ctrlSetStructuredText parseText format["<t align='center'>%1</t></t>",_limit1];

_status = life_stnact_curTarget getVariable ["speedtrap_active", false];
if(_status) then
{
_Btn1 ctrlSetText format["Désactiver"];
_Btn1 buttonSetAction "closeDialog 0;[life_stnact_curTarget] spawn life_fnc_speedtrapActivate;";
}else{
_Btn1 ctrlSetText format["Allumer"];
_Btn1 buttonSetAction "closeDialog 0;[life_stnact_curTarget] spawn life_fnc_speedtrapActivate;";
};
_Btn2 ctrlSetText format["Péllicule"];
_Btn2 buttonSetAction "closeDialog 0;[1] spawn life_fnc_speedtrapGetPhotoList;";

_Btn3 ctrlSetText format["Données"];
_Btn3 buttonSetAction "closeDialog 0;[0] spawn life_fnc_speedtrapGetPhotoList;";

_Btn4 ctrlSetText format["Régler la vitesse"];
_Btn4 buttonSetAction "closeDialog 0;[life_stnact_curTarget] spawn life_fnc_speedtrapSetSpeedLimit;";

_Btn5 ctrlSetText format["Supprimer"];
_Btn5 buttonSetAction "closeDialog 0;[life_stnact_curTarget] spawn life_fnc_speedtrapRemove;";
