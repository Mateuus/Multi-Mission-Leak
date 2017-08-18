#include <macro.h>
/*
	File: fn_crateMenu.sqf
	Author: Kevin Webb
	
	Description:
	Interaction menu for storage crates.
*/
#define Btn1 37451
#define Btn2 37452
#define Btn3 37453

#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3"];

if(!dialog) then
{
	createDialog "crateInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;};

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;

private["_locked"];

_locked = _curTarget getVariable ["locked_crate",false];

_Btn1 ctrlShow false;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;

life_pInact_curTarget = _curTarget;

_Btn1 ctrlSetText localize "STR_pInact_DragDrop";
if(_curTarget getVariable["Escorting",false]) then
{
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; closeDialog 0;";
}
else
{
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};
_Btn1 ctrlShow true;
if(!(player getVariable["myCrate",false])) then
{
	_Btn1 ctrlEnable false;
};

if(_locked) then
{
	_Btn2 ctrlSetText localize "STR_pInact_CrateUnlock";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_lockCrate; closeDialog 0;";
}
else
{
	_Btn2 ctrlSetText localize "STR_pInact_CrateLock";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_lockCrate; closeDialog 0;";
};
_Btn2 ctrlShow true;
if(!(player getVariable["myCrate",false])) then
{
	_Btn2 ctrlEnable false;
};

_Btn3 ctrlSetText localize "STR_pInact_DestroyCrate";
_Btn3 buttonSetAction "[life_pInAct_curTarget] call life_fnc_handleCrate; closeDialog 0;";
if((__GETC__(life_adminlevel) > 0) || (playerSide != civilian)) then
{
	_Btn3 ctrlShow true;
};