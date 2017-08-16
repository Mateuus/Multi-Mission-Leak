#include "..\..\script_macros.hpp"
/*
	File: fn_medicInteractionMenu.sqf
	Author: BlackScaryZ

	Description:
	Nouvel fonction médic (Injecter de la morphine et Escorter joueur si civil et medic + que infirmier).
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];

disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;};

if(!dialog) then {
	createDialog "pInteraction_Menu";
};

if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;};
if(player distance _curTarget > 4 ) exitWith {closeDialog 0;};

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
life_pInact_curTarget = _curTarget;

_Btn1 ctrlSetText localize "STR_Injection_Morphine";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_injectionMorphine; closeDialog 0;";

//Set Escort Button
if((side _curTarget == civilian) && (_curTarget GVAR ["restrained",false])) then {
	if((_curTarget getVariable["Escorting",false])) then {
		_Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_medicInteractionMenu;";
	} else {
		_Btn2 ctrlSetText localize "STR_pInAct_Escort";
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
	};
} else {
	_Btn2 ctrlShow false;
};
_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;
_Btn10 ctrlShow false;
