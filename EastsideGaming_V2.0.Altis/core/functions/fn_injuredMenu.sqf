#include "..\..\script_macros.hpp"
/*
    File: fn_injuredMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn0 37450
#define Btn1 37451
#define Btn2 37452
#define Btn3 37453
#define Btn4 37454
#define Btn5 37455
#define Btn6 37456
#define Btn7 37457
#define Btn8 37458
#define Btn9 28547
#define Title 37401

private ["_display","_curTarget","_seizeRank","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];

disableSerialization;
_curTarget = param [0,objNull,[objNull]];

if (player getVariable ["Escorting", false]) then {
    if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
    if (!isPlayer _curTarget) exitWith {closeDialog 0;}; //Bad side check?
	if (player distance _curTarget > 4 ) exitWith {closeDialog 0;};
};

if (!dialog) then {
    createDialog "pInteraction_Menu";
};

_display = findDisplay 37400;
_Btn0 = _display displayCtrl Btn0;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
life_pInact_curTarget = _curTarget;
{ _x ctrlShow false; } forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9];
if(playerSide isEqualTo independent)then {_Btn1 ctrlShow true;};



_Btn0 ctrlSetText "Person stabilisieren";
_Btn0 buttonSetAction "[life_pInact_curTarget]spawn ESG_fnc_stabilise; closeDialog 0;";


_Btn1 ctrlSetText "Herzdruckmassage";
_Btn1 buttonSetAction "[life_pInact_curTarget]spawn ESG_fnc_getback; closeDialog 0;";