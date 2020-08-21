#include "..\..\script_macros.hpp"
/*
	File: fn_civInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various cop actions towards another player.
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
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];

disableSerialization;
_curTarget = param [0,objNull,[objNull]];

if(!license_civ_rebel) exitWith {};
if(player GVAR ["Escorting", false]) then {
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == independent) exitWith {closeDialog 0;}; //Bad side check?
if(player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
};

if(!dialog) then {
	createDialog "pInteraction_Menu";
};

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
life_pInact_curTarget = _curTarget;

if((player getVariable["isEscorting",false])) then {
	{ _x ctrlShow false; } forEach [_Btn1,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9];
};

//Set Untie Button
_Btn1 ctrlSetText localize "STR_pInAct_Untie";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_untie; closeDialog 0;";

//Set Escort Button
if((player getVariable["isEscorting",false])) then {
	_Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn2 buttonSetAction "[] call life_fnc_stopEscorting; closeDialog 0;";
} else {
	_Btn2 ctrlSetText localize "STR_pInAct_Escort";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";

//Seize Weapons Button
_Btn4 ctrlSetText localize "STR_pInAct_Seize";
_Btn4 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_seizePlayerAction; closeDialog 0;";

_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;