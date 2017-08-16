/*
	File: fn_civInteractionMenu.sqf
	Author: Blackd0g
	
	Description:
	Replaces the mass addactions for various civ actions towards another player.
*/
#define Btn1 2400
#define Btn2 2401
#define Btn3 2402
#define Btn4 2403
#define Btn5 2404
#define Btn6 2405
#define Btn7 2406
#define Btn8 2407
#define Btn9 2408
#define Btn10 2409
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6"];
closedialog 0;
createDialog "interactionmenu_loewenherz";

disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0; hintsilent format["Kein Ziel!"];}; //Bad target
_display = findDisplay 999;
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
lhm_pInact_curTarget = _curTarget;

//Set Unrestrain Button
If ((currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && (lhm_inv_lockpick > 0) ) then {
_Btn1 ctrlSetText "Freilassen";
_Btn1 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_unrestrain; closeDialog 0;";
} else {
_Btn1 ctrlShow false;
};

//Set Rob Player Button
_Btn2 ctrlSetText "Ausrauben";
_Btn2 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_robAction; closeDialog 0;";

//Set Knockout Button
if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !lhm_knockout && !(player getVariable["restrained",false]) && !lhm_istazed) then {
	_Btn3 ctrlSetText "Knockout";
	_Btn3 buttonSetAction "[lhm_pInact_curTarget] spawn lhm_fnc_knockoutAction; closeDialog 0;";
} else {
	_Btn3 ctrlShow false;
};

//Set Escort Button
if((currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "") then {

	if((_curTarget getVariable["Escorting",false])) then {
	_Btn4 ctrlSetText "Eskort Stop";
	_Btn4 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_stopEscorting; [lhm_pInact_curTarget] call lhm_fnc_civInteractionMenu;";
	} else {
	_Btn4 ctrlSetText "Eskort";
	_Btn4 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_escortAction; closeDialog 0;";
	};
} else {
	_Btn4 ctrlShow false;
};

//Set put player in car Button
_Btn5 ctrlSetText "In Fahrzeug";
_Btn5 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_putInCar;";	

_Btn6 ctrlShow false;
//_Btn6 ctrlSetText "Finger abschneiden";
//_Btn6 buttonSetAction "[lhm_pInact_curTarget] call lhm_fnc_cutFinger;";	

_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;
_Btn10 ctrlShow false;