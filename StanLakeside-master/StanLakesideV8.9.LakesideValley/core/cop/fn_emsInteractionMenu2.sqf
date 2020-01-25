/*
	File: fn_emsInteractionMenu.sqf

*/
closedialog 0;
uisleep 0.1;

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
#define Btn11 37460
#define Btn12 37461
#define Btn13 37462
#define Btn14 37463
#define Btn15 37464
#define Btn16 37465
#define Btn17 37466
#define Btn18 37467
#define Btn19 37468
#define Btn20 37469
#define Btn21 37470
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5"];


createDialog "pInteraction_Menu";

disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(!isPlayer _curTarget) exitWith {closeDialog 0;}; //Bad side check?

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
_Btn11 = _display displayCtrl Btn11;
_Btn12 = _display displayCtrl Btn12;
_Btn13 = _display displayCtrl Btn13;
_Btn14 = _display displayCtrl Btn14;
_Btn15 = _display displayCtrl Btn15;
_Btn16 = _display displayCtrl Btn16;
_Btn17 = _display displayCtrl Btn17;
_Btn18 = _display displayCtrl Btn18;
_Btn19 = _display displayCtrl Btn19;
_Btn20 = _display displayCtrl Btn20;
_Btn21 = _display displayCtrl Btn21;
life_pInact_curTarget = _curTarget;
_disease = life_pInact_curTarget getVariable ["diseaseon", 1];

_Btn1 ctrlSetText format["Cool Player", life_hunger];
_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_coolPlayer; closeDialog 0;";
if((_disease) > 1) then { _Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

_Btn2 ctrlSetText format["Heat Player", life_hunger];
_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_heatPlayer; closeDialog 0;";
if((_disease) > 1) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false;};

_Btn3 ctrlSetText format["Fluid Drip", life_hunger];
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_HydratePlayer; closeDialog 0;";
if((_disease) > 1) then { _Btn3 ctrlEnable true;} else {_Btn3 ctrlEnable false;};

_Btn4 ctrlSetText format["Anti-Viral Player", life_hunger];
_Btn4 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_AntiViralPlayer; closeDialog 0;";
if((_disease) > 1) then { _Btn4 ctrlEnable true;} else {_Btn4 ctrlEnable false;};

_Btn5 ctrlSetText format["Heavy Sedative", life_hunger];
_Btn5 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_painkillerPlayer; closeDialog 0;";
if((_disease) > 1) then { _Btn5 ctrlEnable true;} else {_Btn5 ctrlEnable false;};
