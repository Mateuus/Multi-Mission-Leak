#include <macro.h>
/*
	File: fn_jailTime.sqf
	Author: Bloopis
	Date : 05/02/2014
	Traduction : Skydred pour Involved-Gaming.Com	
	Description:
	CREATE AND INIT JAIL MENU WINDOW

	Parameter(s) :
		OBJECT - target

	Returns:
		NULL
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];
createDialog "jailTime_Menu";
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {hint "Wrong target!"; closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {hint "Cannot perform this action!"; closeDialog 0;}; //Bad side check?

_display = findDisplay 40000;
_Btn1 = _display displayCtrl 40002;
_Btn2 = _display displayCtrl 40003;
_Btn3 = _display displayCtrl 40004;
_Btn4 = _display displayCtrl 40005;
_Btn5 = _display DisplayCtrl 40006;
_Btn6 = _display DisplayCtrl 40007;
_Btn7 = _display DisplayCtrl 40008;
life_pInact_curTarget = _curTarget;

//10 Minutes
_Btn1 ctrlSetText localize "STR_JailTime_Jail10";
_Btn1 buttonSetAction "[life_pInact_curTarget,10] call life_fnc_arrestAction; closeDialog 0;";

//15 Minutes
_Btn2 ctrlSetText localize "STR_JailTime_Jail15";
_Btn2 buttonSetAction "[life_pInact_curTarget,15] call life_fnc_arrestAction; closeDialog 0;";

//20 Minutes
_Btn3 ctrlSetText localize "STR_JailTime_Jail20";
_Btn3 buttonSetAction "[life_pInact_curTarget,20] call life_fnc_arrestAction; closeDialog 0;";

//25 Minutes
_Btn4 ctrlSetText localize "STR_JailTime_Jail25";
_Btn4 buttonSetAction "[life_pInact_curTarget,25] call life_fnc_arrestAction; closeDialog 0;";

//30 Minutes
_Btn5 ctrlSetText localize "STR_JailTime_Jail30";
_Btn5 buttonSetAction "[life_pInact_curTarget,30] call life_fnc_arrestAction; closeDialog 0;";

//60 Minutes
_Btn6 ctrlSetText localize "STR_JailTime_Jail60";
_Btn6 buttonSetAction "[life_pInact_curTarget,60] call life_fnc_arrestAction; closeDialog 0;";

//120 Minutes
_Btn7 ctrlSetText localize "STR_JailTime_Jail120";
_Btn7 buttonSetAction "[life_pInact_curTarget,120] call life_fnc_arrestAction; closeDialog 0;";

if(__GETC__(life_coplevel) < 2 ) then
{
	_Btn3 ctrlEnable false;
	_Btn4 ctrlEnable false;
	_Btn5 ctrlEnable false;
	_Btn6 ctrlEnable false;
	_Btn7 ctrlEnable false;
};

if(__GETC__(life_coplevel) < 6) then
{
	_Btn7 ctrlEnable false;
};