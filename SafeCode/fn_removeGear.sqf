#include <macro.h>
/*
	File: fn_removeGear.sqf
	Author: Michael Francis
	
	Description:
	Allow cops to remove clothing items from restrained players
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6"];
createDialog "removeGear_Menu";
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {hint "Wrong target!"; closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {hint "Cannot perform this action!"; closeDialog 0;}; //Bad side

_display = findDisplay 42000;
_Btn1 = _display displayCtrl 42002;
_Btn2 = _display displayCtrl 42003;
_Btn3 = _display displayCtrl 42004;
_Btn4 = _display displayCtrl 42005;
_Btn5 = _display displayCtrl 42006;
_Btn6 = _display displayCtrl 42007;
life_pInact_curTarget = _curTarget;

//Headgear
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_removeHeadgear; closeDialog 0;";

//Goggles
_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_removeGoggles; closeDialog 0;";

//Vests
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_removeVest; closeDialog 0;";

//Backpack
_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_removeBackpack; closeDialog 0;";

//Uniform
_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_removeUniform; closeDialog 0;";

//All Gear
_Btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_removeAllGear; closeDialog 0;";

if(__GETC__(life_coplevel) < 2 ) then
{
	_Btn3 ctrlEnable false;
	_Btn4 ctrlEnable false;
	_Btn5 ctrlEnable false;
	_Btn6 ctrlEnable false;
};