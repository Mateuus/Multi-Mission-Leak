/*
	File: fn_emsInteractionMenu.sqf
*/
#define Btn1 37551
#define Btn2 37552
#define Btn3 37553
#define Btn4 37554
#define Btn5 37555
#define Btn6 37556
#define Btn7 37557
#define Btn8 37558
#define Btn9 37559
#define Btn10 37560

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_diseaseon","_koildebiiii","_koildebiii","_koildebii","_koildebi","_koildeb"];
if(!dialog) then {
	createDialog "medicInteraction_Menu";
};
disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(!isPlayer _curTarget) exitWith {closeDialog 0;}; //Bad side check?

_display = findDisplay 37500;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
life_pInact_curTarget = _curTarget;

_Btn1 ctrlSetText localize "STR_pInAct_Escort";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";

_Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_emsInteractionMenu; closeDialog 0;";

_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";

_Btn4 ctrlSetText localize "STR_pInAct_ApplyAirKit";
_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_ApplyAir; [life_pInact_curTarget] call life_fnc_emsInteractionMenu;";
if(life_inv_airkit > 0) then { _Btn5 ctrlEnable true; } else { _Btn5 ctrlEnable false; };

_Btn5 ctrlSetText "Severe Injuries";
_Btn5 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_emsInteractionMenu;";
if((life_pInact_curTarget getVariable["severeInjuries",FALSE])) then { _Btn5 ctrlEnable true;} else { _Btn5 ctrlEnable false; _Btn5 ctrlSetText "No Severe Injuries";};
