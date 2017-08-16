#include "..\..\script_macros.hpp"
/*
    File: fn_medInteractionMenu.sqf
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
    if (player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
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
{ _x ctrlShow false; } forEach [_Btn5,_Btn6,_Btn7,_Btn8,_Btn9];
if (player getVariable ["isEscorting",false]) then {
    { _x ctrlShow false; } forEach [_Btn4,_Btn3,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9];
};

if(((getdammage life_pInact_curTarget) > 0)) then 
{
	_Btn0 ctrlSetText "Person bandagieren";
	_Btn0 buttonSetAction "[life_pInact_curTarget,playerSide] spawn ESG_fnc_bandage; closeDialog 0;";
}
else
{
	_Btn0 ctrlEnable false;
	_Btn0 ctrlSetText "Person bandagieren";
};

//Set Check Licenses Button
_Btn1 ctrlSetText "Ausweis zeigen";
_Btn1 buttonSetAction "[ESG_ausweis,player] remoteExec [""ESG_fnc_ausweis_zeigen"",life_pInact_curTarget]; closeDialog 0;";

//Set Escort Button
if (player getVariable ["isEscorting",false]) then {
    _Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
    _Btn2 buttonSetAction "[] call life_fnc_stopEscorting; closeDialog 0;";
} else {
    _Btn2 ctrlSetText localize "STR_pInAct_Escort";
    _Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

//Set Ticket Button
_Btn3 ctrlSetText localize "STR_pInAct_TicketBtn";
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";

_Btn4 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";