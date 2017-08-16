/*
	File: fn_civInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/

if(player getVariable ["restrained",false]) exitWith { closeDialog 0; hint "Du bist gefesselt!";};

//Glitch Fix
if(player distance cursorTarget > 4) exitWith {};

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

private["_display","_unit","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(!isPlayer _curTarget && (side _curTarget == civilian || side _curTarget == east)) exitWith {closeDialog 0;}; //Bad side check?
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
ES_pInact_curTarget = _curTarget;

_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;
_Btn10 ctrlShow false;

//Set Robber Button
_Btn1 ctrlSetText localize "STR_pInAct_rob";
_Btn1 buttonSetAction "[ES_pInact_curTarget] call ES_fnc_robAction; closeDialog 0;";

//Set Escort Button
if((_curTarget getVariable["Escorting",false])) then {
	_Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn2 buttonSetAction "[ES_pInact_curTarget] call ES_fnc_stopEscorting; [ES_pInact_curTarget] call ES_fnc_civInteractionMenu;";
} else {
	_Btn2 ctrlSetText localize "STR_pInAct_Escort";
	_Btn2 buttonSetAction "[ES_pInact_curTarget] call ES_fnc_escortAction; closeDialog 0;";
};

//Set PutInCar Button
_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn3 buttonSetAction "[ES_pInact_curTarget] call ES_fnc_putInCar; closeDialog 0;";

//Set PutInCar Button
_Btn4 ctrlSetText localize "STR_pInAct_augenbinde";
_Btn4 buttonSetAction "[ES_pInact_curTarget] call ES_fnc_blindfoldoff; closeDialog 0;";