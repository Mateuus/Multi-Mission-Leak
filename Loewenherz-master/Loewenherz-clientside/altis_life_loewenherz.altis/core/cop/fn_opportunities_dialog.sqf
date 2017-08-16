/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various cop actions towards another player.

	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.

	Modified for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz
	Ask us for permission to use this file www.lhzp.de
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

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];
if(dialog) exitWith {};
closeDialog 0;
waitUntil {!dialog};
createDialog "interactionmenu_loewenherz";

disableSerialization;


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


_Btn1 ctrlSetText "Wanted-Menu";
_Btn1 buttonSetAction "closeDialog 0; [] call lhm_fnc_wantedMenu;";

_Btn2 ctrlSetText "Einteilung";
_Btn2 buttonSetAction "[] spawn lhm_fnc_cop_classification_open;";

if(call lhm_coplevel > 1) then {
	_Btn3 ctrlSetText "OPL - View";
	_Btn3 buttonSetAction "closeDialog 0;[""opl""] spawn lhm_fnc_cop_classification_open;";
} else {
	_Btn3 ctrlShow false;

};

_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;
_Btn10 ctrlShow false;
