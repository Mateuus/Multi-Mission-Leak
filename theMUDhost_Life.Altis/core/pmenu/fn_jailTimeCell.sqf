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

//30 Seconds
_Btn1 ctrlSetText localize "STR_JailTime_Cell30";
_Btn1 buttonSetAction "[life_pInact_curTarget,0.5] call life_fnc_arrestActionCell; closeDialog 0;";

//1 Minute
_Btn2 ctrlSetText localize "STR_JailTime_Cell1";
_Btn2 buttonSetAction "[life_pInact_curTarget,1] call life_fnc_arrestActionCell; closeDialog 0;";

//2 Minutes
_Btn3 ctrlSetText localize "STR_JailTime_Cell2";
_Btn3 buttonSetAction "[life_pInact_curTarget,2] call life_fnc_arrestActionCell; closeDialog 0;";

//3 Minutes
_Btn4 ctrlSetText localize "STR_JailTime_Cell3";
_Btn4 buttonSetAction "[life_pInact_curTarget,3] call life_fnc_arrestActionCell; closeDialog 0;";

//4 Minutes
_Btn5 ctrlSetText localize "STR_JailTime_Cell4";
_Btn5 buttonSetAction "[life_pInact_curTarget,4] call life_fnc_arrestActionCell; closeDialog 0;";

//5 Minutes
_Btn6 ctrlSetText localize "STR_JailTime_Cell5";
_Btn6 buttonSetAction "[life_pInact_curTarget,5] call life_fnc_arrestActionCell; closeDialog 0;";

//10 Minutes
_Btn7 ctrlSetText localize "STR_JailTime_Cell10";
_Btn7 buttonSetAction "[life_pInact_curTarget,10] call life_fnc_arrestActionCell; closeDialog 0;";