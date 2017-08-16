#include "..\..\script_macros.hpp"
/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn1 37450
#define Btn4 37453
#define Btn7 37456
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn4","_Btn7"];

disableSerialization;
_curTarget = param [0,objNull,[objNull]];

if(player GVAR ["Escorting", false]) then {
	if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
	if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
	if(player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
};

if(!dialog) then {
	createDialog "pInteraction_Menu";
};

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn4 = _display displayCtrl Btn4;
_Btn7 = _display displayCtrl Btn7;
life_pInact_curTarget = _curTarget;

if((player getVariable["isEscorting",false])) then {
	{ _x ctrlShow false; } forEach [_Btn1,_Btn7];
};

//Set Unrestrain Button
_Btn1 ctrlSetText  "Freilassen";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

//Set Escort Button
if((player getVariable["isEscorting",false])) then {
	_Btn4 ctrlSetText  "Eskortieren stoppen";
	_Btn4 buttonSetAction "[] call life_fnc_stopEscorting; closeDialog 0;";
} else {
	_Btn4 ctrlSetText  "Spieler eskortieren";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

_Btn7 ctrlSetText  "Ins Fahrzeug setzen";
_Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";
